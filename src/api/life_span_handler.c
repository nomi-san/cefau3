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

CefHandlerCreate(CefLifeSpanHandler);

CefHandlerFunc(CefLifeSpanHandler, on_before_popup, OBP);
CefHandlerFunc(CefLifeSpanHandler, on_after_created, OAC);
CefHandlerFunc(CefLifeSpanHandler, do_close, DC);
CefHandlerFunc(CefLifeSpanHandler, on_before_close, OBC);