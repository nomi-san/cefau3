#ifndef AU3OBJ_WRAP_INCLUDE
#define AU3OBJ_WRAP_INCLUDE
#pragma once

#include "cefau3.h"

#ifdef _WIN32
#define __Au3Obj_dll "AutoItObject.dll"
#else
#define __Au3Obj_dll "AutoItObject_X64.dll"
#endif

static void* __Au3Obj_module = NULL;

static func_std(CefAu3Obj_AddMethod, void, void* object, wchar_t* method, wchar_t* value, int new_scope);
static func_std(CefAu3Obj_AddProperty, void, void* object, wchar_t* property_name, int new_scope, void* property_value);
static func_std(CefAu3Obj_CloneAutoItObject, void*, void* parent);
static func_std(CefAu3Obj_CreateAutoItObject, void*);

#endif