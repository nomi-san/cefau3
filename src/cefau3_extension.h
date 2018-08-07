#pragma once
#include "inc.h"

struct Cefau3_Extension:	public CefApp, 
						public CefV8Handler
{
public:
	Cefau3_Extension(Cefau3_App* app) { this->app = app; }
	virtual ~Cefau3_Extension() {}

	virtual bool Execute(const CefString& name,
		CefRefPtr<CefV8Value> object,
		const CefV8ValueList& arguments,
		CefRefPtr<CefV8Value>& retval,
		CefString& exception) OVERRIDE;

private:
	Cefau3_App* app;
	IMPLEMENT_REFCOUNTING(Cefau3_Extension);
};

typedef bool(_stdcall * _Extension_)(LPCSTR, CefV8Value*, const CefV8ValueList&, CefV8Value*, LPCSTR);