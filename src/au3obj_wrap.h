#ifndef AU3OBJ_WRAP_INCLUDE
#define AU3OBJ_WRAP_INCLUDE
#pragma once

#include "cefau3.h"

#ifdef _WIN32
#define __Au3Obj_dll "AutoItObject.dll"
#else
#define __Au3Obj_dll "AutoItObject_X64.dll"
#endif

typedef struct tagVARIANT VARIANT;

struct _tagVARIANT {
	union {
		struct __tagVARIANT {
			VARTYPE vt;
			WORD wReserved1;
			WORD wReserved2;
			WORD wReserved3;
			union {
				LONGLONG llVal;
				LONG lVal;
				BYTE bVal;
				SHORT iVal;
				FLOAT fltVal;
				DOUBLE dblVal;
				VARIANT_BOOL boolVal;
				_VARIANT_BOOL bool;
				SCODE scode;
				CY cyVal;
				DATE date;
				BSTR bstrVal;
				IUnknown *punkVal;
				IDispatch *pdispVal;
				SAFEARRAY *parray;
				BYTE *pbVal;
				SHORT *piVal;
				LONG *plVal;
				LONGLONG *pllVal;
				FLOAT *pfltVal;
				DOUBLE *pdblVal;
				VARIANT_BOOL *pboolVal;
				_VARIANT_BOOL *pbool;
				SCODE *pscode;
				CY *pcyVal;
				DATE *pdate;
				BSTR *pbstrVal;
				IUnknown **ppunkVal;
				IDispatch **ppdispVal;
				SAFEARRAY **pparray;
				VARIANT *pvarVal;
				PVOID byref;
				CHAR cVal;
				USHORT uiVal;
				ULONG ulVal;
				ULONGLONG ullVal;
				INT intVal;
				UINT uintVal;
				DECIMAL *pdecVal;
				CHAR *pcVal;
				USHORT *puiVal;
				ULONG *pulVal;
				ULONGLONG *pullVal;
				INT *pintVal;
				UINT *puintVal;
				struct __tagBRECORD {
					PVOID pvRecord;
					IRecordInfo *pRecInfo;
				} 	__VARIANT_NAME_4;
			} 	__VARIANT_NAME_3;
		} 	__VARIANT_NAME_2;
		DECIMAL decVal;
	} 	__VARIANT_NAME_1;
};

typedef void* Au3Obj;

static void* __Au3Obj_module = NULL;

static func_std(CefAu3Obj_AddMethod, void, Au3Obj object, wchar_t* method, wchar_t* value, int new_scope);
static func_std(CefAu3Obj_AddProperty, void, Au3Obj object, wchar_t* property_name, int new_scope, void* property_value);
static func_std(CefAu3Obj_CloneAutoItObject, Au3Obj, Au3Obj parent);
static func_std(CefAu3Obj_CreateAutoItObject, Au3Obj);
static func_std(CefAu3Obj_SetPtr, void, Au3Obj, void* val);

#endif