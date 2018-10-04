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

//--------------------------------------------------

CEFAU3API void CefDisplayHandler_Set_OAC(CefDisplayHandler *self, const char *fn)
{
	self->OAC = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OAC(CefDisplayHandler *self)
{
	return self->OAC;
}

CEFAU3API void CefDisplayHandler_Set_OTC(CefDisplayHandler *self, const char *fn)
{
	self->OTC = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OTC(CefDisplayHandler *self)
{
	return self->OTC;
}

CEFAU3API void CefDisplayHandler_Set_OFUC(CefDisplayHandler *self, const char *fn)
{
	self->OFUC = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OFUC(CefDisplayHandler *self)
{
	return self->OFUC;
}

CEFAU3API void CefDisplayHandler_Set_OFMC(CefDisplayHandler *self, const char *fn)
{
	self->OFMC = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OFMC(CefDisplayHandler *self)
{
	return self->OFMC;
}

CEFAU3API void CefDisplayHandler_Set_OT(CefDisplayHandler *self, const char *fn)
{
	self->OT = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OT(CefDisplayHandler *self)
{
	return self->OT;
}

CEFAU3API void CefDisplayHandler_Set_OSM(CefDisplayHandler *self, const char *fn)
{
	self->OSM = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OSM(CefDisplayHandler *self)
{
	return self->OSM;
}

CEFAU3API void CefDisplayHandler_Set_OCM(CefDisplayHandler *self, const char *fn)
{
	self->OCM = _strdup(fn);
}

CEFAU3API const char *CefDisplayHandler_Get_OCM(CefDisplayHandler *self)
{
	return self->OCM;
}