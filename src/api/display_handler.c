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

CefCreation(CefDisplayHandler);
CefHandlerSetGetFunc(CefDisplayHandler, OAC);
CefHandlerSetGetFunc(CefDisplayHandler, OTC);
CefHandlerSetGetFunc(CefDisplayHandler, OFUC);
CefHandlerSetGetFunc(CefDisplayHandler, OFMC);
CefHandlerSetGetFunc(CefDisplayHandler, OT);
CefHandlerSetGetFunc(CefDisplayHandler, OSM);
CefHandlerSetGetFunc(CefDisplayHandler, OCM);

CEFAU3API void CefDisplayHandler_OnAddressChange(CefDisplayHandler *self, void* ptr)
{
	self->self.on_address_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnTitleChange(CefDisplayHandler *self, void* ptr)
{
	self->self.on_title_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnFaviconUrlChange(CefDisplayHandler *self, void* ptr)
{
	self->self.on_favicon_urlchange = ptr;
}

CEFAU3API void CefDisplayHandler_OnFullscreenModeChange(CefDisplayHandler *self, void* ptr)
{
	self->self.on_fullscreen_mode_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnTooltip(CefDisplayHandler *self, void* ptr)
{
	self->self.on_tooltip = ptr;
}

CEFAU3API void CefDisplayHandler_OnStatusMessage(CefDisplayHandler *self, void* ptr)
{
	self->self.on_status_message = ptr;
}

CEFAU3API void CefDisplayHandler_OnConsoleMessage(CefDisplayHandler *self, void* ptr)
{
	self->self.on_console_message = ptr;
}