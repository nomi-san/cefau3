#include "../cefau3.h"

#include "include/capi/cef_load_handler_capi.h"

/* CefLoadHandler
--------------------------------------------------*/

typedef struct CefLoadHandler {
	cef_load_handler_t self;
	const char *OLSC;
	const char *OLS;
	const char *OLEn;
	const char *OLEr;
} CefLoadHandler;

CefHandlerCreate(CefLoadHandler);

CefHandlerFunc(CefLoadHandler, on_loading_state_change, OLSC);
CefHandlerFunc(CefLoadHandler, on_load_start, OLS);
CefHandlerFunc(CefLoadHandler, on_load_end, OLEn);
CefHandlerFunc(CefLoadHandler, on_load_error, OLEr);