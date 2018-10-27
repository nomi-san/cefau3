#pragma once
#include "../cefau3.h"
#include "include/capi/cef_process_message_capi.h"

/* CefProcessMessage
--------------------------------------------------*/

typedef cef_process_message_t CefProcessMessage;

EXPORT(Au3Obj*) CefProcessMessage_Create(CefProcessMessage *p, const wchar_t *name);