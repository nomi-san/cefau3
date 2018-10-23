#pragma once
#include "object.h"
#include "dll.h"

class AutoItObjectClass: public IDispatch
{
public:
	AutoItObjectClass(void);
	~AutoItObjectClass(void);
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
private:
	AutoItObject *autoit_object;
    ULONG ref_count;
	BOOL wanted;
};