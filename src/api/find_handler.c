#include "../cefau3.h"

#include "include/capi/cef_find_handler_capi.h"

/* CefFindHandler
--------------------------------------------------*/

typedef struct CefFindHandler {
	cef_find_handler_t self;
	const char *OFR;
} CefFindHandler;

CefHandlerCreate(CefFindHandler);

CefHandlerFunc(CefFindHandler, on_find_result, OFR);