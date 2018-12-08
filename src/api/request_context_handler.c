#include "../cefau3.h"

#include "include/capi/cef_request_handler_capi.h"

/* CefRequestContextHandler
--------------------------------------------------*/

typedef struct CefRequestContextHandler {
	cef_request_context_handler_t self;
	const char *GCM;
	const char *OBPL;
} CefRequestContextHandler;

CefHandlerCreate(CefRequestContextHandler);

CefHandlerFunc(CefRequestContextHandler, get_cookie_manager, GCM);
CefHandlerFunc(CefRequestContextHandler, on_before_plugin_load, OBPL);