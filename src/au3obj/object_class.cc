#include "object_class.h"

AutoItObjectClass::AutoItObjectClass(void): ref_count(0), wanted(FALSE)
{
	autoit_object = new AutoItObject;
	autoit_object->AddRef();
}

AutoItObjectClass::~AutoItObjectClass(void)
{
	if (!this->wanted) autoit_object->Release();
}

ULONG AutoItObjectClass::AddRef()
{
	return ++ref_count;
}


ULONG AutoItObjectClass::Release()
{
	if (!--ref_count)
	{
		// Commit suicide!
		// This may seems strange but it's ok as long as we don't touch ourself after the delete line.
		// More info: http://www.parashift.com/c++-faq-lite/freestore-mgmt.html#faq-16.15
		delete this;
		return 0;
	}
	return ref_count;
}


HRESULT AutoItObjectClass::QueryInterface(const IID &riid, void **ppvObject)
{
	return E_NOINTERFACE;
}


HRESULT AutoItObjectClass::GetTypeInfoCount(UINT *pctinfo)
{
	return E_NOTIMPL;
}


HRESULT AutoItObjectClass::GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo **ppTInfo)
{
	return E_NOTIMPL;
}


HRESULT AutoItObjectClass::GetIDsOfNames(const IID &riid, LPOLESTR *rgszNames, UINT cNames, LCID lcid, DISPID *rgDispId)
{
	if (Compare(L"Object",rgszNames[0])==0)
	{
		*rgDispId = -100;
	}
	else if (Compare(L"Create", rgszNames[0])==0)
	{
		*rgDispId = -101;
	}
	else if (Compare(L"AddMethod",rgszNames[0])==0)
	{
		*rgDispId = -102;
	}
	else if (Compare(L"AddProperty",rgszNames[0])==0)
	{
		*rgDispId = -103;
	}
	else if (Compare(L"AddDestructor",rgszNames[0])==0)
	{
		*rgDispId = -104;
	}
	else if (Compare(L"AddEnum",rgszNames[0])==0)
	{
		*rgDispId = -105;
	}
	else if (Compare(L"RemoveMember",rgszNames[0])==0)
	{
		*rgDispId = -106;
	}
	else
	{
		return DISP_E_UNKNOWNNAME;
	}
	return S_OK;
}


