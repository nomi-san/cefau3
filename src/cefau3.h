#ifndef CEFAU3_INCLUDE
#define CEFAU3_INCLUDE
#pragma once

#include <windows.h>
#include <stdlib.h>
#include <stdio.h>

#include "include/internal/cef_types.h"

typedef struct VARIANTa {
	WORD vt;
	WORD r1;
	WORD r2;
	WORD r3;
	void *data;
	void *_;
} VARIANTa;

cef_string_t cefstring_cs(const char *);
cef_string_t cefstring_wcs(const wchar_t *);

typedef void AutoItObject;
typedef AutoItObject* (*AU3OBJ_CLONE)(AutoItObject*);
typedef void (__stdcall *AUTOITESETPOINTERPROXY)(AutoItObject*, void*);
typedef void(*AU3OBJ_ADDPROPERTY)(AutoItObject* object, wchar_t* property_name, UINT new_scope, VARIANT* property_value);

extern AU3OBJ_CLONE Au3ObjClone;
extern AUTOITESETPOINTERPROXY AutoitSetPointerProxy;
extern AU3OBJ_ADDPROPERTY Au3ObjAddProperty;

/*
__inline cef_string_t *cefstring_pwcs(const wchar_t *wcs)
{
	cef_string_t s = { 0 };
	cef_string_from_wide(
		wcs,
		wcslen(wcs),
		&s
	);
	return &s;
}
*/

#define cefstring_pwcs(wcs) \
	( &(cef_string_t) { (wchar_t*)wcs, wcslen(wcs) } )

#define cefstring_retfree(_s_) \
	const wchar_t* _wcs_ = _wcsdup(_s_->str); \
	cef_string_userfree_free(_s_); \
	return _wcs_;

#define CefHandlerCreate(t)             \
	CEFAU3API t * t ## _Create ()		\
	{									\
		t *p = calloc(1, sizeof(t));	\
		p->self.base.size = sizeof(t);	\
		return p;						\
	}									\

#define CefHandlerObjCreate(type)                                           \
	CEFAU3API AutoItObject *type ## _Create(AutoItObject *obj, type *ptr)   \
	{                                                                       \
		if (!ptr) {                                                         \
			ptr = calloc(1, sizeof(type));                                  \
			ptr->self.base.size = sizeof(type);                             \
		}                                                                   \
																			\
		AutoitSetPointerProxy(obj, ptr);                                    \
		return Au3ObjClone(obj);                                            \
	}

#define CefHandlerFunc(t, e, n)                                \
	CEFAU3API void t ## _ ## n(t *self, void* p)               \
	{                                                          \
		self->self.e = p;                                      \
	}                                                          \
	CEFAU3API void t ## _Set_ ## n(t *self, const char *fn) {  \
		self->n = _strdup(fn);                                 \
	}                                                          \
	CEFAU3API const char *t ## _Get_ ## n(t *self) {           \
		return self->n;                                        \
	}

#define func(n, t, ...) \
	t (__cdecl* n) \
		(__VA_ARGS__);

#define func_std(n, t, ...) \
	t (__stdcall* n) \
		(__VA_ARGS__);

#define alloc(sz) calloc(1, sz)

#if defined(_MSC_VER) | defined(__GNUC__)
#define CEFAU3API __declspec(dllexport)
#else
#define CEFAU3API __atribute__ ((dllexport))
#endif

#endif