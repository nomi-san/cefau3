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

//--------------------------------------------------

CEFAU3API void CefLifeSpanHandler_Set_OBP(CefLifeSpanHandler *self, const char *fn)
{
	self->OBP = _strdup(fn);
}

CEFAU3API const char *CefLifeSpanHandler_Get_OBP(CefLifeSpanHandler *self)
{
	return self->OBP;
}

CEFAU3API void CefLifeSpanHandler_Set_OAC(CefLifeSpanHandler *self, const char *fn)
{
	self->OAC = _strdup(fn);
}

CEFAU3API const char *CefLifeSpanHandler_Get_OAC(CefLifeSpanHandler *self)
{
	return self->OAC;
}

CEFAU3API void CefLifeSpanHandler_Set_DC(CefLifeSpanHandler *self, const char *fn)
{
	self->DC = _strdup(fn);
}

CEFAU3API const char *CefLifeSpanHandler_Get_DC(CefLifeSpanHandler *self)
{
	return self->DC;
}

CEFAU3API void CefLifeSpanHandler_Set_OBC(CefLifeSpanHandler *self, const char *fn)
{
	self->OBC = _strdup(fn);
}

CEFAU3API const char *CefLifeSpanHandler_Get_OBC(CefLifeSpanHandler *self)
{
	return self->OBC;
}