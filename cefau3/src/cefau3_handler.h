#pragma once
#include "inc.h"

class Cefau3_Handler :	public CefClient,
						public CefContextMenuHandler,
						public CefDisplayHandler,
						public CefDownloadHandler,
						public CefDragHandler,
						public CefGeolocationHandler,
						public CefKeyboardHandler,
						public CefLifeSpanHandler,
						public CefLoadHandler,
						public CefRequestHandler
{
public:
	Cefau3_Handler() {};
	virtual ~Cefau3_Handler() {};
	CefRefPtr<CefBrowser> GetBrowser();

	HWND GetHandle() {
		return this->hCefWindow;
	}
	void Parent(HWND parent) {
		this->hParent = parent;
	}
	HWND Parent() {
		return hParent;
	}
	
	virtual void OnTitleChange(CefRefPtr<CefBrowser> browser, const CefString& title) OVERRIDE;

#pragma region CefClient
	// since we are letting the base implementations handle all of the heavy lifting,
	// these functions just return the this pointer
	virtual CefRefPtr<CefContextMenuHandler> GetContextMenuHandler() OVERRIDE;
	virtual CefRefPtr<CefDisplayHandler> GetDisplayHandler() OVERRIDE;
	virtual CefRefPtr<CefDownloadHandler> GetDownloadHandler() OVERRIDE;
	virtual CefRefPtr<CefDragHandler> GetDragHandler() OVERRIDE;
	virtual CefRefPtr<CefGeolocationHandler> GetGeolocationHandler() OVERRIDE;
	virtual CefRefPtr<CefKeyboardHandler> GetKeyboardHandler() OVERRIDE;
	virtual CefRefPtr<CefLifeSpanHandler> GetLifeSpanHandler() OVERRIDE;
	virtual CefRefPtr<CefLoadHandler> GetLoadHandler() OVERRIDE;
	virtual CefRefPtr<CefRequestHandler> GetRequestHandler() OVERRIDE;
#pragma endregion // CefClient

#pragma region CefDownloadHandler
	// this function is virtual and must be implemented; we do nothing in it, so downloading files won't work as the callback function isn't invoked
	virtual void OnBeforeDownload(CefRefPtr<CefBrowser> browser, CefRefPtr<CefDownloadItem> download_item, const CefString& suggested_name, CefRefPtr<CefBeforeDownloadCallback> callback);
#pragma endregion // CefDownloadHandler 

#pragma region CefLifeSpanHandler
	// cache a reference to the browser
	virtual void OnAfterCreated(CefRefPtr<CefBrowser> browser) OVERRIDE;
	// release the browser reference
	virtual void OnBeforeClose(CefRefPtr<CefBrowser> browser) OVERRIDE;
#pragma endregion // CefLifeSpanHandler


protected:
	// the browser reference
	CefRefPtr<CefBrowser> browser;
	HWND hCefWindow;
	HWND hParent;

	// Include the default reference counting implementation.
	IMPLEMENT_REFCOUNTING(Cefau3_Handler);
	// Include the default locking implementation.
	IMPLEMENT_LOCKING(Cefau3_Handler);
};