#pragma once
#include "../cefau3.h"
#include "include/internal/cef_types.h"
#include "include/internal/cef_string.h"
#include "include/internal/cef_string_list.h"
#include "include/internal/cef_string_map.h"
#include "include/internal/cef_string_multimap.h"

/* CefString
--------------------------------------------------*/

typedef cef_string_t CefString;

EXPORT(Au3Obj*) CefString_Create(CefString* p, wchar_t *wcs);

/* CefStringList
--------------------------------------------------*/

typedef cef_string_list_t CefStringList;

EXPORT(Au3Obj*) CefStringList_Create(CefStringList p);

/* CefStringMap
--------------------------------------------------*/

typedef cef_string_map_t CefStringMap;

EXPORT(Au3Obj*) CefStringMap_Create(CefStringMap *p);