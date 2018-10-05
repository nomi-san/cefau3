#include "../cefau3.h"

#include "include/capi/cef_request_handler_capi.h"

/* CefRequestContextHandler
--------------------------------------------------*/

typedef struct CefRequestContextHandler {
	cef_request_context_handler_t self;
	const char *GCM;
	const char *OBPL;
} CefRequestContextHandler;

CefCreation(CefRequestContextHandler);

CefHandlerSetGetFunc(CefRequestContextHandler, GCM);
CefHandlerSetGetFunc(CefRequestContextHandler, OBPL);

CEFAU3API void CefRequestContextHandler_GetCookieManager(CefRequestContextHandler *self, void *p)
{
	self->self.get_cookie_manager = p;
}

CEFAU3API void CefRequestContextHandler_OnBeforePluginLoad(CefRequestContextHandler *self, void *p)
{
	self->self.on_before_plugin_load = p;
}