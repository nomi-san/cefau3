#include "../cefau3.h"

#include "include/capi/cef_display_handler_capi.h"

/* CefDisplayHandler
--------------------------------------------------*/

CEFAU3API cef_display_handler_t * CefDisplayHandler_Create()
{
	size_t sz = sizeof(cef_display_handler_t);
	cef_display_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefDisplayHandler_OnAddressChange(cef_display_handler_t *self, void* ptr)
{
	self->on_address_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnTitleChange(cef_display_handler_t *self, void* ptr)
{
	self->on_title_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnFaviconUrlChange(cef_display_handler_t *self, void* ptr)
{
	self->on_favicon_urlchange = ptr;
}

CEFAU3API void CefDisplayHandler_OnFullscreenModeChange(cef_display_handler_t *self, void* ptr)
{
	self->on_fullscreen_mode_change = ptr;
}

CEFAU3API void CefDisplayHandler_OnTooltip(cef_display_handler_t *self, void* ptr)
{
	self->on_tooltip = ptr;
}

CEFAU3API void CefDisplayHandler_OnStatusMessage(cef_display_handler_t *self, void* ptr)
{
	self->on_status_message = ptr;
}

CEFAU3API void CefDisplayHandler_OnConsoleMessage(cef_display_handler_t *self, void* ptr)
{
	self->on_console_message = ptr;
}