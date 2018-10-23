#include "stdio.h"
#include "object.h"
#include "dll.h"

AUTOITFUNCTIONPROXY AutoItObject::AutoItFunctionProxy=NULL;

void AutoItObject::Init(AUTOITFUNCTIONPROXY proxy_function)
{
	AutoItFunctionProxy = proxy_function;
}

AutoItObject::AutoItObject(void): ref_count(0), in_object(0), enumfn_next(NULL), enumfn_reset(NULL), enumfn_skip(NULL), lastmethod(NULL)
{
	VariantInit(&v_paramarray);
	VariantInit(&v_error);
	VariantInit(&v_result);
	VariantInit(&v_propcall);

	AutoItElement *elem = new AutoItElement;
	elem->SetType(AutoItElement::NOTHING); // empty type
	elem->SetScope(AutoItElement::PRIVATE); // no access
	elem->SetName(L"__default__");
	this->AddMember(elem);

}
AutoItObject::AutoItObject(AutoItObject* a): ref_count(0), in_object(0), enumfn_next(NULL), enumfn_reset(NULL), enumfn_skip(NULL), lastmethod(NULL)
{
	VariantInit(&v_paramarray);
	VariantInit(&v_error);
	VariantInit(&v_result);
	VariantInit(&v_propcall);
	for (unsigned int i=0;i<a->members.size();i++){
		AutoItElement *elem = new AutoItElement;
		AutoItElement *old = a->members.at(i);
		elem->SetType(old->GetType());
		elem->SetData(old->GetData());
		elem->SetScope(old->GetScope());
		elem->SetName(old->GetName());
		this->AddMember(elem);
	}
	if (a->enumfn_next != NULL) this->AddEnum(a->enumfn_next, a->enumfn_reset, a->enumfn_skip);
}

AutoItObject::~AutoItObject(void)
{
	// vector<T>::clear doesn't delete pointers.
	for (unsigned int i=0;i<members.size();i++){
		delete members.at(i);
	}
	members.clear();
	VariantClear(&v_paramarray);
	VariantClear(&v_result);
	VariantClear(&v_error);
	if (enumfn_next) delete [] enumfn_next;
	if (enumfn_reset) delete [] enumfn_reset;
	if (enumfn_skip) delete [] enumfn_skip;

}

ULONG AutoItObject::AddRef()
{
	return ++ref_count;
}



ULONG AutoItObject::Release()
{
	if (!--ref_count)
	{

		if (AutoItObject::AutoItFunctionProxy!=NULL)// && !IsBadCodePtr(FARPROC(AutoItFunctionProxy)))
		{
			this->in_object++;
			SAFEARRAYBOUND rgsabound[1];
			rgsabound[0].lLbound = 0;
			rgsabound[0].cElements = 2; // two elements in array
			this->ref_count++;
			for (unsigned int i=this->members.size()-1;i>0;i--){
				if (this->members.at(i)->GetName()[0]=='~')
				{
					VariantClear(&v_paramarray);
					//Make SafeArray for params ("CallArgArray" and this)
					v_paramarray.parray = SafeArrayCreate(VT_VARIANT, 1, rgsabound);;
					v_paramarray.vt = (VT_ARRAY | VT_VARIANT);
					// Switch to script...
					AutoItFunctionProxy(this->members.at(i)->GetData()->bstrVal, this);
				}
			}
			VariantClear(&v_result);
			VariantClear(&v_paramarray);
			this->in_object--;
		}

		// Commit suicide!
		// This may seems strange but it's ok as long as we don't touch ourself after the delete line.
		// More info: http://www.parashift.com/c++-faq-lite/freestore-mgmt.html#faq-16.15
		delete this;
		return 0;
	}
	return ref_count;
}

HRESULT AutoItObject::QueryInterface(const IID &riid, void **ppvObject)
{
	if (riid == IID_IUnknown || riid == IID_IDispatch )
	{
		this->AddRef();
		*ppvObject = this;
		return S_OK;
	}
	return E_NOINTERFACE;
}

HRESULT AutoItObject::GetTypeInfoCount(UINT *pctinfo)
{
	if (pctinfo) *pctinfo = 0;
    return S_OK;
}

HRESULT AutoItObject::GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo **ppTInfo)
{
	if (ppTInfo) *ppTInfo = NULL;
    return S_OK;
}

