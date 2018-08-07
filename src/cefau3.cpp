#include "inc.h"

#define INVALID_HWND (HWND)INVALID_HANDLE_VALUE
#define MESSAGE_WINDOW_CLASS L"MessageWindowClass"
#define SandBox (void*)NULL // disable sandbox

HWND __mainHandleMessageWindow = INVALID_HWND;
HINSTANCE __mainInstance;
CefSettings __mainSettings = {};
CefMainArgs __mainArgs = {};
const char *cache_path = ".\\cache";

LRESULT CALLBACK MessageWindowProc(HWND, UINT, WPARAM, LPARAM);
HWND Cef_CreateMessageWindow()
{
	WNDCLASSEX wcex = { 0 };
	wcex.cbSize = sizeof(wcex);
	wcex.lpfnWndProc = MessageWindowProc;
	wcex.hInstance = NULL;
	wcex.lpszClassName = MESSAGE_WINDOW_CLASS;
	RegisterClassEx(&wcex);
	return CreateWindow(MESSAGE_WINDOW_CLASS, 0, 0, 0, 0, 0, 0, HWND_MESSAGE, 0, NULL, 0);
}

LRESULT CALLBACK MessageWindowProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam)
{
	switch (Msg) {
		case WM_COMMAND: {
			if (wParam == QUITAPPMESSAGE) PostQuitMessage(lParam);
		} break;
		default: break;
	}
	return DefWindowProc(hWnd, Msg, wParam, lParam);
}

Cefau3_Handler* WINAPI Cef_Init(HINSTANCE hInsance, const char* cachePath = NULL)
{
	if (hInsance != NULL) hInsance = __mainInstance;
	Cefau3_Handler *wCefH = new Cefau3_Handler();
	Cefau3_App *wCefA = new Cefau3_App(wCefH);

	if (cachePath != NULL) cache_path = cachePath;
	cef_string_t cache_p = {};
	cef_string_from_utf8(cache_path, strlen(cache_path), &cache_p);

	__mainArgs = CefMainArgs(hInsance);
	__mainSettings.size = sizeof(__mainSettings);
	__mainSettings.no_sandbox = 1;
	__mainSettings.single_process = 1;
	__mainSettings.multi_threaded_message_loop = 1;
	__mainSettings.log_severity = cef_log_severity_t::LOGSEVERITY_DISABLE;
	__mainSettings.cache_path = cache_p;

	//CefExecuteProcess(__mainArgs, wCefA, SandBox);
	CefInitialize(__mainArgs, __mainSettings, wCefA, SandBox);
	if (!__mainHandleMessageWindow)
		__mainHandleMessageWindow = Cef_CreateMessageWindow();
	return wCefH;
}

Cefau3_Handler* WINAPI Cef_Create(Cefau3_Handler* handler, HWND hParent, LPCWSTR lpURL, int Left, int Top, int Width, int Height)
{
	RECT rc = { Left, Top, Width, Height };
	if (Left == 0 && Top == 0 && Width == 0 && Height == 0) GetClientRect(hParent, &rc);

	CefBrowserSettings browserSettings = {};
	browserSettings.size = sizeof(CefBrowserSettings);

	browserSettings.plugins = cef_state_t::STATE_ENABLED;
	browserSettings.javascript = cef_state_t::STATE_ENABLED;

	handler->Parent(hParent);

	CefWindowInfo windowInfo;
	
	windowInfo.SetAsChild(hParent, rc);

	CefBrowserHost::CreateBrowser(windowInfo, handler, CefString(lpURL), browserSettings, NULL);

	return handler;
}

Cefau3_Handler* WINAPI Cef_CreatePopup(Cefau3_Handler* handler, HWND hParent, LPCWSTR lpURL, LPCWSTR lpName, int Left, int Top, int Width, int Height)
{
	CefBrowserSettings browserSettings;
	browserSettings.size = sizeof(CefBrowserSettings);

	handler->Parent(hParent);

	CefWindowInfo windowInfo;
	windowInfo.x = Left;
	windowInfo.y = Top;
	windowInfo.width = Width;
	windowInfo.height = Height;

	windowInfo.SetAsPopup(hParent, lpName);

	CefBrowserHost::CreateBrowser(windowInfo, handler, CefString(lpURL), browserSettings, NULL);

	return handler;
}