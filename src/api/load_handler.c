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

CefHandlerSetGetFunc(CefLoadHandler, OLSC);
CefHandlerSetGetFunc(CefLoadHandler, OLS);
CefHandlerSetGetFunc(CefLoadHandler, OLEn);
CefHandlerSetGetFunc(CefLoadHandler, OLEr);

CEFAU3API void CefLoadHandler_OnLoadingStateChange(CefLoadHandler *self, void* p)
{
	self->self.on_loading_state_change = p;
}

CEFAU3API void CefLoadHandler_OnLoadStart(CefLoadHandler *self, void* p)
{
	self->self.on_load_start = p;
}

CEFAU3API void CefLoadHandler_OnLoadEnd(CefLoadHandler *self, void* p)
{
	self->self.on_load_end = p;
}

CEFAU3API void CefLoadHandler_OnLoadError(CefLoadHandler *self, void* p)
{
	self->self.on_load_error = p;
}