#pragma once
#include <Objbase.h>
#include "vector.h"
#include "element.h"
#include "callbacks.h"

class  AutoItObject: public IDispatch
{
public:
	AutoItObject(void);
	AutoItObject(AutoItObject* a);
	~AutoItObject(void);
	HRESULT STDMETHODCALLTYPE QueryInterface(const IID &riid,void **ppvObject);
	ULONG STDMETHODCALLTYPE AddRef();
	ULONG STDMETHODCALLTYPE Release();
	HRESULT STDMETHODCALLTYPE GetTypeInfoCount(UINT *pctinfo);
	virtual HRESULT STDMETHODCALLTYPE GetTypeInfo(UINT iTInfo,LCID lcid,ITypeInfo **ppTInfo);
	virtual HRESULT STDMETHODCALLTYPE GetIDsOfNames(const IID &riid,LPOLESTR *rgszNames,
											UINT cNames,LCID lcid,DISPID *rgDispId);
	HRESULT STDMETHODCALLTYPE Invoke(DISPID dispIdMember,const IID &riid,
										LCID lcid,WORD wFlags,DISPPARAMS *pDispParams,
										VARIANT *pVarResult,EXCEPINFO *pExcepInfo,UINT * puArgErr);
	void AddMember(AutoItElement*);
	void AddEnum(wchar_t* function_next, wchar_t* function_reset, wchar_t* function_skip);
	void RemoveMember(wchar_t* name);
    void AddMethod(wchar_t* method,wchar_t* value, AutoItElement::SCOPE new_scope);
    void AddProperty(wchar_t* property_name,  AutoItElement::SCOPE new_scope, VARIANT* property_value);
	static void Init(AUTOITFUNCTIONPROXY proxy_function);
private:
	ULONG ref_count;
	ULONG in_object;
	simple::vector<AutoItElement*> members;
	wchar_t *enumfn_next, *enumfn_reset, *enumfn_skip, *lastmethod;
	static AUTOITFUNCTIONPROXY AutoItFunctionProxy;
	DISPID FindMember(wchar_t* name);
	VARIANT v_paramarray, v_error, v_result, v_propcall;
};