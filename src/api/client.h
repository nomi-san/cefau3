#ifndef CEFAU3_CLIENT_H
#define CEFAU3_CLIENT_H

#pragma once
#include "../cefau3.h"
#include "include/capi/cef_client_capi.h"

/* CefClient
--------------------------------------------------*/

typedef struct CefClient {
	cef_client_t self;
	char *GCMH;
	char *GDiaH;
	char *GDisH;
	char *GDoH;
	char *GDrH;
	char *GFiH;
	char *GFoH;
	char *GGH;
	char *GJH;
	char *GKH;
	char *GLSH;
	char *GLH;
	char *GRenH;
	char *GReqH;
	char *OPMR;
} CefClient;

EXPORT(Au3Obj*) CefClient_Create(CefClient *p);

#endif