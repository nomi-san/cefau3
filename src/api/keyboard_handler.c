#include "../cefau3.h"

#include "include/capi/cef_keyboard_handler_capi.h"

/* CefKeyboardHandler
--------------------------------------------------*/

typedef struct CefKeyboardHandler {
	cef_keyboard_handler_t self;
	const char *OPKE;
	const char *OKE;
} CefKeyboardHandler;

CefCreation(CefKeyboardHandler);

CefHandlerSetGetFunc(CefKeyboardHandler, OPKE);
CefHandlerSetGetFunc(CefKeyboardHandler, OKE);

CEFAU3API void CefKeyboardHandler_OnPreKeyEvent(CefKeyboardHandler *self, void* ptr)
{
	self->self.on_pre_key_event = ptr;
}

CEFAU3API void CefKeyboardHandler_OnKeyEvent(CefKeyboardHandler *self, void* ptr)
{
	self->self.on_key_event = ptr;
}
