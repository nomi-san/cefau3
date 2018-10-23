#include "wrap_object.h"
#include "dll.h"
#include "stdio.h"
#include <Shlwapi.h>

#pragma comment( lib , "Shlwapi.lib")
#pragma warning( disable : 4244 ) // this to that; it's deliberate

AutoItWrapObject::AutoItWrapObject(IUnknown* new_object, bool no_unknown, bool is_DllCallObject): ref_count(0), in_object(0), fCallFree(0)
{
	if (no_unknown) is_unkown = false;
	else is_unkown = true;
	wrapped_object = new_object;
	this->fDLLCallObject = is_DllCallObject;
	if (this->fDLLCallObject)
	{
		AutoItWrapElement *elem = new AutoItWrapElement();
		this->members.push_back(elem);;
	}
	VariantInit(&v_paramarray);
}


AutoItWrapObject::AutoItWrapObject(IUnknown* new_object, wchar_t *methods, bool no_unknown, bool fFreeMem, bool is_DllCallObject): ref_count(0), in_object(0), hDLL(0), sFunctionName(NULL)
{
	if (no_unknown) this->is_unkown = false;
	else this->is_unkown = true;
	VariantInit(&v_paramarray);
	this->wrapped_object = new_object;
	this->fCallFree = fFreeMem;
	this->fDLLCallObject = is_DllCallObject;
	wchar_t *mt_name = methods, *mt_params=NULL;
	ULONG index=0, len=lstrlenW(methods);
	AutoItWrapElement *elem;
	for (ULONG i = 0; i <= len; i++) {
		if (methods[i] == '|') {
			methods[i] = '\0';
			mt_params = &methods[i+1];
		}else if (methods[i] == '\n' || methods[i] == '\0') {
			methods[i] = '\0';
			elem = new AutoItWrapElement();
			elem->SetName(mt_name);
			elem->SetTypes(mt_params);
			elem->SetIndex(index);
			this->members.push_back(elem);
			++index;
			mt_name = &methods[i+1];
		}
	}
}


AutoItWrapObject::~AutoItWrapObject(void)
{
	// vector<T>::clear doesn't delete pointers.
	for (unsigned int i=0;i<members.size();i++){
		delete members.at(i);
	}
	this->members.clear();
	VariantClear(&v_paramarray);
	if (this->is_unkown) this->wrapped_object->Release();
	if (this->hDLL != NULL) FreeLibrary(this->hDLL);
	if (this->sFunctionName) delete [] this->sFunctionName;
	if (this->fCallFree) CoTaskMemFree(this->wrapped_object);
}


ULONG AutoItWrapObject::AddRef()
{
	return ++ref_count;
}


ULONG AutoItWrapObject::Release()
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


HRESULT AutoItWrapObject::QueryInterface(const IID &riid, void **ppvObject)
{
	if (riid == IID_IUnknown)
	{
		// Check if wrapped object is IUnknown
		if (this->is_unkown)
		{
			this->wrapped_object->AddRef();
			*ppvObject = this->wrapped_object;
			return S_OK;
		}
		return E_NOTIMPL;
	}
	else if (riid == IID_IDispatch)
	{
		if (this->is_unkown) this->wrapped_object->AddRef();
		this->AddRef();
		*ppvObject = this;
		return S_OK;
	}
	// If some other interface pointer is asked for...
	else
	{
		// ...and if wrapped object is IUnknown...
		if (this->is_unkown)
		{
			// ...transfer the call to the wrapped object.
			return this->wrapped_object->QueryInterface(riid, ppvObject);
		}
	}
	// If here no such interface is supported
	return E_NOINTERFACE;
}


HRESULT AutoItWrapObject::GetTypeInfoCount(UINT *pctinfo)
{
	if (pctinfo) *pctinfo = 0;
    return S_OK;
}


HRESULT AutoItWrapObject::GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo **ppTInfo)
{
	if (ppTInfo) *ppTInfo = NULL;
    return S_OK;
}


HRESULT AutoItWrapObject::GetIDsOfNames(const IID &riid, LPOLESTR *rgszNames, UINT cNames, LCID lcid, DISPID *rgDispId)
{
	if (Compare(L"__ptr__", rgszNames[0]) == 0) {
		*rgDispId = -804;
	}else // Search through members
	{
		// Special case is DLLCallObject
		if (this->fDLLCallObject)
		{
			// Setting sFunctionName property to reguested function name
			if (!!!this->SetFunctionName(rgszNames[0])) return DISP_E_EXCEPTION;
			
			// If functions names are not listed in advance return sucess. Possible errors will be detected and handled inside Invoke.
			if (this->members.at(0)->GetName() == NULL) return S_OK;
			// Else either "ltag" or "dtag" are supplied and searching is done below...
		}
		// Search for member:
		*rgDispId = this->FindMember(rgszNames[0]);
	}
	if 	(*rgDispId == -1) return DISP_E_UNKNOWNNAME;
	return S_OK;
}


