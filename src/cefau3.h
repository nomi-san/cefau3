#ifndef CEFAU3_INCLUDE
#define CEFAU3_INCLUDE
#pragma once

#ifdef __cplusplus
#extern "C" {
#endif

#include <windows.h>
#include "util.h"

#include "include/internal/cef_types.h"

#pragma warning( disable : 4090 )

cef_string_t cefstring_cs(const char *);
cef_string_t cefstring_wcs(const wchar_t *);

#include "au3obj_wrap.h"

#define AutoitSetPointerProxy(o, p) Au3Obj_SetPtr(o, p)
#define Au3ObjClone(o) Au3Obj_Clone(o)

#define cef_base_ref_counted_t cef_base_t

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

#define CefHandlerCreate(type)                               \
	EXPORT(Au3Obj*) type ## _Create(Au3Obj *obj, type *ptr)  \
	{                                                        \
		if (!ptr) {                                          \
			ptr = calloc(1, sizeof(type));                   \
			ptr->self.base.size = sizeof(type);              \
		}                                                    \
															 \
		Au3Obj_SetPtr(obj, ptr);	                    	 \
		return Au3Obj_Clone(obj);                            \
	}

#define CefHandlerCreate_Def(t)                \
	EXPORT(Au3Obj*) t ## _Create(Au3Obj*, t*);

#define VA_ARGS(...) , ##__VA_ARGS__

#define CefHandlerElement(type, element, name, ret, ...)                        \
	ret CEF_CALLBACK __ ## type ## _ ## name(type* self VA_ARGS(__VA_ARGS__));  \
	EXPORT(void) type ## _Set_ ## name(type* self, const char *fn)              \
	{                                                                           \
		if (!fn) {                                                              \
			if (self->name) free(self->name);                                   \
			self->self.element = NULL;                                          \
		}                                                                       \
		self->name = _strdup(fn);                                               \
		self->self.element = (void*)__ ## type ## _ ## name;                    \
	}                                                                           \
	EXPORT(const char*) type ## _Get_ ## name(type* self)                       \
	{                                                                           \
		return self->name;                                                      \
	}                                                                           \
	ret CEF_CALLBACK __ ## type ## _ ## name(type* self VA_ARGS(__VA_ARGS__))

#define CefHandlerFunc(t, e, n)                                \
	EXPORT(void) t ## _ ## n(t *self, void* p)                 \
	{                                                          \
		self->self.e = p;                                      \
	}                                                          \
	EXPORT(void) t ## _Set_ ## n(t *self, const char *fn) {    \
		self->n = _strdup(fn);                                 \
	}                                                          \
	EXPORT(const char*) t ## _Get_ ## n(t *self) {             \
		return self->n;                                        \
	}

#if defined(_MSC_VER) | defined(__GNUC__)
#define CEFAU3API __declspec(dllexport)
#else
#define CEFAU3API __atribute__ ((dllexport))
#endif


#ifdef __cplusplus
}
#endif
#endif