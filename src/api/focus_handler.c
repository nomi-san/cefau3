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

CefHandlerCreate(CefFocusHandler);

CefHandlerFunc(CefFocusHandler, on_take_focus, OTF);
CefHandlerFunc(CefFocusHandler, on_set_focus, OSF);
CefHandlerFunc(CefFocusHandler, on_got_focus, OGF);