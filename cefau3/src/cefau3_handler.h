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

	HWND GetHandle() {return this->hCefWindow; }
	void Parent(HWND parent) {this->hParent = parent; }
	HWND Parent() {	return hParent; }
	
	void* _OnBeforeContextMenu = 0;
	virtual void OnBeforeContextMenu(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefFrame> frame,
		CefRefPtr<CefContextMenuParams> params,
		CefRefPtr<CefMenuModel> model) OVERRIDE;

	void* _OnPreKeyEvent = 0;
	virtual bool OnPreKeyEvent(CefRefPtr<CefBrowser> browser,
		const CefKeyEvent& event,
		CefEventHandle os_event,
		bool* is_keyboard_shortcut) OVERRIDE;

	void* _OnKeyEvent = 0;
	virtual bool OnKeyEvent(CefRefPtr<CefBrowser> browser,
		const CefKeyEvent& event,
		CefEventHandle os_event) OVERRIDE;

	void* _OnTitleChange = 0;
	virtual void OnTitleChange(CefRefPtr<CefBrowser> browser, 
		const CefString& title) OVERRIDE;

	void* _OnAddressChange = 0;
	virtual void OnAddressChange(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefFrame> frame,
		const CefString& url) OVERRIDE;

	void* _OnFaviconURLChange = 0;
	virtual void OnFaviconURLChange(CefRefPtr<CefBrowser> browser,
		const std::vector<CefString>& icon_urls) OVERRIDE;

	void* _OnFullscreenModeChange = 0;
	virtual void OnFullscreenModeChange(CefRefPtr<CefBrowser> browser,
		bool fullscreen) OVERRIDE;

	void* _OnTooltip = 0;
	virtual bool OnTooltip(CefRefPtr<CefBrowser> browser, CefString& text) OVERRIDE;

	void* _OnStatusMessage = 0;
	virtual void OnStatusMessage(CefRefPtr<CefBrowser> browser,
		const CefString& value) OVERRIDE;

	void* _OnConsoleMessage = 0;
	virtual bool OnConsoleMessage(CefRefPtr<CefBrowser> browser,
		const CefString& message,
		const CefString& source,
		int line) OVERRIDE;
	
	void* _OnLoadingStateChange = 0;
	virtual void OnLoadingStateChange(CefRefPtr<CefBrowser> browser,
		bool isLoading,
		bool canGoBack,
		bool canGoForward) OVERRIDE;

	void* _OnLoadStart = 0;
	virtual void OnLoadStart(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefFrame> frame,
		TransitionType transition_type) OVERRIDE;

	void* _OnLoadEnd = 0;
	virtual void OnLoadEnd(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefFrame> frame,
		int httpStatusCode) OVERRIDE;

	void* _OnLoadError = 0;
	virtual void OnLoadError(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefFrame> frame,
		ErrorCode errorCode,
		const CefString& errorText,
		const CefString& failedUrl) OVERRIDE;


	void* _OnDragEnter = 0;
	virtual bool OnDragEnter(CefRefPtr<CefBrowser> browser,
		CefRefPtr<CefDragData> dragData,
		DragOperationsMask mask) OVERRIDE;

	void* _OnDraggableRegionsChanged = 0;
	virtual void OnDraggableRegionsChanged(
		CefRefPtr<CefBrowser> browser,
		const std::vector<CefDraggableRegion>& regions) OVERRIDE;




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
	void* _OnAfterCreated = 0;
	virtual void OnAfterCreated(CefRefPtr<CefBrowser> browser) OVERRIDE;
	// release the browser reference
	void* _OnBeforeClose = 0;
	virtual void OnBeforeClose(CefRefPtr<CefBrowser> browser) OVERRIDE;
#pragma endregion // CefLifeSpanHandler


protected:
	// the browser reference
	CefRefPtr<CefBrowser> browser;
	HWND hCefWindow = 0;
	HWND hParent = 0;

	// Include the default reference counting implementation.
	IMPLEMENT_REFCOUNTING(Cefau3_Handler);
	// Include the default locking implementation.
	IMPLEMENT_LOCKING(Cefau3_Handler);
};

/*//////////////////////////////////////////////////////////////
void WINAPI Cef_OnAfterCreated(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnAfterCreated_)(Cefau3_Handler*, CefBrowser*);
///////////////////////////////////////////////////////////////
void WINAPI Cef_OnBeforeClose(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnBeforeClose_)(Cefau3_Handler*, CefBrowser*);
/////////////////////////////////////////////////////
void WINAPI Cef_OnBeforeContextMenu(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnBeforeContextMenu_)(Cefau3_Handler*, CefBrowser*, CefFrame*, CefContextMenuParams*, CefMenuModel*);
///////////////////////////////////////////////////
void WINAPI Cef_OnPreKeyEvent(Cefau3_Handler* handler, void* value);
typedef bool(__stdcall * _OnPreKeyEvent_)(Cefau3_Handler*, CefBrowser*, const CefKeyEvent& event, CefEventHandle, bool*);
///////////////////////////////////////////////////
void WINAPI Cef_OnKeyEvent(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnKeyEvent_)(Cefau3_Handler*, CefBrowser*, const CefKeyEvent&, CefEventHandle);
///////////////////////////////////////////////////
void WINAPI Cef_OnTitleChange(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnTitleChange_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
///////////////////////////////////////////////////
void WINAPI Cef_OnAddressChange(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnAddressChange_)(Cefau3_Handler*, CefBrowser*, CefFrame*, LPCWSTR);
///////////////////////////////////////////////////
void WINAPI Cef_OnFaviconURLChange(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnFaviconURLChange_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
///////////////////////////////////////////////////
void WINAPI Cef_OnFullscreenModeChange(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnFullscreenModeChange_)(Cefau3_Handler*, CefBrowser*, bool);
////////////////////////////////////////////////
void WINAPI Cef_OnTooltip(Cefau3_Handler* handler, void* value);
typedef bool(__stdcall * _OnTooltip_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
///////////////////////////////////////////
void WINAPI Cef_OnStatusMessage(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnStatusMessage_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
/////////////////////////////////////////////////////////////
void WINAPI Cef_OnConsoleMessage(Cefau3_Handler* handler, void* value);
typedef bool(__stdcall * _OnConsoleMessage_)(Cefau3_Handler*, CefBrowser*, LPCWSTR, LPCWSTR);
//////////////////////////////////////////////////
void WINAPI Cef_OnLoadingStateChange(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnLoadingStateChange_)(Cefau3_Handler*, CefBrowser*, bool, bool, bool);
///////////////////////////////////////////////
void WINAPI Cef_OnLoadStart(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnLoadStart_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int);
////////////////////////////////////////////////////////////
void WINAPI Cef_OnLoadEnd(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnLoadEnd_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int);
///////////////////////////////////////////////////////////////
void WINAPI Cef_OnLoadError(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnLoadError_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int, LPCWSTR, LPCWSTR);
///////////////////////////////////////////////
void WINAPI Cef_OnDragEnter(Cefau3_Handler* handler, void* value);
typedef bool(__stdcall * _OnDragEnter_)(Cefau3_Handler*, CefBrowser*, CefDragData*, int);
//////////////////////////////////////////////////////////////
void WINAPI Cef_OnDraggableRegionsChanged(Cefau3_Handler* handler, void* value);
typedef void(__stdcall * _OnDraggableRegionsChanged_)(Cefau3_Handler*, CefBrowser*);
*/