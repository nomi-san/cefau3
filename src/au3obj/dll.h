#pragma warning( disable : 4244 ) // this to that; it's deliberate

#pragma once

#define EXPORT(TYPE) extern "C" __declspec(dllexport) TYPE __cdecl //__stdcall

#if defined(_M_IA64) || defined(_M_X64) || defined(_WIN64)
#define _X64 true
//#define _M_X64
#else
#define _X64 false
#endif

#define _RELEASE // comment-out this line if you want to initialize tlibc

INT Compare(const wchar_t *s1, const wchar_t *s2);

INT debugprintW(const wchar_t *format, ...);

VARTYPE VarType(VARTYPE vtype, LPCWSTR wtype);

//VOID ObjPersist(LPVOID ppv);