HRESULT AutoItWrapObject::Invoke(DISPID dispIdMember, const IID &riid, LCID lcid, WORD wFlags, DISPPARAMS *pDispParams, VARIANT *pVarResult, EXCEPINFO *pExcepInfo, UINT *puArgErr)
{
	if ((wFlags & DISPATCH_METHOD) || wFlags & DISPATCH_PROPERTYGET) {
		if (dispIdMember == -804) {
			VariantClear(pVarResult);
			pVarResult->vt = VT_UI4;
			if (sizeof(void *) == 8) pVarResult->vt = VT_UI8;
			pVarResult->byref = (void*)this->wrapped_object;
			return S_OK;
		}
	}

	if (!this->fDLLCallObject)
	{
		if ((dispIdMember<0) || (dispIdMember >= (DISPID)this->members.size()) ) return DISP_E_MEMBERNOTFOUND;
	}

	if ((wFlags & DISPATCH_METHOD) || (wFlags & DISPATCH_PROPERTYGET)) {
		AutoItWrapElement* elem = this->members.at(dispIdMember);
		INT cArgCount= pDispParams->cArgs + elem->specparamcount; // overall number of parameters
		if (cArgCount%2==0) return DISP_E_BADPARAMCOUNT; // should be uneven number (ret type + pairs of type/values)
		// Increment 'inobject' count
		++this->in_object;
		// number of pairs (type/value) of passed parameters
		INT ifuncparams = (cArgCount-1)/2; // overall number of params minus first one (ret). Divided by 2 because they come in pairs, e.g. ..."dword", 3...
		// Construct parameters for DispCallFunc function
		VARTYPE *prgvt = new VARTYPE[ifuncparams]; // array of vartypes (for DispCallFunc)
		VARIANTARG** prgpvarg = new VARIANTARG*[ifuncparams]; // array of variants (for DispCallFunc)
		PVOID *aux = new PVOID[ifuncparams]; // array of pointers (to store pointers for buffers to create)
		INT index=0;
		VARTYPE isubtype = VT_ILLEGAL; // preset
		VARIANTARG *subvariant = new VARIANTARG[ifuncparams]; // create as many (sub) variants as it may be needed in the worst case
		VARIANT *carrier = new VARIANT[ifuncparams]; // will use it to copy passed variant to it (to deatach from AutoIt's variant)
		VARTYPE subrettype = VT_EMPTY; // used when str or wstr are specified as ret types

		// Populate arrays with passed data.
		// For all arguments passed...
		for (INT i=cArgCount-2; i>-1; i--) // skipping first element (that's the ret value) and going backwards (COM)
		{
			if (i%2!=0) // odd elements are passed types e.g. ..."dword", 3...
			{
				if  (!elem->specparamcount) // this needs to be checked only for when calling in DllCall() manner
				{
					if (pDispParams->rgvarg[i].vt!=VT_BSTR) // param type should always be string
					{
						this->CleanOnInvoke(index, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return TYPE_E_UNDEFINEDTYPE;
					}
				}
				UINT len;
				LPWSTR wtype;
				if  (elem->specparamcount)
				{
					wtype = elem->GetTypes()[(cArgCount-i)/2]; // calculation is actually very obvious
					len = lstrlenW(wtype);
				}
				else
				{
					len = SysStringLen(pDispParams->rgvarg[i].bstrVal); // determine the len of the type string
					wtype = reinterpret_cast<LPWSTR>(pDispParams->rgvarg[i].pbstrVal); // reading BSTR as 'normal' string
				}
				VariantInit(&subvariant[index]); // initializing sub-variant
				VariantInit(&carrier[index]); // initializing carrier-variant
				if  (elem->specparamcount)
				{
					VariantCopy(&carrier[index], &pDispParams->rgvarg[(i-1)/2]); // copy passed value to carrier-variant
				}
				else
				{
					VariantCopy(&carrier[index], &pDispParams->rgvarg[i-1]); // copy passed value to carrier-variant
				}
				// Like StringRight(wtype, 1) in AutoIt
				if (wtype[len-1] == '*') //  if byref param, e.g. ..."dword*", 0...
				{
					wtype[len-1] = '\0'; // 'removing' asterisk (it's actually null-terminating at astrisk place)
					isubtype = VarType(VT_BSTR, wtype); // determining type of byref-ed param
					wtype[len-1] = '*'; // restoring it
					VariantChangeType(&subvariant[index], &subvariant[index], 0, isubtype); // subvariant[index] will be this type
					prgvt[index] = (isubtype|VT_BYREF); // setting proper vtype for the param
					/*
					Boring stuff follows.
					Every byref parameter requires internal buffer to be made.
					Pointer to that buffer is then sent to called method/function of the object.
					It's important that carrier-variant (if used) have isubtype specified as vt fileld. That's why it was created
					in the first place; AutoIt changes this on the fly to double for large numbers - wrong in my opinion.
					*/
					BOOL isbstr = (carrier[index].vt==VT_BSTR);
					if (isubtype == VT_EMPTY)
					{
						this->CleanOnInvoke(index, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return TYPE_E_UNDEFINEDTYPE;
					}
					else if (isubtype == VT_UI1)
					{
						BYTE *subbufferbyte = new BYTE[1];
						if (isbstr) // if passed value is string
						{
							subbufferbyte[0] = StringToByte(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferbyte[0] = carrier[index].bVal; // that's passed value
						}
						subvariant[index].pbVal = subbufferbyte; // pointer to byte goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferbyte;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_BOOL)
					{
						BOOL *subbufferbool = new BOOL[1];
						if (isbstr) // if passed value is string
						{
							subbufferbool[0] = StringToBool(carrier[index].bstrVal);
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferbool[0] = carrier[index].boolVal; // that's passed value
						}
						subvariant[index].pboolVal = reinterpret_cast<VARIANT_BOOL*>(subbufferbool); // pointer to bool goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferbool;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_I2)
					{
						SHORT *subbuffershort = new SHORT[1];
						if (isbstr) // if passed value is string
						{
							subbuffershort[0] = StringToShort(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbuffershort[0] = carrier[index].iVal; // that's passed value
						}
						subvariant[index].piVal = subbuffershort; // pointer to short goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbuffershort;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_UI2)
					{
						USHORT *subbufferushort = new USHORT[1];
						if (isbstr) // if passed value is string
						{
							subbufferushort[0] = StringToWord(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferushort[0] = carrier[index].uiVal; // that's passed value
						}
						subvariant[index].puiVal = subbufferushort; // pointer to ushort goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferushort;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_UI4)
					{
						UINT *subbufferuint = new UINT[1];
						if (isbstr) // if passed value is string
						{
							subbufferuint[0] = StringToDword(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferuint[0] = carrier[index].uintVal; // that's passed value
						}
						subvariant[index].puintVal = subbufferuint; // pointer to uint goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferuint;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_I4)
					{
						INT *subbufferint = new INT[1];
						if (isbstr) // if passed value is string
						{
							subbufferint[0] = StringToInt(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferint[0] = carrier[index].intVal; // that's passed value
						}
						subvariant[index].pintVal = subbufferint; // pointer to int goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferint;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_VARIANT)
					{
						VARIANT *subbuffervariant = new VARIANT[1];
						VariantInit(subbuffervariant);
						VariantCopy(subbuffervariant, &carrier[index]); // collecting (copying) passed
						subvariant[index].pvarVal = subbuffervariant; // pointer to variant goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant to variant
						aux[index] = subbuffervariant; // storing that pointer in array of pointers
					}
					else if (isubtype == VT_I8)
					{
						INT64 *subbufferint64 = new INT64[1];
						if (isbstr) // if passed value is string
						{
							subbufferint64[0] = StringToLonglong(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferint64[0] = carrier[index].llVal; // that's passed value
						}
						subvariant[index].pllVal = subbufferint64; // pointer to int64 goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferint64;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_UI8)
					{
						UINT64 *subbufferuint64 = new UINT64[1];
						if (isbstr) // if passed value is string
						{
							subbufferuint64[0] = StringToLonglong(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferuint64[0] = carrier[index].ullVal; // that's passed value
						}
						subvariant[index].pullVal = subbufferuint64; // pointer to uint64 goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferuint64;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_R4)
					{
						FLOAT *subbufferfloat = new FLOAT[1];
						if (isbstr) // if passed value is string
						{
							subbufferfloat[0] = StringToFloat(carrier[index].bstrVal);
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferfloat[0] = carrier[index].fltVal; // that's passed value
						}
						subvariant[index].pfltVal = subbufferfloat; // pointer to float goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferfloat;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_R8)
					{
						DOUBLE *subbufferdouble = new DOUBLE[1];
						if (isbstr) // if passed value is string
						{
							subbufferdouble[0] = StringToDouble(carrier[index].bstrVal);
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, isubtype);
							subbufferdouble[0] = carrier[index].dblVal; // that's passed value
						}
						subvariant[index].pdblVal = subbufferdouble; // pointer to double goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferdouble;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_LPSTR) // ..."str*", "", ...
					{
						BSTR string;
						if (carrier[index].vt==VT_BSTR)
						{
							string = carrier[index].bstrVal;
						}
						else
						{
							if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
							{
								string = carrier[index].bstrVal;
								FixDecimalSeparator(string, TRUE); // comma to dot
							}
							else
							{
								string = L""; // empty string (this would be the case if e.g. object type is passed under string)
							}
						}
						LPSTR str = new CHAR[65536]; // allocate space in the same size that AutoIt does
						WideCharToMultiByte(CP_ACP, 0, string, -1, str, 65536, NULL, NULL); // convert to ANSI string. FIXME: should 65536 be size of the 'string'?
						subvariant[index].byref = str;
						prgpvarg[index] = &subvariant[index]; // setting pointer to LPSTR variant
						aux[index] = str;
					}
					else if (isubtype == VT_LPWSTR) // ..."wstr*", "", ...
					{
						BSTR string;
						if (carrier[index].vt==VT_BSTR)
						{
							string = carrier[index].bstrVal;
						}
						else
						{
							if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
							{
								string = carrier[index].bstrVal;
								FixDecimalSeparator(string, TRUE); // comma to dot
							}
							else
							{
								string = L""; // empty string (this would be the case if e.g. object type is passed under string)
							}
						}
						LPWSTR wstr = new WCHAR[65536]; // allocate space in the same size that AutoIt does. FIXME: should this be in size of the 'string'?
						lstrcpyW(wstr, static_cast<LPWSTR>(string));
						subvariant[index].byref = wstr;
						prgpvarg[index] = &subvariant[index];
						aux[index] = wstr;
					}
					else if (isubtype == VT_BSTR) // ..."bstr*", "", ...
					{
						BSTR string;
						if (carrier[index].vt==VT_BSTR)
						{
							string = carrier[index].bstrVal;
						}
						else
						{
							if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
							{
								string = carrier[index].bstrVal;
								FixDecimalSeparator(string, TRUE); // comma to dot
							}
							else
							{
								string = L""; // empty string (this would be the case if e.g. object type is passed under string)
							}
						}
						BSTR newstring = SysAllocString(string); // Don't (!) consider SysAllocStringLen
						subvariant[index].pbstrVal = &newstring;
						prgpvarg[index] = &subvariant[index];
						aux[index] = NULL;
					}
					else if (isubtype == VT_PTR)
					{
						// AutoIt chokes on this type. I made sure we're never here.
					}
					else if (isubtype == VT_INT_PTR)
					{
						UINT64 *subbufferuint64 = new UINT64[1]; // UINT64 only because of convenience
						if (isbstr) // if passed value is string
						{
							subbufferuint64[0] = StringToLonglong(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, VT_I8); // !!!
							subbufferuint64[0] = carrier[index].ullVal; // that's passed value
						}
						subvariant[index].pullVal = subbufferuint64; // pointer to uint64 goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferuint64;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_UINT_PTR)
					{
						UINT64 *subbufferuint64 = new UINT64[1]; // UINT64 only because of convenience
						if (isbstr) // if passed value is string
						{
							subbufferuint64[0] = StringToLonglong(carrier[index].bstrVal); // reinterpreted value
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, VT_UI8); // !!!
							subbufferuint64[0] = carrier[index].ullVal; // that's passed value
						}
						subvariant[index].pullVal = subbufferuint64; // pointer to uint64 goes to variant
						prgpvarg[index] = &subvariant[index]; // pointer to variant
						aux[index] = subbufferuint64;	// storing that pointer in array of pointers
					}
					else if (isubtype == VT_DISPATCH)
					{
						IDispatch **subbufferidispatch = new IDispatch*[1];
						// Two cases here. One is if object is passed...
						if (carrier[index].vt == VT_DISPATCH)
						{
							*subbufferidispatch = carrier[index].pdispVal; // that's passed value
							// Add ref count if it's valid object
							if (carrier[index].pdispVal != 0) carrier[index].pdispVal->AddRef();
						}
						subvariant[index].ppdispVal = subbufferidispatch; // pointer to idispatch goes to variant
						prgpvarg[index] = &subvariant[index];
						aux[index] = subbufferidispatch;
					}
					else
					{
						// what is specified as parameter?!?
						this->CleanOnInvoke(index, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return TYPE_E_UNDEFINEDTYPE;
					}
				}
				else if (Compare(L"str", wtype)==0)
				{
					BSTR string;
					if (carrier[index].vt==VT_BSTR)
					{
						string = carrier[index].bstrVal;
					}
					else
					{
						if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
						{
							string = carrier[index].bstrVal;
							FixDecimalSeparator(string, TRUE); // comma to dot
						}
						else
						{
							string = L""; // empty string (this would be the case if e.g. object type is passed under string)
						}
					}
					LPSTR str = new CHAR[65536];
					WideCharToMultiByte(CP_ACP, 0, string, -1, str, 65536, NULL, NULL); // convert to ANSI string
					prgvt[index] = VT_BSTR; // setting proper vtype for the param
					subvariant[index].vt = VT_LPSTR;
					subvariant[index].byref = str;
					prgpvarg[index] = &subvariant[index]; // setting pointer to LPSTR variant
					aux[index] = str;
				}
				else if (Compare(L"wstr", wtype)==0)
				{
					BSTR string;
					if (carrier[index].vt==VT_BSTR)
					{
						string = carrier[index].bstrVal;
					}
					else
					{
						if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
						{
							string = carrier[index].bstrVal;
							FixDecimalSeparator(string, TRUE); // comma to dot
						}
						else
						{
							string = L""; // empty string (this would be the case if e.g. object type is passed under string)
						}
					}
					LPWSTR wstr = new WCHAR[65536];
					lstrcpyW(wstr, static_cast<LPWSTR>(string));
					prgvt[index] = VT_BSTR; // setting proper vtype for the param
					subvariant[index].vt = VT_LPWSTR;
					subvariant[index].byref = wstr;
					prgpvarg[index] = &subvariant[index]; // setting pointer to LPWSTR variant
					aux[index] = wstr;
				}
				else if (Compare(L"bstr", wtype)==0) // BSTR
				{
					BSTR string;
					if (carrier[index].vt==VT_BSTR)
					{
						string = carrier[index].bstrVal;
					}
					else
					{
						if (!VariantChangeType(&carrier[index], &carrier[index], 0, VT_BSTR))
						{
							string = carrier[index].bstrVal;
							FixDecimalSeparator(string, TRUE); // comma to dot
						}
						else
						{
							string = L""; // empty string (this would be the case if e.g. object type is passed under string)
						}
					}
					prgvt[index] = VT_BSTR; // setting proper vtype for the param
					subvariant[index].vt = VT_BSTR;
					subvariant[index].bstrVal = string;
					prgpvarg[index] = &subvariant[index]; // setting pointer to BSTR variant
					aux[index] = NULL;
				}
				else // not byref
				{
					if  (elem->specparamcount)
					{
						prgvt[index] = VarType(VT_BSTR, wtype); // setting proper (passed) vtype
					}
					else
					{
						prgvt[index] = VarType(pDispParams->rgvarg[i].vt, wtype); // setting proper (passed) vtype
					}
					if (prgvt[index] == VT_ILLEGAL)
					{
						// what is specified as type?!?
						this->CleanOnInvoke(index, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return TYPE_E_UNDEFINEDTYPE;
					}
					else if (prgvt[index] == VT_EMPTY) // ..."none", something... - that makes sense?
					{
						this->CleanOnInvoke(index, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return DISP_E_PARAMNOTFOUND;
					}
					BOOL isbstr = (carrier[index].vt==VT_BSTR);
					if (isbstr) // if string
					{
						BSTR string = carrier[index].bstrVal; // read string
						// Dealing with some special cases
						if (prgvt[index]==VT_BOOL)
						{
							VariantClear(&carrier[index]); // will set new value
							VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]); // proper type
							carrier[index].boolVal = StringToBool(string);
						}
						else if (prgvt[index]==VT_UI1)
						{
							VariantClear(&carrier[index]); // will set new value
							VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]); // proper type
							carrier[index].bVal = StringToByte(string);
						}
						else if (prgvt[index]==VT_R8)
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]); // proper type
							carrier[index].dblVal = StringToDouble(string);
						}
						else if (prgvt[index]==VT_R4)
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]); // proper type
							carrier[index].fltVal = StringToFloat(string);
						}
						else if (prgvt[index]==VT_VARIANT)
						{
							// Nothing. It's supposed to be this way.
						}
						else
						{
							VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]); // proper type
							carrier[index].llVal = StringToLonglong(string);
						}
					}
					else // not string
					{
						if (prgvt[index]==VT_VARIANT)
						{
							// Nothing. It's supposed to be this way.
						}
						else
						{
							if (VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index])) // changing vtype of the passed parameter (it could be interpretted differently otherwise)
							{
								if (carrier[index].vt == VT_I4)
								{
									LONG intg = carrier[index].lVal;
									VariantClear(&carrier[index]);
									VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]);
									if (prgvt[index] == VT_UI1)
									{
										carrier[index].bVal = static_cast<BYTE>(intg);
									}
									else if (prgvt[index] == VT_UI2)
									{
										carrier[index].uiVal = static_cast<USHORT>(intg);
									}
									else if (prgvt[index] == VT_I2)
									{
										carrier[index].iVal = static_cast<SHORT>(intg);
									}
									else if (prgvt[index] == VT_UI4)
									{
										carrier[index].ulVal = static_cast<ULONG>(intg);
									}
									else if (prgvt[index] == VT_R4)
									{
										carrier[index].fltVal = static_cast<FLOAT>(intg);
									}
									else if (prgvt[index] == VT_R8)
									{
										carrier[index].dblVal = static_cast<DOUBLE>(intg);
									}
									else if (prgvt[index] == VT_UI8)
									{
										carrier[index].ullVal = static_cast<ULONGLONG>(intg);
									}
									else if (prgvt[index] == VT_I8)
									{
										carrier[index].llVal = static_cast<LONGLONG>(intg);
									}
								}
								else if (carrier[index].vt == VT_R8)
								{
									DOUBLE dbl = carrier[index].dblVal;
									VariantClear(&carrier[index]);
									VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]);
									if (prgvt[index] == VT_UI1)
									{
										carrier[index].bVal = DoubleToByte(dbl);
									}
									else if (prgvt[index] == VT_UI2)
									{
										carrier[index].uiVal = DoubleToWord(dbl);
									}
									else if (prgvt[index] == VT_I2)
									{
										carrier[index].iVal = DoubleToShort(dbl);
									}
									else if (prgvt[index] == VT_UI4)
									{
										carrier[index].ulVal = DoubleToDword(dbl);
									}
									else if (prgvt[index] == VT_R4)
									{
										carrier[index].fltVal = DoubleToFloat(dbl);
									}
									else if (prgvt[index] == VT_I4)
									{
										carrier[index].lVal = DoubleToInt(dbl);
									}
									else if (prgvt[index] == VT_UI8)
									{
										carrier[index].ullVal = DoubleToUlonglong(dbl);
									}
									else if (prgvt[index] == VT_I8)
									{
										carrier[index].llVal = DoubleToLonglong(dbl);
									}
								}
								else // in all other cases zero-out carrier variant
								{
									VariantClear(&carrier[index]);
									VariantChangeType(&carrier[index], &carrier[index], 0, prgvt[index]);
								}
							}
						}
					}
					prgpvarg[index] = &carrier[index]; // setting pointer to carrier variant
					aux[index] = NULL;
				}
				++index; // increment index
			}
		}

		VARTYPE rettype;
		BOOL byrefedret = FALSE;
		CALLCONV callingConv = CC_STDCALL;

		// Read suggested return type
		LPWSTR sRetTypeSpec;
		if  (elem->specparamcount)
		{
			sRetTypeSpec = elem->GetTypes()[0];
			rettype = VarType(VT_BSTR, sRetTypeSpec);
		}
		else
		{
			sRetTypeSpec = reinterpret_cast<LPWSTR>(pDispParams->rgvarg[cArgCount-1].pbstrVal); // ret type, as suggested by the caller
			rettype = VarType(pDispParams->rgvarg[cArgCount-1].vt, sRetTypeSpec);
		}

		// Check validity
		if (rettype == VT_ILLEGAL)
		{
			// Can be with asterisk (byref) or with specified calling convention (or both):
			BOOL isValid = this->CrackReturnType(sRetTypeSpec, &byrefedret, &callingConv, &rettype);
			if (!isValid) // if invalid ret type specified then return now and indicate it
			{
				this->CleanOnInvoke(ifuncparams, aux, subvariant, carrier, prgvt, prgpvarg);
				--this->in_object;
				return TYPE_E_UNDEFINEDTYPE;
			}

			if (byrefedret) rettype = (VT_UI8|VT_BYREF); // if asked to be byref specify type large enough to hold pointer and add byref flag
		}

		if ((rettype==VT_LPSTR) || (rettype==VT_LPWSTR))
		{
			subrettype = rettype;
			rettype = VT_UI8; // for pointer to fit in
		}

		VARIANT pVarRet; // variant to save the result to
		VariantInit(&pVarRet); // probably not needed

		PVOID pObject;
		ULONG_PTR pMethod;

		if (this->fDLLCallObject)
		{
			pObject = NULL;
			pMethod = this->GetDllFunctionPointer();
			// Check if DLL actually exports that function
			if (pMethod == NULL)
			{
				this->CleanOnInvoke(ifuncparams, aux, subvariant, carrier, prgvt, prgpvarg);
				--this->in_object;
				return TYPE_E_DLLFUNCTIONNOTFOUND;
			}
		}
		else
		{
			pObject = this->wrapped_object;
			pMethod = sizeof(void*)*elem->GetIndex();
		}

		// Call the method/function using DispCallFunc
		DispCallFunc(pObject, // object pointer
			pMethod, // offset into vtable for the function
			callingConv, // calling convention
			rettype, //type of return variant
			ifuncparams, // number of parameters
			prgvt, // pointer to array of param types
			prgpvarg, // pointer to array of variant pointers
			&pVarRet); // pointer to ret variant

		// Copy to a SafeArray for out.
		SAFEARRAY* psa;
		SAFEARRAYBOUND rgsabound[1];
		rgsabound[0].lLbound = 0;
		rgsabound[0].cElements = ifuncparams+1;
		psa = SafeArrayCreate(VT_VARIANT, 1, rgsabound);
		VARIANT* pData;
		if (SafeArrayAccessData(psa, (void**)&pData) == S_OK)
		{
			for (INT i=0; i < ifuncparams; i++) // for all params
			{
				VariantInit(&pData[i+1]); // init the variant to store data to
				if (prgvt[i] & VT_BYREF) // if values were sent byref then...
				{
					isubtype = prgvt[i] ^ VT_BYREF; // the rest is byref-ed type
					VariantChangeType(&pData[i+1], &pData[i+1], 0, isubtype); // change to proper type for out
					if (isubtype == VT_EMPTY)
					{
						// Nothing here, never here.
					}
					else if ((isubtype == VT_I1)|(isubtype == VT_UI1))
					{
						pData[i+1].bVal = (subvariant[i].pbVal[0]);
					}
					else if (isubtype == VT_BOOL)
					{
						// Little complication here to cover it properly for both bool and boolean types
						BOOL outbool;
						(static_cast<DWORD>(subvariant[i].pulVal[0]<<24)==0)?outbool=FALSE:outbool=TRUE; // zero is false, anything else true.
						pData[i+1].boolVal = outbool;
					}
					else if (isubtype == VT_I2)
					{
						pData[i+1].iVal = subvariant[i].piVal[0];
					}
					else if (isubtype == VT_UI2)
					{
						pData[i+1].uiVal = subvariant[i].puiVal[0];
					}
					else if (isubtype == VT_UI4)
					{
						pData[i+1].uintVal = subvariant[i].puintVal[0];
					}
					else if (isubtype == VT_I4)
					{
						pData[i+1].lVal = subvariant[i].plVal[0];
					}
					else if (isubtype == VT_VARIANT)
					{
						VARIANT *varbelow = subvariant[i].pvarVal;
						VariantChangeType(&pData[i+1], &pData[i+1], 0, varbelow->vt); // changing to proper type
						// Few special cases can occur:
						if (varbelow->vt == VT_LPSTR)
						{
							// Need to convert ANSI string to BSTR
							pData[i+1].vt = VT_BSTR;
							LPSTR stringin = reinterpret_cast<LPSTR>(varbelow->ullVal);
							INT iLen = MultiByteToWideChar(CP_ACP, 0, stringin, -1, NULL, 0) ;
							LPWSTR wstringout = new WCHAR[iLen];
							MultiByteToWideChar(CP_ACP, 0, stringin, -1, wstringout, iLen);
							pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(wstringout));
							delete [] wstringout;
						}
						else if (varbelow->vt == VT_LPWSTR)
						{
							pData[i+1].vt = VT_BSTR;
							pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(varbelow->ullVal));
						}
						else if (varbelow->vt & VT_ARRAY)
						{
							pData[i+1].vt = varbelow->vt;
							pData[i+1].parray = varbelow->parray;
						}
						//...and if nothing is special then:
						else
						{
							pData[i+1].ullVal = varbelow->ullVal; // this is ok
						}
					}
					else if (isubtype == VT_I8)
					{
						pData[i+1].llVal = subvariant[i].pllVal[0];
					}
					else if (isubtype == VT_UI8)
					{
						pData[i+1].ullVal = subvariant[i].pullVal[0];
					}
					else if (isubtype == VT_R4)
					{
						pData[i+1].fltVal = subvariant[i].pfltVal[0];
					}
					else if (isubtype == VT_R8)
					{
						pData[i+1].dblVal = subvariant[i].pdblVal[0];
					}
					else if (isubtype == VT_LPSTR)
					{
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_BSTR); // changing to VT_BSTR
						LPSTR stringin = static_cast<LPSTR>(subvariant[i].byref);
						INT iLen = MultiByteToWideChar(CP_ACP, 0, stringin, -1, NULL, 0) ;
						LPWSTR wstringout = new WCHAR[iLen];
						MultiByteToWideChar(CP_ACP, 0, stringin, -1, wstringout, iLen);
						pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(wstringout));
						delete [] wstringout;
					}
					else if (isubtype == VT_LPWSTR)
					{
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_BSTR); // changing to VT_BSTR
						pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(subvariant[i].byref));
					}
					else if (isubtype == VT_BSTR)
					{
						pData[i+1].bstrVal = subvariant[i].pbstrVal[0];
					}
					else if (isubtype == VT_PTR)
					{
						pData[i+1].ullVal = subvariant[i].pullVal[0]; // this is ok, no worries
					}
					else if (isubtype == VT_INT_PTR)
					{
#ifdef _M_X64
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_I8);
#else
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_I4);
#endif
						pData[i+1].llVal = subvariant[i].pllVal[0]; // this is ok, no worries
					}

					else if (isubtype == VT_UINT_PTR)
					{
#ifdef _M_X64
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_UI8);
#else
						VariantChangeType(&pData[i+1], &pData[i+1], 0, VT_UI4);
