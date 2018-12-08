#include <windows.h>
#include <stdio.h>
#include "dll.h"
#include "object_class.h"
#include "object.h"
#include <OCIdl.h>

BOOL WINAPI DllMain(HINSTANCE hinstDLL,DWORD fdwReason,LPVOID lpvReserved)
{
	switch (fdwReason)
	{
	case DLL_PROCESS_ATTACH:
		// Do something...
		break;
	case DLL_PROCESS_DETACH:
		// Clean up?
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	}

	return TRUE;
}

#ifdef _RELEASE
EXTERN_C BOOL WINAPI main(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	return TRUE;
}
#endif

EXPORT(HRESULT) Au3Obj_VariantClear(VARIANTARG * pvarg)
{
	return VariantClear(pvarg);
}

EXPORT(HRESULT) Au3Obj_VariantCopy(VARIANTARG * pvargDest, VARIANTARG * pvargSrc)
{
	return VariantCopy(pvargDest, pvargSrc);
}

EXPORT(void) Au3Obj_VariantInit(VARIANTARG * pvarg)
{
	VariantInit(pvarg);
}

EXPORT(AutoItObjectClass*) Au3Obj_Class()
{
	return new AutoItObjectClass;
}

EXPORT(AutoItObject*) Au3Obj_Create()
{
	return new AutoItObject;
}

EXPORT(AutoItObject*) Au3Obj_Clone(AutoItObject* old)
{
	return new AutoItObject(old);
}

EXPORT(void) Au3Obj_Init(AUTOITFUNCTIONPROXY autoitfunctionproxy)
{
	AutoItObject::Init(autoitfunctionproxy);
}

EXPORT(void) Au3Obj_AddMethod(AutoItObject* object, wchar_t* method, wchar_t* value, AutoItElement::SCOPE new_scope)
{
	object->AddMethod(method, value, new_scope);
}


EXPORT(void) Au3Obj_RemoveMember(AutoItObject* object, wchar_t* member)
{
	object->RemoveMember(member);
}

EXPORT(void) Au3Obj_AddProperty(AutoItObject* object, wchar_t* property_name,  AutoItElement::SCOPE new_scope, VARIANT* property_value)
{
	object->AddProperty(property_name, new_scope, property_value);
}

EXPORT(void) MemoryCallEntry(DWORD e, DWORD f)
{
	if (e == 0xDEAD && f == 0xBEEF) {
#ifdef _RELEASE
		HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
		DWORD dwWritten;
		WriteFile(hStdout, "Lol. You found the easter-egg. \r\n", sizeof "Lol. You found the easter-egg. \r\n", &dwWritten, NULL);
		FlushFileBuffers(hStdout);
#else
		printf("Lol. You found the easter-egg. \r\n"); fflush(stdout);
#endif
	}
}

EXPORT(ULONG) IUnknownAddRef(IUnknown* object)
{
	return object->AddRef();
}


EXPORT(ULONG) IUnknownRelease(IUnknown* object)
{
	return object->Release();
}


EXPORT(PVOID) ReturnThis(PVOID anything)
{
	return anything;
}



INT debugprintW(const wchar_t* format, ...)
{
#ifndef _RELEASE
	va_list args;
	va_start(args, format);
	int ret = vwprintf(format, args);
	va_end(args);
	fflush(stdout);
	return ret;
#endif
	return 0;
}


INT Compare(const wchar_t* s1, const wchar_t* s2)
{
	return wcscmp(s1, s2);
	//return CompareStringW(LOCALE_SYSTEM_DEFAULT, NORM_IGNORECASE, sString1, -1, sString2, -1) - CSTR_EQUAL;
}


VARTYPE VarType(VARTYPE vtype, LPCWSTR wtype)
{
	if (vtype != VT_BSTR) return VT_ERROR;

	// Array of type identifiers
	static LPWSTR sTypeArray[] = {
		L"none", // 0
		L"byte", // 1
		L"boolean", L"bool", // 2, 3
		L"short", // 4
		L"ushort", L"word", // 5, 6
		L"dword", L"ulong", L"uint", // 7, 8, 9
		L"long", L"int", // 10, 11
		L"variant", // 12
		L"int64", // 13
		L"uint64", // 14
		L"float", // 15
		L"double", // 16
		L"hresult", // 17
		L"str", // 18
		L"wstr", // 19
		L"bstr", // 20
		L"ptr", // 21
		L"handle", L"hwnd", // 22, 23
		L"int_ptr", L"long_ptr", L"lresult", L"lparam", // 24, 25, 26, 27
		L"uint_ptr", L"ulong_ptr", L"dword_ptr", L"wparam", // 28, 29, 30, 31,
		L"idispatch", L"object" // 32, 33
	};

	// Array of matching types
	static VARTYPE VarTypeArray[] = {
		VT_EMPTY, // none
		VT_UI1, // byte
		VT_BOOL, // boolean
		VT_BOOL, // bool
		VT_I2, // short
		VT_UI2, // ushort
		VT_UI2, // word
		VT_UI4, // dword
		VT_UI4, // ulong
		VT_UI4, // uint
		VT_I4, // long
		VT_I4, // int
		VT_VARIANT, // variant
		VT_I8,  // int64
		VT_UI8,  // uint64
		VT_R4, // float
		VT_R8, // double
		VT_UI4, // hresult
		VT_LPSTR, // str
		VT_LPWSTR, // wstr
		VT_BSTR, // bstr
#ifdef _M_X64
		VT_UI8, // ptr
		VT_UI8, // handle
		VT_UI8, // hwnd
		VT_I8, // int_ptr
		VT_I8, // long_ptr
		VT_I8, // lresult
		VT_I8, // lparam
		VT_UI8, // uint_ptr
		VT_UI8, // ulong_ptr
		VT_UI8, // dword_ptr
		VT_UI8, // wparam
#else
		VT_UI4, // ptr
		VT_UI4, // handle
		VT_UI4, // hwnd
		VT_I4, // int_ptr
		VT_I4, // long_ptr
		VT_I4, // lresult
		VT_I4, // lparam
		VT_UI4, // uint_ptr
		VT_UI4, // ulong_ptr
		VT_UI4, // dword_ptr
		VT_UI4, // wparam
#endif
		VT_DISPATCH, // idispatch
		VT_DISPATCH // object
	};

	static DWORD iBound = sizeof(sTypeArray) / sizeof(PVOID);

	// For every element...
	for(DWORD i=0; i < iBound; i++)
	{
		if (Compare(sTypeArray[i], wtype)==0) return VarTypeArray[i];
	}

	// No match if here
	return VT_ILLEGAL;
}


VOID ObjPersist(PVOID ppv)
{
	// Will replicate certain behavior of OleCreate function to support persistence if possible
	// More info at http://msdn.microsoft.com/en-us/library/ms974281.aspx

	IUnknown* pUnk = reinterpret_cast<IUnknown*>(ppv);
	PVOID ppObj;

	if (pUnk->QueryInterface(IID_IPersistStreamInit, &ppObj) == S_OK)
	{
		IPersistStreamInit* pPersistStreamInit = reinterpret_cast<IPersistStreamInit*>(ppObj);
		pPersistStreamInit->InitNew();
		pPersistStreamInit->Release();
	}
	else if (pUnk->QueryInterface(IID_IPersistStorage, &ppObj) == S_OK)
	{
		IPersistStorage* pPersistStorage = reinterpret_cast<IPersistStorage*>(ppObj);
		pPersistStorage->InitNew(NULL);
		pPersistStorage->Release();
	}
}




