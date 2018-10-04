#ifndef CEFAU3_INCLUDE
#define CEFAU3_INCLUDE
#pragma once

#include <windows.h>
#include <stdlib.h>
#include <stdio.h>

#include "include/internal/cef_types.h"
#include "custom/types.h"

cef_string_t cefstring_cs(const char *);
cef_string_t cefstring_wcs(const wchar_t *);

#define cefstring_pwcs(wcs) \
	( &(cef_string_t) { (wchar_t*)wcs, wcslen(wcs) } )

#define cefstring_retfree(_s_) \
	const wchar_t* _wcs_ = _wcsdup(_s_->str); \
	cef_string_userfree_free(_s_); \
	return _wcs_;

#define CefCreation(t)					\
	CEFAU3API t * t ## _Create ()		\
	{									\
		t *p = calloc(1, sizeof(t));	\
		p->self.base.size = sizeof(t);	\
		return p;						\
	}									\

#define func(n, t, ...) \
	t (__cdecl* n) \
		(__VA_ARGS__);

#define func_std(n, t, ...) \
	t (__stdcall* n) \
		(__VA_ARGS__);

#include "au3obj_wrap.h"

#define alloc(sz) calloc(1, sz)

#if defined(_MSC_VER) | defined(__GNUC__)
#define CEFAU3API __declspec(dllexport)
#else
#define CEFAU3API __atribute__ ((dllexport))
#endif

#endif