#endif
						pData[i+1].ullVal = subvariant[i].pullVal[0]; // this is ok, no worries
					}
					else if (isubtype == VT_DISPATCH)
					{
						pData[i+1].vt = isubtype;
						pData[i+1].pdispVal = subvariant[i].ppdispVal[0];
					}
					else
					{
						this->CleanOnInvoke(ifuncparams, aux, subvariant, carrier, prgvt, prgpvarg);
						--this->in_object;
						return TYPE_E_UNDEFINEDTYPE;
					}
					if (isubtype == VT_BSTR)
					{
						// Is this memory leak?
						// String will be freed when returned param is cleared. Right?
					}
					else
					{
						VariantClear(&subvariant[i]); // this is no longer needed
					}
					VariantClear(&carrier[i]); // this is no longer needed. Its job is done.
				}
				else // default
				{
					if (subvariant[i].vt== VT_LPSTR)
					{
						// Need to convert ANSI string to BSTR
						pData[i+1].vt = VT_BSTR;
						LPSTR stringin = reinterpret_cast<LPSTR>(subvariant[i].ullVal);
						INT iLen = MultiByteToWideChar(CP_ACP, 0, stringin, -1, NULL, 0) ;
						LPWSTR wstringout = new WCHAR[iLen];
						MultiByteToWideChar(CP_ACP, 0, stringin, -1, wstringout, iLen);
						pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(wstringout));
						delete [] wstringout;
					}
					else if (subvariant[i].vt== VT_LPWSTR)
					{
						pData[i+1].vt = VT_BSTR;
						pData[i+1].bstrVal = SysAllocString(reinterpret_cast<BSTR>(subvariant[i].ullVal));
					}
					else
					{
						VariantCopy(&pData[i+1], prgpvarg[i]); // just copy what's passed-in.
					}
				}
			}
			/*
			Save the result too.
			If pVarRet.vt is VT_R8 or VT_R4 then there could be different problems.
			- why or how? Wrong vt of the ret val inside the called function can be the cause of some. I don't know how to go around that (maybe to call again with forced types - but that's to "expensive").
			Another problem is returning BSTR. In this case pointer should be returned from within the method (not string).
			- this means any number returned from within method is considered to be pointer (this is expected crash situation)
			Also in case of VT_DISPACH, pointer (to object) should be returned from within functions/methods (not object type).
			- same remark as above
			*/
			VariantInit(&pData[0]); // initialize the variant to store data to
			if (rettype & VT_BYREF)
			{
				pData[0].vt = VT_UI8;
				pData[0].ullVal = reinterpret_cast<ULONGLONG>(pVarRet.pullVal);
			}
			else
			{
				if (subrettype==VT_LPSTR)
				{
					// Need to convert ANSI string to BSTR
					pData[0].vt = VT_BSTR;
					LPSTR stringin = reinterpret_cast<LPSTR>(pVarRet.pullVal);
					INT iLen = MultiByteToWideChar(CP_ACP, 0, stringin, -1, NULL, 0) ;
					LPWSTR wstringout = new WCHAR[iLen];
					MultiByteToWideChar(CP_ACP, 0, stringin, -1, wstringout, iLen);
					pData[0].bstrVal = SysAllocString(reinterpret_cast<BSTR>(wstringout));
					delete [] wstringout;
				}
				else if (subrettype==VT_LPWSTR)
				{
					pData[0].vt = VT_BSTR;
					pData[0].bstrVal = SysAllocString(reinterpret_cast<BSTR>(pVarRet.pullVal));
				}
				else
				{
					VariantCopy(&pData[0], &pVarRet); // setting array[0] to return value of the call
				}
			}
			VariantClear(&pVarRet); // this is no longer needed
			// That's it!
			SafeArrayUnaccessData(psa);
		}
		// Finalizing array to output
		this->v_paramarray.parray = psa;
		this->v_paramarray.vt = (VT_ARRAY | VT_VARIANT); // array of variants
		// Set result
		VariantCopy(pVarResult, &this->v_paramarray);
		// Decrement 'inobject' count
		--this->in_object;
		// Clean
		VariantClear(&this->v_paramarray);
		this->CleanOnInvoke(ifuncparams, aux, subvariant, carrier, prgvt, prgpvarg);
		return S_OK;
	}
	return DISP_E_MEMBERNOTFOUND;
}


