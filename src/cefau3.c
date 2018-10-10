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

#define CEFQUITMESSAGE 0xdeadu
#define CEFMSGTIMERID 0x69u
#define INVALIDHWND (HWND)INVALID_HANDLE_VALUE
HWND __CefWndMsg_HWND = INVALIDHWND;
const wchar_t *__CefWndMsg_Class = TEXT("MessageWindowClass");

CEFAU3API void CefWndMsg_RunLoop(TIMERPROC timer_proc)
{
	SetTimer(__CefWndMsg_HWND, CEFMSGTIMERID, 75, timer_proc);

	MSG msg;
	ZeroMemory(&msg, sizeof(MSG));

	while (GetMessageW(&msg, NULL, 0, 0) > 0) 
	{
		DispatchMessageW(&msg);
		TranslateMessage(&msg);
	}
}

CEFAU3API void CefWndMsg_QuitLoop(int code)
{
	SendMessageW(__CefWndMsg_HWND, CEFQUITMESSAGE, 0, code);
}

LRESULT CALLBACK __CefWndMsg_WndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	switch (msg) {
		case CEFQUITMESSAGE:
			KillTimer(hwnd, CEFMSGTIMERID);
			PostQuitMessage(lp);
			break;
	}
	return DefWindowProcW(hwnd, msg, wp, lp);
}

CEFAU3API HWND CefWndMsg_Create()
{
	if (__CefWndMsg_HWND != INVALIDHWND) return NULL;

	HINSTANCE ins = GetModuleHandleA((const char*)0);

	WNDCLASSEX wcex;
	ZeroMemory(&wcex, sizeof(WNDCLASSEX));

	wcex.cbSize = sizeof(wcex);
	wcex.lpfnWndProc = __CefWndMsg_WndProc;
	wcex.hInstance = ins;
	wcex.lpszClassName = __CefWndMsg_Class;
	RegisterClassEx(&wcex);

	__CefWndMsg_HWND = CreateWindowExW(
		0, __CefWndMsg_Class, NULL, 0, 
		0, 0, 0, 0, 
		HWND_MESSAGE, NULL, ins, NULL
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