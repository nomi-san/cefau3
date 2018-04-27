#include "inc.h"

CefRefPtr<CefBrowser> Cefau3_Handler::GetBrowser()
{
	return browser;
}

CefRefPtr<CefContextMenuHandler> Cefau3_Handler::GetContextMenuHandler()
{
	return this;
}

CefRefPtr<CefDisplayHandler> Cefau3_Handler::GetDisplayHandler()
{
	return this;
}

CefRefPtr<CefDownloadHandler> Cefau3_Handler::GetDownloadHandler()
{
	return this;
}

CefRefPtr<CefDragHandler> Cefau3_Handler::GetDragHandler()
{
	return this;
}

CefRefPtr<CefGeolocationHandler> Cefau3_Handler::GetGeolocationHandler()
{
	return this;
}

CefRefPtr<CefKeyboardHandler> Cefau3_Handler::GetKeyboardHandler()
{
	return this;
}

CefRefPtr<CefLifeSpanHandler> Cefau3_Handler::GetLifeSpanHandler()
{
	return this;
}

CefRefPtr<CefLoadHandler> Cefau3_Handler::GetLoadHandler()
{
	return this;
}

CefRefPtr<CefRequestHandler> Cefau3_Handler::GetRequestHandler()
{
	return this;
}
/////////////////////////////////////////////////////////////////////////////
void Cefau3_Handler::OnBeforeDownload(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefDownloadItem> download_item,
	const CefString& suggested_name, CefRefPtr<CefBeforeDownloadCallback> callback)
{
	UNREFERENCED_PARAMETER(browser);
	UNREFERENCED_PARAMETER(download_item);
	callback->Continue(suggested_name, true);
}
//////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
void WINAPI Cef_OnAfterCreated(Cefau3_Handler* handler, void* value)
{
	handler->_OnAfterCreated = value;
}
typedef void(__stdcall * _OnAfterCreated_)(Cefau3_Handler*, CefBrowser*);
void Cefau3_Handler::OnAfterCreated(CefRefPtr<CefBrowser> browser) {
	REQUIRE_UI_THREAD();
	AutoLock lock_scope(this);

	if (!this->browser)		this->browser = browser;
	if (!this->hCefWindow)	this->hCefWindow = browser->GetHost()->GetWindowHandle();
	if (!this->hParent)		this->hParent = this->hCefWindow;
	ShowWindow(this->hCefWindow, SW_SHOW);
	if (this->_OnBeforeClose)
		((_OnAfterCreated_)this->_OnAfterCreated)(this, browser);

	CefLifeSpanHandler::OnAfterCreated(browser);
}

///////////////////////////////////////////////////////////////
void WINAPI Cef_OnBeforeClose(Cefau3_Handler* handler, void* value)
{
	handler->_OnBeforeClose = value;
}
typedef void(__stdcall * _OnBeforeClose_)(Cefau3_Handler*, CefBrowser*);
void Cefau3_Handler::OnBeforeClose(CefRefPtr<CefBrowser> browser)
{
	REQUIRE_UI_THREAD();
	AutoLock lock_scope(this);
	if (this->_OnBeforeClose)
		((_OnBeforeClose_)this->_OnBeforeClose)(this, browser);
	CefLifeSpanHandler::OnBeforeClose(browser);
}
/////////////////////////////////////////////////////
void WINAPI Cef_OnBeforeContextMenu(Cefau3_Handler* handler, void* value)
{
	handler->_OnBeforeContextMenu = value;
}
typedef void(__stdcall * _OnBeforeContextMenu_)(Cefau3_Handler*, CefBrowser*, CefFrame*, CefContextMenuParams*, CefMenuModel*);
void Cefau3_Handler::OnBeforeContextMenu(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefFrame> frame,
	CefRefPtr<CefContextMenuParams> params,
	CefRefPtr<CefMenuModel> model)
{
	if (this->_OnBeforeContextMenu)
		((_OnBeforeContextMenu_)this->_OnBeforeContextMenu)(this, browser, frame, params, model);
}

///////////////////////////////////////////////////
void WINAPI Cef_OnPreKeyEvent(Cefau3_Handler* handler, void* value)
{
	handler->_OnPreKeyEvent = value;
}
typedef bool(__stdcall * _OnPreKeyEvent_)(Cefau3_Handler*, CefBrowser*, const CefKeyEvent& event, CefEventHandle, bool*);
bool Cefau3_Handler::OnPreKeyEvent(CefRefPtr<CefBrowser> browser,
	const CefKeyEvent& event,
	CefEventHandle os_event,
	bool* is_keyboard_shortcut)
{
	if (this->_OnPreKeyEvent)
		return ((_OnPreKeyEvent_)this->_OnPreKeyEvent)(this, browser, event, os_event, is_keyboard_shortcut);
	return false;
}