HRESULT AutoItObject::GetIDsOfNames(const IID &riid, LPOLESTR *rgszNames, UINT cNames, LCID lcid, DISPID *rgDispId)
{
	if (Compare(L"__bridge__",rgszNames[0])==0) {
		*rgDispId = -900;
	}else if (Compare(L"__params__",rgszNames[0])==0) {
		*rgDispId = -901;
	}else if (Compare(L"__error__",rgszNames[0])==0) {
		*rgDispId = -902;
	}else if (Compare(L"__result__",rgszNames[0])==0) {
		*rgDispId = -903;
	}else if (Compare(L"__propcall__",rgszNames[0])==0) {
		*rgDispId = -904;
	}else if (Compare(L"__name__",rgszNames[0])==0) {
		*rgDispId = -905;
	}else { // Search through members
		*rgDispId = this->FindMember(rgszNames[0]);
	}
	if 	(*rgDispId == -1) return DISP_E_UNKNOWNNAME;
	return S_OK;
}


HRESULT AutoItObject::Invoke(DISPID dispIdMember, const IID &riid, LCID lcid, WORD wFlags, DISPPARAMS *pDispParams, VARIANT *pVarResult, EXCEPINFO *pExcepInfo, UINT *puArgErr)
{
	if ((wFlags & DISPATCH_METHOD) || wFlags & DISPATCH_PROPERTYGET) {
		if (dispIdMember==-900 && (pDispParams->cArgs==1)) // __bridge__
		{
			INT vt = pDispParams->rgvarg[0].vt;
#ifdef _M_X64
			if (vt == VT_UI4 || vt==VT_I4) {
				VariantChangeType(pDispParams->rgvarg,pDispParams->rgvarg,0, VT_UI8);
			} else if (  vt != VT_PTR && vt != VT_UI8 && vt != VT_I8 ){
				return DISP_E_TYPEMISMATCH;
			}
#else
			if (vt == VT_UI8 || vt==VT_I8) {
				VariantChangeType(pDispParams->rgvarg,pDispParams->rgvarg,0, VT_UI4);
			} else if ( vt != VT_PTR && vt != VT_UI4 && vt != VT_I4 ) {
				return DISP_E_TYPEMISMATCH;
			}
#endif
			VariantCopy(pVarResult, (VARIANT*)(pDispParams->rgvarg[0].byref));
			return S_OK;

		} else if (dispIdMember == -901 && this->in_object) { // __params__
			VARIANT* pData;
			if (SafeArrayAccessData(v_paramarray.parray, (void**)&pData) == S_OK) {
				pData[0].vt = VT_BSTR;
				pData[0].bstrVal = SysAllocString(L"CallArgArray"); // new every time since it's freed every time
				pData[1].vt = VT_DISPATCH;
				pData[1].pdispVal = this;
				this->AddRef(); //++ref_count; // because Release() is called when v_paramarray is cleared
			    SafeArrayUnaccessData(v_paramarray.parray);
			}
			VariantCopy(pVarResult, &v_paramarray);
			return S_OK;
		} else if (dispIdMember == -902) { // __error__
			VariantCopy(pVarResult, &v_error);
			return S_OK;
		} else if (dispIdMember == -904 && this->in_object) { // __propcall__
			VariantCopy(pVarResult, &v_propcall);
			return S_OK;
		} else if (dispIdMember == -905 && this->in_object) { // __name__
			VariantClear(pVarResult);
			pVarResult->vt = VT_BSTR;
			pVarResult->bstrVal = SysAllocString(this->lastmethod);
			return S_OK;
		} 
	} else if ((wFlags & DISPATCH_PROPERTYPUT) || (wFlags & DISPATCH_PROPERTYPUTREF)) {
		if (dispIdMember == -900 && pDispParams->cArgs == 2) { // __bridge__
			BOOL f_first = (DISPID_PROPERTYPUT == pDispParams->rgdispidNamedArgs[0]);
			INT vt = pDispParams->rgvarg[(f_first?1:0)].vt;
#ifdef _M_X64
			if (vt == VT_UI4 || vt==VT_I4) {
				VariantChangeType(&pDispParams->rgvarg[(f_first?1:0)],&pDispParams->rgvarg[(f_first?1:0)],0, VT_UI8);
			} else if (  vt != VT_PTR && vt != VT_UI8 && vt != VT_I8 ){
				return DISP_E_TYPEMISMATCH;
			}
#else
			if (vt == VT_UI8 || vt==VT_I8) {
				VariantChangeType(&pDispParams->rgvarg[(f_first?1:0)],&pDispParams->rgvarg[(f_first?1:0)],0, VT_UI4);
			} else if ( vt != VT_PTR && vt != VT_UI4 && vt != VT_I4 ) {
				return DISP_E_TYPEMISMATCH;
			}
#endif
			VariantCopy((VARIANT*)(pDispParams->rgvarg[(f_first?1:0)].byref), &pDispParams->rgvarg[(f_first?0:1)]);
			return S_OK;
		} else if (dispIdMember == -902 && this->in_object) { // __error__
			VariantCopy(&this->v_error, &pDispParams->rgvarg[0]);
			return S_OK;
		} else if (dispIdMember == -903 && this->in_object) { // __result__
			VariantCopy(&this->v_result, &pDispParams->rgvarg[0]);
			return S_OK;
		}
	}

	if ((dispIdMember<0) || (dispIdMember >= (DISPID)this->members.size()+1) ) return DISP_E_MEMBERNOTFOUND;
	AutoItElement *elem = this->members.at(dispIdMember);
	BOOL success;
	LONG propcall_old;
	if ((wFlags & DISPATCH_METHOD) || (wFlags & DISPATCH_PROPERTYGET)) {

		switch (elem->GetType())
		{
		case AutoItElement::METHOD:
			if (!(elem->GetScope() == AutoItElement::PUBLIC) && (this->in_object == 0)) return DISP_E_MEMBERNOTFOUND;
			// Assume it's a BSTR
			this->in_object += 1;
			this->lastmethod = elem->GetName();

			// copy params to a SafeArray.
			VariantClear(&v_paramarray);
			VariantClear(&v_result);
			SAFEARRAY * psa;
			SAFEARRAYBOUND rgsabound[1];
			INT cArgCount; cArgCount= pDispParams->cArgs;
			rgsabound[0].lLbound = 0;
			rgsabound[0].cElements = cArgCount +2;
			psa = SafeArrayCreate(VT_VARIANT, 1, rgsabound);
			VARIANT* pData;
			if (SafeArrayAccessData(psa, (void**)&pData) == S_OK) {
				// first two elements will be filled when __params__ is accessed
				for (int bound=0; bound < cArgCount; bound++) {
					VariantInit(&pData[bound+2]);
					VariantCopy(&pData[bound+2], &pDispParams->rgvarg[cArgCount-bound-1]);
				}
				SafeArrayUnaccessData(psa);
			}
			v_paramarray.parray = psa;
			v_paramarray.vt = (VT_ARRAY | VT_VARIANT);
			// end paramcopy
			v_propcall.vt=VT_I4;
			propcall_old = v_propcall.lVal;
			v_propcall.lVal=0;
			success = AutoItFunctionProxy(static_cast<LPCWSTR>(elem->GetData()->bstrVal),this);
			v_propcall.lVal= propcall_old;
			if (pVarResult != NULL) VariantCopy(pVarResult, &this->v_result);
			VariantClear(&this->v_paramarray);
			VariantClear(&this->v_result);
			this->in_object -= 1;
			if (!success) return DISP_E_MEMBERNOTFOUND;
			return S_OK;
			break;
		case AutoItElement::PROPERTY:
			if ((elem->GetScope() == AutoItElement::PRIVATE) && (this->in_object == 0)) return DISP_E_MEMBERNOTFOUND;
			// 1D array direct access
			if (pDispParams->cArgs == 1) {
				VARIANT *data;
				data = elem->GetData();
				if (data->vt == (VT_ARRAY|VT_VARIANT) && 1==SafeArrayGetDim(data->parray)) {
					if (VT_I4 != pDispParams->rgvarg[0].vt)
						VariantChangeType(&pDispParams->rgvarg[0], &pDispParams->rgvarg[0], 0, VT_I4);
					if (pDispParams->rgvarg[0].lVal == -1) {
						VariantClear(pVarResult);
						pVarResult->vt = VT_I4;
						SafeArrayGetUBound(data->parray, 1, &pVarResult->lVal);
						++pVarResult->lVal;
						return S_OK;
					} else if (0 == SafeArrayGetElement(data->parray, &pDispParams->rgvarg[0].lVal, pVarResult)) {
						return S_OK;
					} else {
						return DISP_E_EXCEPTION;
					}
				}
				// 2D array direct access
			} else if (pDispParams->cArgs == 2) {
				VARIANT *data;
				LONG ix[2];
				data = elem->GetData();
				if (data->vt == (VT_ARRAY|VT_VARIANT) && 2==SafeArrayGetDim(data->parray)) {
					if (VT_I4 != pDispParams->rgvarg[0].vt)
						VariantChangeType(&pDispParams->rgvarg[0], &pDispParams->rgvarg[0], 0, VT_I4);
					if (VT_I4 != pDispParams->rgvarg[1].vt)
						VariantChangeType(&pDispParams->rgvarg[1], &pDispParams->rgvarg[1], 0, VT_I4);
					ix[0] = pDispParams->rgvarg[0].lVal;
					ix[1] = pDispParams->rgvarg[1].lVal;
					if (ix[1] == -1) {
						VariantClear(pVarResult);
						pVarResult->vt = VT_I4;
						SafeArrayGetUBound(data->parray, (ix[0]==2)?1:2, &pVarResult->lVal);
						++pVarResult->lVal;
						return S_OK;
					} else if (0 == SafeArrayGetElement(data->parray, ix, pVarResult)) {
						return S_OK;
					} else {
						return DISP_E_EXCEPTION;
					}
				}
			}
			// end
			if (pDispParams->cArgs != 0) return DISP_E_BADPARAMCOUNT;
			if (pVarResult != NULL) VariantCopy(pVarResult, elem->GetData());
			return S_OK;
			break;

		}
	} else if ((wFlags & DISPATCH_PROPERTYPUT) || (wFlags & DISPATCH_PROPERTYPUTREF)) {
		if (!(elem->GetScope() == AutoItElement::PUBLIC) && (this->in_object == 0)) return DISP_E_MEMBERNOTFOUND;
		switch (elem->GetType())
		{
		case AutoItElement::METHOD: // methods can be called with ine param as property, too.
			// Assume it's a BSTR
			this->in_object += 1;
			this->lastmethod = elem->GetName();

			// copy params to a SafeArray.
			VariantClear(&v_paramarray);
			VariantClear(&v_result);
			SAFEARRAY * psa;
			SAFEARRAYBOUND rgsabound[1];
			INT cArgCount; cArgCount= pDispParams->cArgs;
			rgsabound[0].lLbound = 0;
			rgsabound[0].cElements = cArgCount +2;
			psa = SafeArrayCreate(VT_VARIANT, 1, rgsabound);
			VARIANT* pData;
			if (SafeArrayAccessData(psa, (void**)&pData) == S_OK) {
				// first two elements will be filled when __params__ is accessed
				for (int bound=0; bound < cArgCount; bound++) {
					VariantInit(&pData[bound+2]);
					VariantCopy(&pData[bound+2], &pDispParams->rgvarg[cArgCount-bound-1]);
				}
				SafeArrayUnaccessData(psa);
			}
			v_paramarray.parray = psa;
			v_paramarray.vt = (VT_ARRAY | VT_VARIANT);
			// end paramcopy
			v_propcall.vt=VT_I4;
			propcall_old = v_propcall.lVal;
			v_propcall.lVal=1;
			success = AutoItFunctionProxy(static_cast<LPCWSTR>(elem->GetData()->bstrVal),this);
			v_propcall.lVal= propcall_old;
			if (pVarResult != NULL) VariantCopy(pVarResult, &this->v_result);
			VariantClear(&this->v_paramarray);
			VariantClear(&this->v_result);
			this->in_object -= 1;
			if (!success) return DISP_E_MEMBERNOTFOUND;
			return S_OK;
			break;
		case AutoItElement::PROPERTY:
			// 1D array direct access
			if (pDispParams->cArgs == 2) {
				VARIANT *data;
				data = elem->GetData();
				if (data->vt == (VT_ARRAY|VT_VARIANT) && 1==SafeArrayGetDim(data->parray)) {
					BOOL f_first = (DISPID_PROPERTYPUT == pDispParams->rgdispidNamedArgs[0]);
					if (VT_I4 != pDispParams->rgvarg[(f_first?1:0)].vt)
						VariantChangeType(&pDispParams->rgvarg[(f_first?1:0)], &pDispParams->rgvarg[(f_first?1:0)], 0, VT_I4);
					if (0 == SafeArrayPutElement(data->parray, &pDispParams->rgvarg[(f_first?1:0)].lVal, &pDispParams->rgvarg[(f_first?0:1)])) {
						return S_OK;
					} else {
						return DISP_E_EXCEPTION;
					}
				}
				// 2D array direct access
			} else if (pDispParams->cArgs == 3) {
				VARIANT *data;
				LONG ix[2];
				data = elem->GetData();
				if (data->vt == (VT_ARRAY|VT_VARIANT) && 2==SafeArrayGetDim(data->parray)) {
					BOOL f_first = (DISPID_PROPERTYPUT == pDispParams->rgdispidNamedArgs[0]);
					if (VT_I4 != pDispParams->rgvarg[(f_first?2:0)].vt)
						VariantChangeType(&pDispParams->rgvarg[(f_first?2:0)], &pDispParams->rgvarg[(f_first?2:0)], 0, VT_I4);
					if (VT_I4 != pDispParams->rgvarg[1].vt)
						VariantChangeType(&pDispParams->rgvarg[1], &pDispParams->rgvarg[1], 0, VT_I4);
					ix[0] = pDispParams->rgvarg[f_first?1:0].lVal;
					ix[1] = pDispParams->rgvarg[f_first?2:1].lVal;
					if (0 == SafeArrayPutElement(data->parray, ix, &pDispParams->rgvarg[(f_first?0:2)])) {
						return S_OK;
					} else {
						return DISP_E_EXCEPTION;
					}
				}
			}
			// end
			if (pDispParams->cArgs != 1) return DISP_E_BADPARAMCOUNT;
			elem->SetData(&pDispParams->rgvarg[0]);
			return S_OK;
			break;
		}
	}


	return DISP_E_MEMBERNOTFOUND;
}

