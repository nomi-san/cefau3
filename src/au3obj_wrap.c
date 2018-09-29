#include "au3obj_wrap.h"

CEFAU3API void CefAu3Obj_Init(const wchar_t* p)
{
	__Au3Obj_module = p ? LoadLibraryW(p) : GetModuleHandleA((LPCSTR)0);

	CefAu3Obj_AddMethod = (void*)GetProcAddress(__Au3Obj_module, "AddMethod");
	CefAu3Obj_AddProperty = (void*)GetProcAddress(__Au3Obj_module, "AddProperty");
	CefAu3Obj_CloneAutoItObject = (void*)GetProcAddress(__Au3Obj_module, "CloneAutoItObject");
	CefAu3Obj_CreateAutoItObject = (void*)GetProcAddress(__Au3Obj_module, "CreateAutoItObject");
}

CEFAU3API void CefAu3Obj_Uninit()
{
	FreeLibrary(__Au3Obj_module);

	CefAu3Obj_AddMethod = NULL;
	CefAu3Obj_AddProperty = NULL;
	CefAu3Obj_CloneAutoItObject = NULL;
	CefAu3Obj_CreateAutoItObject = NULL;
}