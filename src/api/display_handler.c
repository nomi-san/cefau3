#include "../cefau3.h"

#include "include/capi/cef_display_handler_capi.h"

/* CefDisplayHandler
--------------------------------------------------*/

typedef struct CefDisplayHandler {
	cef_display_handler_t self;
	const char *OAC;
	const char *OTC;
	const char *OFUC;
	const char *OFMC;
	const char *OT;
	const char *OSM;
	const char *OCM;
} CefDisplayHandler;

//CefHandlerCreate(CefDisplayHandler);
CefHandlerObjCreate(CefDisplayHandler)

CefHandlerFunc(CefDisplayHandler, on_address_change, OAC);
CefHandlerFunc(CefDisplayHandler, on_title_change, OTC);
CefHandlerFunc(CefDisplayHandler, on_favicon_urlchange, OFUC);
CefHandlerFunc(CefDisplayHandler, on_fullscreen_mode_change, OFMC);
CefHandlerFunc(CefDisplayHandler, on_tooltip, OT);
CefHandlerFunc(CefDisplayHandler, on_status_message, OSM);
CefHandlerFunc(CefDisplayHandler, on_console_message, OCM);