DISPID AutoItWrapObject::FindMember(wchar_t* name)
{
	// Search through members
	for (int i=this->members.size()-1;i>-1;i--){ // going backwards. Inheritor have priority over inherited.
		if (Compare(this->members.at(i)->GetName(),name)==0)
		{
			return i;
		}
	}
	return -1;
}


void AutoItWrapObject::AddMember(AutoItWrapElement *new_member)
{
	DISPID index = FindMember(new_member->GetName());
	if (index == -1) {
		this->members.push_back(new_member);
	} else {
		delete members.at(index);
		members[index] = new_member;
	}
}


VOID AutoItWrapObject::SetParentDllHandle(HMODULE handle)
{
	this->hDLL = handle;
}

BOOL AutoItWrapObject::SetFunctionName(LPWSTR sName)
{
	// Clean first
	if (this->sFunctionName) delete [] this->sFunctionName;
	this->sFunctionName = NULL;
	// Allocate new in size of passed + 1 (null-terminator)
	LPWSTR pBuffer = new WCHAR[lstrlenW(sName)+1];
	// Copy to this buffer
	if (lstrcpyW(pBuffer, sName) != NULL) 
	{
		this->sFunctionName = pBuffer;
		return TRUE;
	}
	// If failed to copy release memory and return failure
	delete [] pBuffer;
	return FALSE;
}

