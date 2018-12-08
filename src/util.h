#ifndef CEFAU_UTIL_H
#define CEFAU_UTIL_H
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>

#define def_func(n, t, ...)     \
	t (* n) (__VA_ARGS__);

#define def_func_std(n, t, ...) \
	t (__stdcall* n) (__VA_ARGS__);

#define alloc(sz) calloc(1, sz)

#define str_alloc(s) _strdup(s)
#define str_free(s) free(s)

#define wstr_alloc(s) wcsdup(s)
#define wstr_free(s) free(s)

#define nil ((void*)0)

typedef void* ptr_t;
typedef size_t sz_t;

#ifdef __cplusplus
}

#define EXPORT(t) extern "C" __declspec(dllexport) t 
#define IMPORT(t) extern "C" __declspec(dllimport) t 
#else
#define EXPORT(t) __declspec(dllexport) t 
#define IMPORT(t) __declspec(dllimport) t 

#define bool	_Bool
#define false	0
#define true	1

#endif

#endif