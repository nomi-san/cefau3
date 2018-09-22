#include "../cefau3.h"

#include "include/capi/cef_client_capi.h"

CEFAU3API cef_client_t * CefClient_Create()
{
	size_t sz = sizeof(cef_client_t);
	cef_client_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefClient_GetContextMenuHandler(cef_client_t *self, void* ptr)
{
	self->get_context_menu_handler = ptr;
}

CEFAU3API void CefClient_GetDialogHandler(cef_client_t *self, void* ptr)
{
	self->get_dialog_handler = ptr;
}

CEFAU3API void CefClient_GetDisplayHandler(cef_client_t *self, void* ptr)
{
	self->get_display_handler = ptr;
}

CEFAU3API void CefClient_GetDownloadHandler(cef_client_t *self, void* ptr)
{
	self->get_download_handler = ptr;
}

CEFAU3API void CefClient_GetDragHandler(cef_client_t *self, void* ptr)
{
	self->get_drag_handler = ptr;
}

CEFAU3API void CefClient_GetFindHandler(cef_client_t *self, void* ptr)
{
	self->get_find_handler = ptr;
}

CEFAU3API void CefClient_GetFocusHandler(cef_client_t *self, void* ptr)
{
	self->get_focus_handler = ptr;
}

CEFAU3API void CefClient_GetGeolocationHandler(cef_client_t *self, void* ptr)
{
	self->get_geolocation_handler = ptr;
}

CEFAU3API void CefClient_GetJSDialogHandler(cef_client_t *self, void* ptr)
{
	self->get_jsdialog_handler = ptr;
}

CEFAU3API void CefClient_GetKeyboardHandler(cef_client_t *self, void* ptr)
{
	self->get_keyboard_handler = ptr;
}

CEFAU3API void CefClient_GetLifeSpanHandler(cef_client_t *self, void* ptr)
{
	self->get_life_span_handler = ptr;
}

CEFAU3API void CefClient_GetLoadHandler(cef_client_t *self, void* ptr)
{
	self->get_load_handler = ptr;
}

CEFAU3API void CefClient_GetRenderHandler(cef_client_t *self, void* ptr)
{
	self->get_render_handler = ptr;
}

CEFAU3API void CefClient_GetRequestHandler(cef_client_t *self, void* ptr)
{
	self->get_request_handler = ptr;
}

CEFAU3API void CefClient_OnProcessMessageReceived(cef_client_t *self, void* ptr)
{
	self->on_process_message_received = ptr;
}