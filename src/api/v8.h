#pragma once
#include "../cefau3.h"
#include "include/capi/cef_v8_capi.h"

/* CefV8Handler
--------------------------------------------------*/

typedef struct CefV8Handler {
	cef_v8handler_t self;
	char *E;
} CefV8Handler;

EXPORT(Au3Obj*) CefV8Handler_Create(CefV8Handler *p);

/* CefV8Value
--------------------------------------------------*/

typedef struct {
	cef_v8value_t self;
} CefV8Value;

EXPORT(Au3Obj*) CefV8Value_Create(CefV8Value *p);