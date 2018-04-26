#pragma once
#include "cefau3_handler.h"
extern LPCWSTR lpExtensionFromFile;
extern HWND __mainHandleMessageWindow;

class Cefau3_App :	public CefApp,
					public CefRenderProcessHandler,
					public CefBrowserProcessHandler
{
public:
	Cefau3_App(Cefau3_Handler* handler) {this->handler = handler;}
	virtual ~Cefau3_App() {}

	virtual CefRefPtr<CefBrowserProcessHandler> GetBrowserProcessHandler() OVERRIDE
	{
		return this;
	};
	virtual CefRefPtr<CefRenderProcessHandler> GetRenderProcessHandler() OVERRIDE
	{
		return this;
	};

	virtual void OnContextCreated(CefRefPtr<CefBrowser> browser, 
		CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) OVERRIDE {
		CEF_REQUIRE_UI_THREAD();
	}
	virtual void OnWebKitInitialized() OVERRIDE;

	Cefau3_Handler * GetHandler() {
		return this->handler;
	}

private:
	Cefau3_Handler * handler;
	IMPLEMENT_REFCOUNTING(Cefau3_App);
};

