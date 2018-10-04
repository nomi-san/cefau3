#include "../cefau3.h"

#include "include/capi/cef_request_handler_capi.h"

/* CefRequestContextHandler
--------------------------------------------------*/

CEFAU3API cef_request_context_handler_t * CefRequestContextHandler_Create()
{
	size_t sz = sizeof(cef_request_context_handler_t);
	cef_request_context_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefRequestContextHandler_GetCookieManager(cef_request_context_handler_t *self, void *p)
{
	self->get_cookie_manager = p;
}

CEFAU3API void CefRequestContextHandler_OnBeforePluginLoad(cef_request_context_handler_t *self, void *p)
{
	self->on_before_plugin_load = p;
}