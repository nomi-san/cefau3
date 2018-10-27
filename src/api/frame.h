#pragma once
#include "../cefau3.h"
#include "include/capi/cef_frame_capi.h"

/* CefFrame
--------------------------------------------------*/

typedef cef_frame_t CefFrame;

EXPORT(Au3Obj*) CefFrame_Create(CefFrame* p);