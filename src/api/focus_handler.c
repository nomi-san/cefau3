#include "../cefau3.h"

#include "include/capi/cef_focus_handler_capi.h"

/* CefFocusHandler
--------------------------------------------------*/

typedef struct CefFocusHandler {
	cef_focus_handler_t self;
	const char *OTF;
	const char *OSF;
	const char *OGF;
} CefFocusHandler;

CefCreation(CefFocusHandler);

CefHandlerSetGetFunc(CefFocusHandler, OTF);
CefHandlerSetGetFunc(CefFocusHandler, OSF);
CefHandlerSetGetFunc(CefFocusHandler, OGF);

CEFAU3API void CefFocusHandler_OnTakeFocus(CefFocusHandler *self, void *ptr)
{
	self->self.on_take_focus = ptr;
}

CEFAU3API void CefFocusHandler_OnSetFocus(CefFocusHandler *self, void *ptr)
{
	self->self.on_set_focus = ptr;
}

CEFAU3API void CefFocusHandler_OnGotFocus(CefFocusHandler *self, void *ptr)
{
	self->self.on_got_focus = ptr;
}