ULONG_PTR AutoItWrapObject::GetDllFunctionPointer()
{
	CHAR sFunction[1024]; // fixed max len for the function name for simplicity
	WideCharToMultiByte(CP_ACP, 0, this->sFunctionName, -1, sFunction, 1024, NULL, NULL); // convert to ANSI string
	return reinterpret_cast<ULONG_PTR>(GetProcAddress(this->hDLL, sFunction));
}


BOOL  AutoItWrapObject::CrackReturnType(LPWSTR wtype, BOOL *byrefedret, CALLCONV *callingConv, VARTYPE *rettype)
{
	INT len = lstrlenW(wtype);
	// The most obvious check; if said to be byref
	if (wtype[len-1] == '*')
	{
		wtype[len-1] = '\0';
		*rettype = VarType(VT_BSTR, wtype);
		wtype[len-1] = '*'; // restore
		if (*rettype == VT_ILLEGAL) return FALSE;
		*byrefedret = TRUE;
		*callingConv = CC_STDCALL;
		// e.g. "dword*"
		return TRUE;
	}

	INT i=0;
	while (wtype[i]!='\0') // till null-terminator encountered
	{
		if (wtype[i]==':')
		{
			LPWSTR sConvention = reinterpret_cast<LPWSTR>(&wtype[i+1]);
			if (Compare(sConvention, L"cdecl") == 0) *callingConv = CC_CDECL;
			if (wtype[i-1] == '*')
			{
				wtype[i-1] = '\0';
				*rettype = VarType(VT_BSTR, wtype);
				wtype[i-1] = '*'; // restore
				if (*rettype == VT_ILLEGAL) return FALSE;
				*byrefedret = TRUE;
				// e.g.  "dword*:cdecl"
				return TRUE;
			}
			else
			{
				wtype[i] = '\0';
				*rettype = VarType(VT_BSTR, wtype);
				wtype[i]=':'; // restore
				if (*rettype == VT_ILLEGAL) return FALSE;
				// e.g. "dword:cdecl"
				return TRUE;
			}
		}
		i++;
	}

	// If here then some invalid string is passed
	return FALSE;
}


