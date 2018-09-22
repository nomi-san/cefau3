#include "../cefau3.h"

#include "include/capi/cef_load_handler_capi.h"

/* CefLoadHandler
--------------------------------------------------*/

CEFAU3API cef_load_handler_t * CefLoadHandler_Create()
{
	size_t sz = sizeof(cef_load_handler_t);
	cef_load_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefLoadHandler_OnLoadingStateChange(cef_load_handler_t *self, void* ptr)
{
	self->on_loading_state_change = ptr;
}

CEFAU3API void CefLoadHandler_OnLoadStart(cef_load_handler_t *self, void* ptr)
{
	self->on_load_start = ptr;
}

CEFAU3API void CefLoadHandler_OnLoadEnd(cef_load_handler_t *self, void* ptr)
{
	self->on_load_end = ptr;
}

CEFAU3API void CefLoadHandler_OnLoadError(cef_load_handler_t *self, void* ptr)
{
	self->on_load_error = ptr;
}