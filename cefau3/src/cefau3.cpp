#include "inc.h"

#define INVALID_HWND (HWND)INVALID_HANDLE_VALUE
#define MESSAGE_WINDOW_CLASS L"MessageWindowClass"
#define SandBox (void*)NULL

HWND __mainHandleMessageWindow = INVALID_HWND;
HINSTANCE __mainInstance;
CefSettings __mainSettings;
CefMainArgs __mainArgs;


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

Cefau3_Handler* WINAPI Cef_Init(HINSTANCE hInsance)
{
	if (!hInsance) hInsance = __mainInstance;
	Cefau3_Handler* wCefH(new Cefau3_Handler());
	Cefau3_App* wCefA(new Cefau3_App(wCefH));

	__mainArgs = CefMainArgs(hInsance);
	__mainSettings.no_sandbox = true;
	__mainSettings.single_process = true;
	__mainSettings.multi_threaded_message_loop = true;

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

	CefBrowserSettings browserSettings;
	browserSettings.size = sizeof(CefBrowserSettings);

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