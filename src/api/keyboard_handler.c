#include "../cefau3.h"

#include "include/capi/cef_keyboard_handler_capi.h"

/* CefKeyboardHandler
--------------------------------------------------*/

typedef struct CefKeyboardHandler {
	cef_keyboard_handler_t self;
	const char *OPKE;
	const char *OKE;
} CefKeyboardHandler;

CefHandlerCreate(CefKeyboardHandler);

CefHandlerFunc(CefKeyboardHandler, on_pre_key_event, OPKE);
CefHandlerFunc(CefKeyboardHandler, on_key_event, OKE);