///////////////////////////////////////////////////
void WINAPI Cef_OnKeyEvent(Cefau3_Handler* handler, void* value)
{
	handler->_OnKeyEvent = value;
}
typedef void(__stdcall * _OnKeyEvent_)(Cefau3_Handler*, CefBrowser*, const CefKeyEvent&, CefEventHandle);
bool Cefau3_Handler::OnKeyEvent(CefRefPtr<CefBrowser> browser,
	const CefKeyEvent& event,
	CefEventHandle os_event) 
{
	if (this->_OnKeyEvent)
		((_OnKeyEvent_)this->_OnKeyEvent)(this, browser, event, os_event);
	return false;
}

///////////////////////////////////////////////////
void WINAPI Cef_OnTitleChange(Cefau3_Handler* handler, void* value)
{
	handler->_OnTitleChange = value;
}
typedef void(__stdcall * _OnTitleChange_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
void Cefau3_Handler::OnTitleChange(CefRefPtr<CefBrowser> browser,
	const CefString& title)
{
	if (this->_OnTitleChange) 
		((_OnTitleChange_)this->_OnTitleChange)(this, browser, title.ToWString().c_str());
}

///////////////////////////////////////////////////
void WINAPI Cef_OnAddressChange(Cefau3_Handler* handler, void* value)
{
	handler->_OnAddressChange = value;
}
typedef void(__stdcall * _OnAddressChange_)(Cefau3_Handler*, CefBrowser*, CefFrame*, LPCWSTR);
void Cefau3_Handler::OnAddressChange(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefFrame> frame,
	const CefString& url)
{
	if (this->_OnAddressChange)
		((_OnAddressChange_)this->_OnAddressChange)(this, browser, frame, url.ToWString().c_str());
}

///////////////////////////////////////////////////
void WINAPI Cef_OnFaviconURLChange(Cefau3_Handler* handler, void* value)
{
	handler->_OnFaviconURLChange = value;
}
typedef void(__stdcall * _OnFaviconURLChange_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
void Cefau3_Handler::OnFaviconURLChange(CefRefPtr<CefBrowser> browser,
	const std::vector<CefString>& icon_urls)
{
	if (this->_OnFaviconURLChange) {
		std::wstring filter;
		for (size_t i = 0; i < icon_urls.size(); ++i) {
			filter = icon_urls[i];
			if (filter.empty()) break;
		}
		((_OnFaviconURLChange_)this->_OnAddressChange)(this, browser, filter.c_str());
	}
}

///////////////////////////////////////////////////
void WINAPI Cef_OnFullscreenModeChange(Cefau3_Handler* handler, void* value)
{
	handler->_OnFullscreenModeChange = value;
}
typedef void(__stdcall * _OnFullscreenModeChange_)(Cefau3_Handler*, CefBrowser*, bool);
void Cefau3_Handler::OnFullscreenModeChange(CefRefPtr<CefBrowser> browser,
	bool fullscreen)
{
	if (this->_OnFullscreenModeChange)
		((_OnFullscreenModeChange_)this->_OnFullscreenModeChange)(this, browser, fullscreen);
}

////////////////////////////////////////////////
void WINAPI Cef_OnTooltip(Cefau3_Handler* handler, void* value)
{
	handler->_OnTooltip = value;
}
typedef bool(__stdcall * _OnTooltip_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
bool Cefau3_Handler::OnTooltip(CefRefPtr<CefBrowser> browser, CefString& text)
{
	if (this->_OnTooltip)
		return ((_OnTooltip_)this->_OnTooltip)(this, browser, text.ToWString().c_str());
	return false;
}

///////////////////////////////////////////
void WINAPI Cef_OnStatusMessage(Cefau3_Handler* handler, void* value)
{
	handler->_OnStatusMessage = value;
}
typedef void(__stdcall * _OnStatusMessage_)(Cefau3_Handler*, CefBrowser*, LPCWSTR);
void Cefau3_Handler::OnStatusMessage(CefRefPtr<CefBrowser> browser,
	const CefString& value)
{
	if (this->_OnStatusMessage)
		((_OnStatusMessage_)this->_OnTooltip)(this, browser, value.ToWString().c_str());
}

/////////////////////////////////////////////////////////////
void WINAPI Cef_OnConsoleMessage(Cefau3_Handler* handler, void* value)
{
	handler->_OnConsoleMessage = value;
}
typedef bool(__stdcall * _OnConsoleMessage_)(Cefau3_Handler*, CefBrowser*, LPCWSTR, LPCWSTR);
bool Cefau3_Handler::OnConsoleMessage(CefRefPtr<CefBrowser> browser,
	const CefString& message,
	const CefString& source,
	int line)
{
	if (this->_OnConsoleMessage)
		return ((_OnConsoleMessage_)this->_OnConsoleMessage)(this, browser, message.ToWString().c_str(), source.ToWString().c_str());
	return false;
}

//////////////////////////////////////////////////
void WINAPI Cef_OnLoadingStateChange(Cefau3_Handler* handler, void* value)
{
	handler->_OnLoadingStateChange = value;
}
typedef void(__stdcall * _OnLoadingStateChange_)(Cefau3_Handler*, CefBrowser*, bool, bool, bool);
void Cefau3_Handler::OnLoadingStateChange(CefRefPtr<CefBrowser> browser,
	bool isLoading,
	bool canGoBack,
	bool canGoForward)
{
	if (this->_OnLoadingStateChange)
		((_OnLoadingStateChange_)this->_OnLoadingStateChange)(this, browser, isLoading, canGoBack, canGoForward);
}

///////////////////////////////////////////////
void WINAPI Cef_OnLoadStart(Cefau3_Handler* handler, void* value)
{
	handler->_OnLoadStart = value;
}
typedef void(__stdcall * _OnLoadStart_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int);
void Cefau3_Handler::OnLoadStart(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefFrame> frame,
	TransitionType transition_type)
{
	if (this->_OnLoadStart)
		((_OnLoadStart_)this->_OnLoadStart)(this, browser, frame, transition_type);
}

////////////////////////////////////////////////////////////
void WINAPI Cef_OnLoadEnd(Cefau3_Handler* handler, void* value)
{
	handler->_OnLoadEnd = value;
}
typedef void(__stdcall * _OnLoadEnd_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int);
void Cefau3_Handler::OnLoadEnd(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefFrame> frame,
	int httpStatusCode)
{
	if (this->_OnLoadEnd)
		((_OnLoadEnd_)this->_OnLoadEnd)(this, browser, frame, httpStatusCode);
}

///////////////////////////////////////////////////////////////
void WINAPI Cef_OnLoadError(Cefau3_Handler* handler, void* value)
{
	handler->_OnLoadError = value;
}
typedef void(__stdcall * _OnLoadError_)(Cefau3_Handler*, CefBrowser*, CefFrame*, int, LPCWSTR, LPCWSTR);
void Cefau3_Handler::OnLoadError(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefFrame> frame,
	ErrorCode errorCode,
	const CefString& errorText,
	const CefString& failedUrl)
{
	if (this->_OnLoadError)
		((_OnLoadError_)this->_OnLoadError)(this, browser, frame, errorCode, errorText.ToWString().c_str(), failedUrl.ToWString().c_str());
}

///////////////////////////////////////////////
void WINAPI Cef_OnDragEnter(Cefau3_Handler* handler, void* value)
{
	handler->_OnDragEnter = value;
}
typedef bool(__stdcall * _OnDragEnter_)(Cefau3_Handler*, CefBrowser*, CefDragData*, int);
bool Cefau3_Handler::OnDragEnter(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefDragData> dragData,
	DragOperationsMask mask)
{
	if (this->_OnDragEnter);
		return ((_OnDragEnter_)this->_OnDragEnter)(this, browser, dragData, mask);
	return false;
}

//////////////////////////////////////////////////////////////
void WINAPI Cef_OnDraggableRegionsChanged(Cefau3_Handler* handler, void* value)
{
	handler->_OnDraggableRegionsChanged = value;
}
typedef void(__stdcall * _OnDraggableRegionsChanged_)(Cefau3_Handler*, CefBrowser*);
void Cefau3_Handler::OnDraggableRegionsChanged(
	CefRefPtr<CefBrowser> browser,
	const std::vector<CefDraggableRegion>& regions)
{
	if (this->_OnDraggableRegionsChanged)
		((_OnDraggableRegionsChanged_)this->_OnDraggableRegionsChanged)(this, browser);
}
