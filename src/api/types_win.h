#pragma once
#include "../cefau3.h"
#include "include/internal/cef_types_win.h"

/* CefMainArgs
--------------------------------------------------*/

typedef cef_main_args_t CefMainArgs;

EXPORT(Au3Obj*) CefMainArgs_Create(CefMainArgs *p);

/* CefWindowInfo
--------------------------------------------------*/

typedef cef_window_info_t CefWindowInfo;

EXPORT(Au3Obj*) CefWindowInfo_Create(CefWindowInfo *p);