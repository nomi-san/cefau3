#include "../cefau3.h"

#include "include/capi/cef_life_span_handler_capi.h"

/* CefLifeSpanHandler
--------------------------------------------------*/

typedef struct CefLifeSpanHandler {
	cef_life_span_handler_t self;
	const char *OBP;
	const char *OAC;
	const char *DC;
	const char *OBC;
} CefLifeSpanHandler;

CefCreation(CefLifeSpanHandler);

CefHandlerSetGetFunc(CefLifeSpanHandler, OBP);
CefHandlerSetGetFunc(CefLifeSpanHandler, OAC);
CefHandlerSetGetFunc(CefLifeSpanHandler, DC);
CefHandlerSetGetFunc(CefLifeSpanHandler, OBC);

CEFAU3API void CefLifeSpanHandler_OnBeforePopup(CefLifeSpanHandler *self, void *ptr)
{
	self->self.on_before_popup = ptr;
}

CEFAU3API void CefLifeSpanHandler_OnAfterCreated(CefLifeSpanHandler *self, void *ptr)
{
	self->self.on_after_created = ptr;
}

CEFAU3API void CefLifeSpanHandler_DoClose(CefLifeSpanHandler *self, void *ptr)
{
	self->self.do_close = ptr;
}

CEFAU3API void CefLifeSpanHandler_OnBeforeClose(CefLifeSpanHandler *self, void *ptr)
{
	self->self.on_before_close = ptr;
}