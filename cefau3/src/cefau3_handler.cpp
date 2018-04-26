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

void Cefau3_Handler::OnBeforeDownload(CefRefPtr<CefBrowser> browser,
	CefRefPtr<CefDownloadItem> download_item,
	const CefString& suggested_name, CefRefPtr<CefBeforeDownloadCallback> callback)
{
	UNREFERENCED_PARAMETER(browser);
	UNREFERENCED_PARAMETER(download_item);
	callback->Continue(suggested_name, true);
}

void Cefau3_Handler::OnAfterCreated(CefRefPtr<CefBrowser> browser) {
	REQUIRE_UI_THREAD();
	AutoLock lock_scope(this);

	if (!this->browser)		this->browser = browser;
	if (!this->hCefWindow)	this->hCefWindow = browser->GetHost()->GetWindowHandle();
	if (!this->hParent)		this->hParent = this->hCefWindow;
	ShowWindow(this->hCefWindow, SW_SHOW);
	CefLifeSpanHandler::OnAfterCreated(browser);
}

void Cefau3_Handler::OnBeforeClose(CefRefPtr<CefBrowser> browser)
{
	REQUIRE_UI_THREAD();
	AutoLock lock_scope(this);

	browser = NULL;
	//AppQuitMessageLoop();

	CefLifeSpanHandler::OnBeforeClose(browser);
}

void Cefau3_Handler::OnTitleChange(CefRefPtr<CefBrowser> browser, const CefString& title)
{
	CefWindowHandle hwnd = browser->GetHost()->GetWindowHandle();
	SetWindowText(GetParent(hwnd), std::wstring(title).c_str());
}