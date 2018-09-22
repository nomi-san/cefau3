#include "../cefau3.h"

#include "include/capi/cef_focus_handler_capi.h"

/* CefFocusHandler
--------------------------------------------------*/

CEFAU3API cef_focus_handler_t *  CefFocusHandler_Create()
{
	size_t sz = sizeof(cef_focus_handler_t);
	cef_focus_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefFocusHandler_OnTakeFocus(cef_focus_handler_t *self, void *ptr)
{
	self->on_take_focus = ptr;
}

CEFAU3API void CefFocusHandler_OnSetFocus(cef_focus_handler_t *self, void *ptr)
{
	self->on_set_focus = ptr;
}

CEFAU3API void CefFocusHandler_OnGotFocus(cef_focus_handler_t *self, void *ptr)
{
	self->on_got_focus = ptr;
}