DISPID AutoItObject::FindMember(wchar_t* name)
{
	// Search through members
	for (unsigned int i=0;i<this->members.size();i++){
		//if (_wcsicmp(this->members.at(i)->GetName(),name)==0)
		if (Compare(this->members.at(i)->GetName(),name)==0)
		{
			return i;
		}
	}
	return -1;
}

void AutoItObject::RemoveMember(wchar_t* name)
{
	DISPID index = this->FindMember(name);
	if (index > -1) {
		delete members.at(index);
		members.erase(index);
	}
}

void AutoItObject::AddMethod(wchar_t* method,wchar_t* value, AutoItElement::SCOPE new_scope)
{
	AutoItElement *elem = new AutoItElement;
	elem->SetType(AutoItElement::METHOD);
	elem->SetScope(new_scope);
	elem->SetName(method);
	elem->SetData(value);
	this->AddMember(elem);
}

void AutoItObject::AddProperty(wchar_t* property_name,  AutoItElement::SCOPE new_scope, VARIANT* property_value)
{
	AutoItElement *elem = new AutoItElement;
	elem->SetType(AutoItElement::PROPERTY);
	if (property_value != NULL)elem->SetData(property_value);
	elem->SetScope(new_scope);
	elem->SetName(property_name);
	this->AddMember(elem);
}

void AutoItObject::AddMember(AutoItElement *new_member)
{
	DISPID index = this->FindMember(new_member->GetName());
	//if (index == -1 || wcscmp(L"~",new_member->GetName())==0) {
	if (index == -1 || new_member->GetName()[0]=='~') {
		this->members.push_back(new_member);
	} else {
		delete members.at(index);
		members[index] = new_member;
	}
}

void AutoItObject::AddEnum(wchar_t* function_next, wchar_t* function_reset, wchar_t* function_skip)
{
	if (enumfn_next) delete [] enumfn_next;
	enumfn_next = new wchar_t[lstrlenW(function_next)+1];
	lstrcpyW(enumfn_next,function_next);

	if (enumfn_reset) delete [] enumfn_reset;
	enumfn_reset = new wchar_t[lstrlenW(function_reset)+1];
	lstrcpyW(enumfn_reset,function_reset);

	if (enumfn_skip) delete [] enumfn_skip;
	enumfn_skip = new wchar_t[lstrlenW(function_skip)+1];
	lstrcpyW(enumfn_skip,function_skip);
}
