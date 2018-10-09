#include "cefau3.h"

#include "include/cef_version.h"

static HINSTANCE __main_instance = NULL;

//                            
//  _____     ___         ___ 
// |     |___|  _|___ _ _|_  |
// |   --| -_|  _| .'| | |_  |
// |_____|___|_| |__,|___|___|
//
/*  Chromium Embedded Framework for AutoIt 3
--------------------------------------------------*/

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	__main_instance = hinstDLL;
	return 1;
}

/* CefVersion
--------------------------------------------------*/

CEFAU3API const char * Cef_GetVersion()
{
	return CEF_VERSION;
}

CEFAU3API void Cef_GetChromiumVersion(struct { int v[3]; } *ref)
{
	ref->v[0] = CHROME_VERSION_MAJOR;
	ref->v[1] = CHROME_VERSION_MINOR;
	ref->v[2] = CHROME_VERSION_BUILD;
}

/* CefWndMsg
--------------------------------------------------*/

#define CEFQUITMESSAGE 0x96966969
#define CEFMSGTIMERID 0x69
MSG __CefWndMsg_MSG = { 0 };
HWND __CefWndMsg_HWND = (HWND)INVALID_HANDLE_VALUE;
const wchar_t *__CefWndMsg_Class = TEXT("MessageWindowClass");
void(__stdcall* __CefWndMsg_GUIGetMsg)();

CEFAU3API void CefWndMsg_RunLoop()
{
	while (GetMessageW(&__CefWndMsg_MSG, NULL, 0, 0)) {
		TranslateMessage(&__CefWndMsg_MSG);
		DispatchMessageW(&__CefWndMsg_MSG);
	}
}

CEFAU3API void CefWndMsg_QuitLoop(int code)
{
	SendMessageW(__CefWndMsg_HWND, WM_COMMAND, CEFQUITMESSAGE, code);
}

LRESULT CALLBACK __CefWndMsg_WndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
	LRESULT ret = 0;
	switch (msg) {
		case WM_COMMAND:
			if (wp == CEFQUITMESSAGE) {
				PostQuitMessage(lp);
				KillTimer(hwnd, CEFMSGTIMERID);
			}
			break;

		default: 
			ret = DefWindowProcW(hwnd, msg, wp, lp);
			break;
	}
	return ret;
}

void __stdcall __CefWndMsg_TimerProc(HWND hwnd, UINT msg, UINT_PTR id, DWORD time)
{
	__CefWndMsg_GUIGetMsg();
}

CEFAU3API void CefWndMsg_Create(void* fn_getmsg)
{
	WNDCLASSEX wcex = { 0 };
	wcex.cbSize = sizeof(wcex);
	wcex.lpfnWndProc = __CefWndMsg_WndProc;
	wcex.hInstance = __main_instance;
	wcex.lpszClassName = __CefWndMsg_Class;
	RegisterClassEx(&wcex);
	__CefWndMsg_HWND = CreateWindowExW(
		0, __CefWndMsg_Class, NULL, 0, 
		0, 0, 0, 0, 
		HWND_MESSAGE, NULL, NULL, NULL
	);

	__CefWndMsg_GUIGetMsg = fn_getmsg;
	SetTimer(__CefWndMsg_HWND, CEFMSGTIMERID, 125, __CefWndMsg_TimerProc);
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