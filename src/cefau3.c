#include "cefau3.h"

#include "include/cef_version.h"

//                            
//        _____     ___         ___ 
//       |     |___|  _|___ _ _|_  |
//       |   --| -_|  _| .'| | |_  |
//       |_____|___|_| |__,|___|___|
//
/*  Chromium Embedded Framework for AutoIt 3
--------------------------------------------------*/

/* CefVersion
--------------------------------------------------*/

CEFAU3API const char * Cef_GetVersion()
{
	return CEF_VERSION;
}

CEFAU3API void Cef_GetChromiumVersion(int ref[3])
{	
	ref[0] = CHROME_VERSION_MAJOR;
	ref[1] = CHROME_VERSION_MINOR;
	ref[2] = CHROME_VERSION_BUILD;
}

/* CefWndMsg
--------------------------------------------------*/

#define CEFWNDMSG_QUITCODE 0xdeadu
#define CEFWNDMSG_TIMERID 0x69u
#define INVALIDHWND (HWND)INVALID_HANDLE_VALUE
#define CEFWNDMSG_CLASS TEXT("CefWndMsg")
static HWND __CefWndMsg_HWND = INVALIDHWND;

CEFAU3API void CefWndMsg_RunLoop(TIMERPROC timer_proc)
{
	if (timer_proc != NULL)
		SetTimer(__CefWndMsg_HWND, CEFWNDMSG_TIMERID, 50, timer_proc);

	MSG msg;

	while (GetMessageW(&msg, NULL, 0, 0) > 0) 
	{
		DispatchMessageW(&msg);
		TranslateMessage(&msg);
	}
}

CEFAU3API void CefWndMsg_QuitLoop(int code)
{
	KillTimer(__CefWndMsg_HWND, CEFWNDMSG_TIMERID);
	PostMessageW(__CefWndMsg_HWND, CEFWNDMSG_QUITCODE, 0, code);
}

LRESULT CALLBACK __CefWndMsg_WndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	LRESULT ret = 0;
	switch (msg) 
	{
		case CEFWNDMSG_QUITCODE:
			PostQuitMessage(lp);
			break;
		default:
			ret = DefWindowProcW(hwnd, msg, wp, lp);
			break;
	}
	return ret;
}

CEFAU3API HWND CefWndMsg_Create()
{
	if (__CefWndMsg_HWND != INVALIDHWND) return NULL;

	extern void* __ImageBase;
	HINSTANCE ins = (HINSTANCE)&__ImageBase;

	WNDCLASSEX wcex;
	ZeroMemory(&wcex, sizeof(WNDCLASSEX));

	wcex.cbSize = sizeof(wcex);
	wcex.lpfnWndProc = __CefWndMsg_WndProc;
	wcex.hInstance = ins;
	wcex.lpszClassName = CEFWNDMSG_CLASS;
	RegisterClassEx(&wcex);

	__CefWndMsg_HWND = CreateWindowExW(
		0, CEFWNDMSG_CLASS, NULL, 0,
		0, 0, 0, 0, 
		(HWND)-3, NULL, ins, NULL
	);

	return __CefWndMsg_HWND;
}

/* CefMem
--------------------------------------------------*/

CEFAU3API void *CefMem_Alloc(size_t sz)
{
	return calloc(1, sz);
}

CEFAU3API void CefMem_Free(void *p)
{
	if (p) {
		free(p);
		p = (void*)0;
	}
}

CEFAU3API void *CefMem_ReAlloc(void *p, size_t sz)
{
	return realloc(p, sz);
}

/* CefMsgBox (MsgBoxSync)
--------------------------------------------------*/

typedef struct CefMsgBoxData {
	unsigned int flags;
	wchar_t	*title;
	wchar_t	*text;
	HWND	parent;
	int		(__stdcall *fn)(int ret, const char *fn_name);
	char	*fn_name;
} CefMsgBoxData;

unsigned long __stdcall __CefMsgBox_Proc(void* param)
{
	CefMsgBoxData *data = (CefMsgBoxData*)param;
	int ret = 0; 
	
	ret = MessageBoxW(
		data->parent,
		data->text,
		data->title,
		data->flags
	);

	if (data->fn || data->fn_name)
		data->fn(ret, data->fn_name);

	free(data->fn_name);
	free(data->text);
	free(data->title);
	free(data);
	data = NULL;
	return 0;
}

CEFAU3API void CefMsgBox(void* fn, char* fn_name, unsigned int flags, wchar_t *title, wchar_t *text, HWND parent) {
	CefMsgBoxData *data = calloc(1, sizeof(CefMsgBoxData));
	data->flags = flags;
	data->title = _wcsdup(title);
	data->text = _wcsdup(text);
	data->parent = parent;
	data->fn = fn;
	data->fn_name = fn_name ? _strdup(fn_name) : NULL;
	CreateThread(NULL, 0, __CefMsgBox_Proc, data, 0, NULL);
}