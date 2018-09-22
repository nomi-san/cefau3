#include "../cefau3.h"

#include "include/capi/cef_life_span_handler_capi.h"

/* CefLifeSpanHandler
--------------------------------------------------*/

CEFAU3API cef_life_span_handler_t * CefLifeSpanHandler_Create()
{
	size_t sz = sizeof(cef_life_span_handler_t);
	cef_life_span_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefLifeSpanHandler_OnBeforePopup(cef_life_span_handler_t *self, void *ptr)
{
	self->on_before_popup = ptr;
}
CEFAU3API void CefLifeSpanHandler_OnAfterCreated(cef_life_span_handler_t *self, void *ptr)
{
	self->on_after_created = ptr;
}
CEFAU3API void CefLifeSpanHandler_DoClose(cef_life_span_handler_t *self, void *ptr)
{
	self->do_close = ptr;
}
CEFAU3API void CefLifeSpanHandler_OnBeforeClose(cef_life_span_handler_t *self, void *ptr)
{
	self->on_before_close = ptr;
}