VOID AutoItWrapObject::CleanOnInvoke(INT paramnum, PVOID* aux, VARIANTARG* subvariant, VARIANT* carrier, VARTYPE *prgvt, VARIANTARG** prgpvarg)
{
	for(INT i=0; i < paramnum; i++)
	{
		delete [] aux[i]; // if there was buffer created, destroy it
	}
	delete [] aux;
	delete [] subvariant;
	delete [] carrier;
	delete [] prgvt;
	delete [] prgpvarg;
}


/*---------------------------------------------------------------------*/
/*                     VARTYPE Coercion Below                          */
/*---------------------------------------------------------------------*/
LONGLONG AutoItWrapObject::StringToLonglong(BSTR bstr)
{
	LONGLONG llRet;
	StrToInt64ExW(static_cast<LPCWSTR>(bstr), STIF_DEFAULT, &llRet);
	return llRet;
}

BYTE AutoItWrapObject::StringToByte(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	BYTE byteOut;
	if (!VarUI1FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &byteOut))
	{
		return byteOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

BOOL AutoItWrapObject::StringToBool(BSTR bstr)
{
	VARIANT_BOOL boolOut;
	if (!VarBoolFromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &boolOut))
	{
		return -(boolOut!=0); // reinterpreted value
	}
	else
	{
		return -(SysStringLen(bstr)>0); // to be consistent with AutoIt's definition of this data type
	}
}

