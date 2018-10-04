#include "../cefau3.h"

#include "include/capi/cef_client_capi.h"

typedef struct CefClient {
	cef_client_t self;
	const char *GCMH;
	const char *GDiaH;
	const char *GDisH;
	const char *GDoH;
	const char *GDrH;
	const char *GFiH;
	const char *GFoH;
	const char *GGH;
	const char *GJH;
	const char *GKH;
	const char *GLSH;
	const char *GLH;
	const char *GRenH;
	const char *GReqH;
	const char *OPMR;
} CefClient;

CefCreation(CefClient);

CefHandlerSetGetFunc(CefClient, GCMH);
CefHandlerSetGetFunc(CefClient, GDiaH);
CefHandlerSetGetFunc(CefClient, GDisH);
CefHandlerSetGetFunc(CefClient, GDoH);
CefHandlerSetGetFunc(CefClient, GDrH);
CefHandlerSetGetFunc(CefClient, GFiH);
CefHandlerSetGetFunc(CefClient, GFoH);
CefHandlerSetGetFunc(CefClient, GGH);
CefHandlerSetGetFunc(CefClient, GJH);
CefHandlerSetGetFunc(CefClient, GKH);
CefHandlerSetGetFunc(CefClient, GLSH);
CefHandlerSetGetFunc(CefClient, GLH);
CefHandlerSetGetFunc(CefClient, GRenH);
CefHandlerSetGetFunc(CefClient, GReqH);
CefHandlerSetGetFunc(CefClient, OPMR);

CEFAU3API void CefClient_GetContextMenuHandler(CefClient *self, void* p)
{
	self->self.get_context_menu_handler = p;
}

CEFAU3API void CefClient_GetDialogHandler(CefClient *self, void* p)
{
	self->self.get_dialog_handler = p;
}

CEFAU3API void CefClient_GetDisplayHandler(CefClient *self, void* p)
{
	self->self.get_display_handler = p;
}

CEFAU3API void CefClient_GetDownloadHandler(CefClient *self, void* p)
{
	self->self.get_download_handler = p;
}

CEFAU3API void CefClient_GetDragHandler(CefClient *self, void* p)
{
	self->self.get_drag_handler = p;
}

CEFAU3API void CefClient_GetFindHandler(CefClient *self, void* p)
{
	self->self.get_find_handler = p;
}

CEFAU3API void CefClient_GetFocusHandler(CefClient *self, void* p)
{
	self->self.get_focus_handler = p;
}

CEFAU3API void CefClient_GetGeolocationHandler(CefClient *self, void* p)
{
	self->self.get_geolocation_handler = p;
}

CEFAU3API void CefClient_GetJSDialogHandler(CefClient *self, void* p)
{
	self->self.get_jsdialog_handler = p;
}

CEFAU3API void CefClient_GetKeyboardHandler(CefClient *self, void* p)
{
	self->self.get_keyboard_handler = p;
}

CEFAU3API void CefClient_GetLifeSpanHandler(CefClient *self, void* p)
{
	self->self.get_life_span_handler = p;
}

CEFAU3API void CefClient_GetLoadHandler(CefClient *self, void* p)
{
	self->self.get_load_handler = p;
}

CEFAU3API void CefClient_GetRenderHandler(CefClient *self, void* p)
{
	self->self.get_render_handler = p;
}

CEFAU3API void CefClient_GetRequestHandler(CefClient *self, void* p)
{
	self->self.get_request_handler = p;
}

CEFAU3API void CefClient_OnProcessMessageReceived(CefClient *self, void* p)
{
	self->self.on_process_message_received = p;
}