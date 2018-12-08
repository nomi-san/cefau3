#pragma once
#include "../cefau3.h"
#include "include/capi/cef_app_capi.h"

/* CefApp
--------------------------------------------------*/

typedef struct CefApp {
	cef_app_t self;
	char *OBCLP;
	char *ORCS;
	char *GRBH;
	char *GBPH;
	char *GRPH;
} CefApp;

EXPORT(Au3Obj*) CefApp_Create(CefApp *p);