USHORT AutoItWrapObject::StringToWord(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	USHORT ushortOut;
	if (!VarUI2FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &ushortOut))
	{
		return ushortOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

SHORT AutoItWrapObject::StringToShort(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	SHORT shortOut;
	if (!VarI2FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &shortOut))
	{
		return shortOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

ULONG AutoItWrapObject::StringToDword(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	ULONG ulongOut;
	if (!VarUI4FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &ulongOut))
	{
		return ulongOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

LONG AutoItWrapObject::StringToInt(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	LONG longOut;
	if (!VarI4FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &longOut))
	{
		return longOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

FLOAT AutoItWrapObject::StringToFloat(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	FLOAT fltOut;
	if (!VarR4FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &fltOut))
	{
		return fltOut;
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

DOUBLE AutoItWrapObject::StringToDouble(BSTR bstr)
{
	FixDecimalSeparator(bstr);
	DOUBLE dblOut;
	if (!VarR8FromStr(bstr, 0, LOCALE_NOUSEROVERRIDE, &dblOut))
	{
		return dblOut; // reinterpreted value
	}
	else
	{
		return StringToLonglong(bstr);
	}
}

BYTE AutoItWrapObject::DoubleToByte(DOUBLE dval)
{
	BYTE byteOut;
	if (!VarUI1FromR8(dval, &byteOut))
	{
		return byteOut;
	}
	else
	{
		return static_cast<BYTE>(dval);
	}
}

USHORT AutoItWrapObject::DoubleToWord(DOUBLE dval)
{
	USHORT ushortOut;
	if (!VarUI2FromR8(dval, &ushortOut))
	{
		return ushortOut;
	}
	else
	{
		return static_cast<USHORT>(dval);
	}
}

SHORT AutoItWrapObject::DoubleToShort(DOUBLE dval)
{
	SHORT shortOut;
	if (!VarI2FromR8(dval, &shortOut))
	{
		return shortOut;
	}
	else
	{
		return static_cast<SHORT>(static_cast<USHORT>(dval));
	}
}

ULONG AutoItWrapObject::DoubleToDword(DOUBLE dval)
{
	ULONG ulongOut;
	if (!VarUI4FromR8(dval, &ulongOut))
	{
		return ulongOut;
	}
	else
	{
		return static_cast<ULONG>(dval);
	}
}

FLOAT AutoItWrapObject::DoubleToFloat(DOUBLE dval)
{
	FLOAT fltOut;
	if (!VarR4FromR8(dval, &fltOut))
	{
		return fltOut;
	}
	else
	{
		return static_cast<FLOAT>(dval);
	}
}

LONG AutoItWrapObject::DoubleToInt(DOUBLE dval)
{
	LONG intOut;
	if (!VarI4FromR8(dval, &intOut))
	{
		return intOut;
	}
	else
	{
		return static_cast<LONG>(static_cast<ULONG>(dval));
	}
}

ULONGLONG AutoItWrapObject::DoubleToUlonglong(DOUBLE dval)
{
	return static_cast<ULONGLONG>(dval);
}

LONGLONG AutoItWrapObject::DoubleToLonglong(DOUBLE dval)
{
	return static_cast<LONGLONG>(dval);
}

VOID AutoItWrapObject::FixDecimalSeparator(BSTR bstr, BOOL bflag)
{
	LPWSTR string = static_cast<LPWSTR>(bstr);
	INT i=0;
	while (string[i]!='\0') // till null-terminator encountered
	{
		if (bflag)
		{
			if (string[i]==',') string[i]='.'; // From comma to dot
		}
		else
		{
			if (string[i]=='.') string[i]=','; // From dot to comma
		}
		i++;
	}
}