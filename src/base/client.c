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

CEFAU3API void CefClient_GetContextMenuHandler(CefClient *self, void* ptr)
{
	self->self.get_context_menu_handler = ptr;
}

CEFAU3API void CefClient_GetDialogHandler(CefClient *self, void* ptr)
{
	self->self.get_dialog_handler = ptr;
}

CEFAU3API void CefClient_GetDisplayHandler(CefClient *self, void* ptr)
{
	self->self.get_display_handler = ptr;
}

CEFAU3API void CefClient_GetDownloadHandler(CefClient *self, void* ptr)
{
	self->self.get_download_handler = ptr;
}

CEFAU3API void CefClient_GetDragHandler(CefClient *self, void* ptr)
{
	self->self.get_drag_handler = ptr;
}

CEFAU3API void CefClient_GetFindHandler(CefClient *self, void* ptr)
{
	self->self.get_find_handler = ptr;
}

CEFAU3API void CefClient_GetFocusHandler(CefClient *self, void* ptr)
{
	self->self.get_focus_handler = ptr;
}

CEFAU3API void CefClient_GetGeolocationHandler(CefClient *self, void* ptr)
{
	self->self.get_geolocation_handler = ptr;
}

CEFAU3API void CefClient_GetJSDialogHandler(CefClient *self, void* ptr)
{
	self->self.get_jsdialog_handler = ptr;
}

CEFAU3API void CefClient_GetKeyboardHandler(CefClient *self, void* ptr)
{
	self->self.get_keyboard_handler = ptr;
}

CEFAU3API void CefClient_GetLifeSpanHandler(CefClient *self, void* ptr)
{
	self->self.get_life_span_handler = ptr;
}

CEFAU3API void CefClient_GetLoadHandler(CefClient *self, void* ptr)
{
	self->self.get_load_handler = ptr;
}

CEFAU3API void CefClient_GetRenderHandler(CefClient *self, void* ptr)
{
	self->self.get_render_handler = ptr;
}

CEFAU3API void CefClient_GetRequestHandler(CefClient *self, void* ptr)
{
	self->self.get_request_handler = ptr;
}

CEFAU3API void CefClient_OnProcessMessageReceived(CefClient *self, void* ptr)
{
	self->self.on_process_message_received = ptr;
}

//--------------------------------------------------

CEFAU3API void CefClient_Set_GCMH(CefClient *self, const char *fn)
{
	self->GCMH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GCMH(CefClient *self)
{
	return self->GCMH;
}

CEFAU3API void CefClient_Set_GDiaH(CefClient *self, const char *fn)
{
	self->GDiaH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GDiaH(CefClient *self)
{
	return self->GDiaH;
}

CEFAU3API void CefClient_Set_GDisH(CefClient *self, const char *fn)
{
	self->GDisH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GDisH(CefClient *self)
{
	return self->GDisH;
}

CEFAU3API void CefClient_Set_GDoH(CefClient *self, const char *fn)
{
	self->GDoH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GDoH(CefClient *self)
{
	return self->GDoH;
}

CEFAU3API void CefClient_Set_GDrH(CefClient *self, const char *fn)
{
	self->GDrH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GDrH(CefClient *self)
{
	return self->GDrH;
}

CEFAU3API void CefClient_Set_GFiH(CefClient *self, const char *fn)
{
	self->GFiH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GFiH(CefClient *self)
{
	return self->GFiH;
}

CEFAU3API void CefClient_Set_GFoH(CefClient *self, const char *fn)
{
	self->GFoH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GFoH(CefClient *self)
{
	return self->GFoH;
}

CEFAU3API void CefClient_Set_GGH(CefClient *self, const char *fn)
{
	self->GGH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GGH(CefClient *self)
{
	return self->GGH;
}

CEFAU3API void CefClient_Set_GJH(CefClient *self, const char *fn)
{
	self->GJH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GJH(CefClient *self)
{
	return self->GJH;
}

CEFAU3API void CefClient_Set_GKH(CefClient *self, const char *fn)
{
	self->GKH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GKH(CefClient *self)
{
	return self->GKH;
}

CEFAU3API void CefClient_Set_GLSH(CefClient *self, const char *fn)
{
	self->GLSH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GLSH(CefClient *self)
{
	return self->GLSH;
}

CEFAU3API void CefClient_Set_GLH(CefClient *self, const char *fn)
{
	self->GLH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GLH(CefClient *self)
{
	return self->GLH;
}

CEFAU3API void CefClient_Set_GRenH(CefClient *self, const char *fn)
{
	self->GRenH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GRenH(CefClient *self)
{
	return self->GRenH;
}

CEFAU3API void CefClient_Set_GReqH(CefClient *self, const char *fn)
{
	self->GReqH = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_GReqH(CefClient *self)
{
	return self->GReqH;
}

CEFAU3API void CefClient_Set_OPMR(CefClient *self, const char *fn)
{
	self->OPMR = _strdup(fn);
}

CEFAU3API const char *CefClient_Get_OPMR(CefClient *self)
{
	return self->OPMR;
}