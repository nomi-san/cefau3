#include "../cefau3.h"

#include "include/capi/cef_keyboard_handler_capi.h"

/* CefKeyboardHandler
--------------------------------------------------*/

CEFAU3API cef_keyboard_handler_t * CefKeyboardHandler_Create()
{
	size_t sz = sizeof(cef_keyboard_handler_t);
	cef_keyboard_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefKeyboardHandler_OnPreKeyEvent(cef_keyboard_handler_t *self, void* ptr)
{
	self->on_pre_key_event = ptr;
}

CEFAU3API void CefKeyboardHandler_OnKeyEvent(cef_keyboard_handler_t *self, void* ptr)
{
	self->on_key_event = ptr;
}
