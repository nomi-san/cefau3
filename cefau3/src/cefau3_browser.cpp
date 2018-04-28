#include "inc.h"

extern CefSettings __mainSettings;
//////////////////////////////////////////////////////
#pragma region browser
bool WINAPI CefBrowser_CanGoBack(CefBrowser* browser)
{
	return browser->CanGoBack();
}

bool WINAPI CefBrowser_CanGoForward(CefBrowser* browser)
{
	return browser->CanGoForward();
}

void WINAPI CefBrowser_StopLoad(CefBrowser* browser)
{
	return browser->StopLoad();
}

void WINAPI CefBrowser_GoForward(CefBrowser* browser)
{
	browser->GoForward();
}

void WINAPI CefBrowser_GoBack(CefBrowser* browser)
{
	browser->GoBack();
}

bool WINAPI CefBrowser_IsLoading(CefBrowser* browser)
{
	return browser->IsLoading();
}

bool WINAPI CefBrowser_IsPopup(CefBrowser* browser)
{
	return browser->IsPopup();
}

bool WINAPI CefBrowser_HasDocument(CefBrowser* browser)
{
	return browser->HasDocument();
}

void WINAPI CefBrowser_Reload(CefBrowser* browser)
{
	browser->Reload();
}

int WINAPI CefBrowser_GetIdentifier(CefBrowser* browser)
{
	return browser->GetIdentifier();
}

void WINAPI CefBrowser_ReloadIgnoreCache(CefBrowser* browser)
{
	browser->ReloadIgnoreCache();
}

int WINAPI CefBrowser_GetFrameCount(CefBrowser* browser)
{
	return browser->GetFrameCount();
}

CefBrowserHost* WINAPI CefBrowser_GetHost(CefBrowser* browser)
{
	return browser->GetHost();
}

CefFrame* WINAPI CefBrowser_GetMainFrame(CefBrowser* browser)
{
	return browser->GetMainFrame();
}
#pragma endregion


//////////////////////////////////////////
#pragma region browser host
void WINAPI CefBrowserHost_StartDownload(CefBrowserHost* host, LPCWSTR url)
{
	host->StartDownload(url);
}

void WINAPI CefBrowserHost_CloseDevTools(CefBrowserHost* host)
{
	host->CloseDevTools();
}

void WINAPI CefBrowserHost_CloseBrowser(CefBrowserHost* host, bool force)
{
	host->CloseBrowser(force);
}

void WINAPI CefBrowserHost_AddWordToDictionary(CefBrowserHost* host, LPCWSTR word)
{
	host->AddWordToDictionary(word);
}

void WINAPI CefBrowserHost_Find(CefBrowserHost* host, int id, LPCWSTR text, bool forward, bool matchcase, bool next)
{
	host->Find(id, text, forward, matchcase, next);
}

CefBrowser* WINAPI CefBrowserHost_GetBrowser(CefBrowserHost* host)
{
	return host->GetBrowser();
}

HWND WINAPI CefBrowserHost_GetOpenerWindowHandle(CefBrowserHost* host)
{
	return host->GetOpenerWindowHandle();
}

HWND WINAPI CefBrowserHost_GetWindowHandle(CefBrowserHost* host)
{
	return host->GetWindowHandle();
}

int WINAPI CefBrowserHost_GetWindowlessFrameRate(CefBrowserHost* host)
{
	return host->GetWindowlessFrameRate();
}

double WINAPI CefBrowserHost_GetZoomLevel(CefBrowserHost* host)
{
	return host->GetZoomLevel();
}

bool WINAPI CefBrowserHost_HasDevTools(CefBrowserHost* host)
{
	return host->HasDevTools();
}

bool WINAPI CefBrowserHost_HasView(CefBrowserHost* host)
{
	return host->HasView();
}

void WINAPI CefBrowserHost_Print(CefBrowserHost* host)
{
	REQUIRE_UI_THREAD();
	host->Print();
}

void WINAPI CefBrowserHost_StopFinding(CefBrowserHost* host, bool clear_selection)
{
	REQUIRE_UI_THREAD();
	host->StopFinding(clear_selection);
}

bool WINAPI CefBrowserHost_TryCloseBrowser(CefBrowserHost* host)
{
	REQUIRE_UI_THREAD();
	return host->TryCloseBrowser();
}

void WINAPI CefBrowserHost_SetZoomLevel(CefBrowserHost* host, double zoom)
{
	REQUIRE_UI_THREAD();
	host->SetZoomLevel(zoom);
}

void WINAPI CefBrowserHost_ShowDevTools(CefBrowserHost* host, HWND parent, LPCWSTR name, int x, int y, int pt_x, int pt_y)
{
	REQUIRE_UI_THREAD();
	CefWindowInfo info;
	CefBrowserSettings settings;
	CefPoint pt(pt_x, pt_y);

	info.SetAsPopup(parent, name);
	info.x = x;
	info.y = y;

	host->ShowDevTools(info, host->GetClient(), settings, pt);
}

void WINAPI CefBrowserHost_SetWindowlessFrameRate(CefBrowserHost* host, int framerate)
{
	REQUIRE_UI_THREAD();
	host->SetWindowlessFrameRate(framerate);
}

void WINAPI CefBrowserHost_SetFocus(CefBrowserHost* host, bool focus)
{
	REQUIRE_UI_THREAD();
	host->SetFocus(focus);
}
#pragma endregion