#pragma once
#include <Objbase.h>
#include "vector.h"
#include "wrap_element.h"
#include "callbacks.h"

class AutoItWrapObject: public IDispatch
{
public:
	AutoItWrapObject(IUnknown*, bool no_unknown, bool fDLLCallObject = FALSE);
	AutoItWrapObject(IUnknown* new_object, wchar_t *methods, bool no_unknown, bool fFreeMem=FALSE, bool fDLLCallObject = FALSE);
	~AutoItWrapObject(void);
	HRESULT STDMETHODCALLTYPE QueryInterface(const IID &riid,void **ppvObject);
	ULONG STDMETHODCALLTYPE AddRef();
	ULONG STDMETHODCALLTYPE Release();
	HRESULT STDMETHODCALLTYPE GetTypeInfoCount(UINT *pctinfo);
	HRESULT STDMETHODCALLTYPE GetTypeInfo(UINT iTInfo,LCID lcid,ITypeInfo **ppTInfo);
	HRESULT STDMETHODCALLTYPE GetIDsOfNames(const IID &riid,LPOLESTR *rgszNames,
		UINT cNames,LCID lcid,DISPID *rgDispId);
	HRESULT STDMETHODCALLTYPE Invoke(DISPID dispIdMember,const IID &riid,
		LCID lcid,WORD wFlags,DISPPARAMS *pDispParams,
		VARIANT *pVarResult,EXCEPINFO *pExcepInfo,UINT * puArgErr);
	VOID AddMember(AutoItWrapElement*);
	VOID SetParentDllHandle(HMODULE handle);

private:
	ULONG ref_count, in_object;;
	simple::vector<AutoItWrapElement*> members;
	IUnknown* wrapped_object;
	DISPID FindMember(wchar_t* name);
	VOID CleanOnInvoke(INT ifuncparams, PVOID* aux, VARIANTARG* subvariant, VARIANT* carrier, VARTYPE *prgvt, VARIANTARG** prgpvarg);
	LONGLONG StringToLonglong(BSTR bstr);
	DOUBLE StringToDouble(BSTR bstr);
	FLOAT StringToFloat(BSTR bstr);
	BOOL StringToBool(BSTR bstr);
	BYTE StringToByte(BSTR bstr);
	ULONG StringToDword(BSTR bstr);
	LONG StringToInt(BSTR bstr);
	USHORT StringToWord(BSTR bstr);
	SHORT StringToShort(BSTR bstr);
	BYTE DoubleToByte(DOUBLE dval);
	USHORT DoubleToWord(DOUBLE dval);
	SHORT DoubleToShort(DOUBLE dval);
	ULONG DoubleToDword(DOUBLE dval);
	FLOAT DoubleToFloat(DOUBLE dval);
	LONG DoubleToInt(DOUBLE dval);
	ULONGLONG DoubleToUlonglong(DOUBLE dval);
	LONGLONG DoubleToLonglong(DOUBLE dval);
	VOID FixDecimalSeparator(BSTR bstr, BOOL bflag=FALSE);
	BOOL CrackReturnType(LPWSTR wtype, BOOL *byrefedret, CALLCONV *callingConv, VARTYPE *rettype);
	BOOL SetFunctionName(LPWSTR sName);
	VARIANT v_paramarray;
	BOOL is_unkown;
	HMODULE hDLL;
	BOOL fCallFree;
	ULONG_PTR GetDllFunctionPointer();
	BOOL fDLLCallObject;
    LPWSTR sFunctionName;
};