HRESULT AutoItObjectClass::Invoke(DISPID dispIdMember, const IID &riid, LCID lcid, WORD wFlags, DISPPARAMS *pDispParams, VARIANT *pVarResult, EXCEPINFO *pExcepInfo, UINT *puArgErr)
{
	// Check wFlags
	if (dispIdMember == -100) // if 'Object' property
	{
		if (!(wFlags & DISPATCH_PROPERTYGET)) return DISP_E_EXCEPTION;
	}
	else // anything else is some method
	{
		if (!(wFlags & DISPATCH_METHOD)) return DISP_E_EXCEPTION;
	}
	// Special case
	if ((this->wanted) && (dispIdMember != -101)) return DISP_E_BADCALLEE; // after accessing the object only creation of the new one is allowed
	// Process...
	switch (dispIdMember) 
	{
		case (-100): // Object property
		{
			if (pDispParams->cArgs) return DISP_E_BADPARAMCOUNT; // no params allowed
			VariantClear(pVarResult);
			pVarResult->vt = VT_DISPATCH;
			pVarResult->pdispVal = this->autoit_object;
			this->wanted = TRUE;
			return S_OK;
		} break;
		case (-101): // Create method
		{
			if (pDispParams->cArgs) return DISP_E_BADPARAMCOUNT; // no params allowed
			if (!this->wanted) this->autoit_object->Release(); // if this object wasn't required then release it
			this->autoit_object = new AutoItObject;
			this->autoit_object->AddRef();
			this->wanted = FALSE; // predefine for this
			return S_OK;
		} break;
		case (-102): // AddMethod method
		{
			if (((pDispParams->cArgs!=2) && (pDispParams->cArgs!=3))) return DISP_E_BADPARAMCOUNT; // 2 or 3 params allowed
			if ((pDispParams->rgvarg[pDispParams->cArgs-1].vt!=VT_BSTR)|(pDispParams->rgvarg[pDispParams->cArgs-2].vt!=VT_BSTR)) return DISP_E_BADVARTYPE; // method name and function name are passed as string
			AutoItElement::SCOPE scope=AutoItElement::PUBLIC;
			if (pDispParams->cArgs==3)
			{
				if (pDispParams->rgvarg[0].boolVal) scope=AutoItElement::PRIVATE;
			}
			this->autoit_object->AddMethod(reinterpret_cast<LPWSTR>(pDispParams->rgvarg[pDispParams->cArgs-1].bstrVal),
				reinterpret_cast<LPWSTR>(pDispParams->rgvarg[pDispParams->cArgs-2].bstrVal),
				scope);
			return S_OK;
		} break;
		case (-103): // AddProperty method
		{
			if (((!pDispParams->cArgs) || (pDispParams->cArgs>3))) return DISP_E_BADPARAMCOUNT; // 1, 2 or 3 params allowed
			if (pDispParams->rgvarg[pDispParams->cArgs-1].vt!=VT_BSTR) return DISP_E_BADVARTYPE; // property name is passed as string
			AutoItElement::SCOPE scope=AutoItElement::PUBLIC;
			if (pDispParams->cArgs>1)
			{
				scope = static_cast<AutoItElement::SCOPE>(pDispParams->rgvarg[pDispParams->cArgs-2].ulVal);
			}
			VARIANT *data = NULL;
			if (pDispParams->cArgs==3) data = &pDispParams->rgvarg[0];
			this->autoit_object->AddProperty(reinterpret_cast<LPWSTR>(pDispParams->rgvarg[pDispParams->cArgs-1].bstrVal),
				scope,
				data);
			return S_OK;
		} break;
		case (-104): // AddDestructor method
		{
			if (pDispParams->cArgs!=1) return DISP_E_BADPARAMCOUNT; // 1 param allowed
			if (pDispParams->rgvarg[0].vt!=VT_BSTR) return DISP_E_BADVARTYPE; // function name is passed as string
			this->autoit_object->AddMethod(L"~",
				reinterpret_cast<LPWSTR>(pDispParams->rgvarg[0].bstrVal),
				AutoItElement::PUBLIC);
			return S_OK;
		} break;
		case (-105): // AddEnum method
		{
			if (((pDispParams->cArgs!=2) && (pDispParams->cArgs!=3))) return DISP_E_BADPARAMCOUNT; // 2 or 3 params allowed

			if ((pDispParams->rgvarg[pDispParams->cArgs-1].vt!=VT_BSTR)|(pDispParams->rgvarg[pDispParams->cArgs-2].vt!=VT_BSTR)) return DISP_E_BADVARTYPE; // only strings allowed
			LPWSTR function_skip = L"";
			if (pDispParams->cArgs==3)
			{
				if (pDispParams->rgvarg[0].vt!=VT_BSTR) return DISP_E_BADVARTYPE; // only string allowed
				function_skip = reinterpret_cast<LPWSTR>(pDispParams->rgvarg[0].bstrVal);
			}
			this->autoit_object->AddEnum(reinterpret_cast<LPWSTR>(pDispParams->rgvarg[pDispParams->cArgs-1].bstrVal),
				reinterpret_cast<LPWSTR>(pDispParams->rgvarg[pDispParams->cArgs-2].bstrVal),
				function_skip);
			return S_OK;
		} break;
		case (-106): // RemoveMember method
		{
			if (pDispParams->cArgs!=1) return DISP_E_BADPARAMCOUNT; // 1 param allowed
			if (pDispParams->rgvarg[0].vt!=VT_BSTR) return DISP_E_BADVARTYPE; // only string is alloved to be passed
			LPWSTR member = reinterpret_cast<LPWSTR>(pDispParams->rgvarg[0].bstrVal);
			if (Compare(L"__default__",member)==0) return DISP_E_TYPEMISMATCH; // __default__ not allowed to be removed
			this->autoit_object->RemoveMember(member);
			return S_OK;
		} break;
	}
	return DISP_E_MEMBERNOTFOUND;
}














