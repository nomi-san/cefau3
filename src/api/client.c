#include "client.h"
#include "browser.h"
#include "process_message.h"

/* CefClient
--------------------------------------------------*/

static Au3Obj* CefClient_obj;

static void* (__stdcall *CefClient_GCMH)(char*);
static void* (__stdcall *CefClient_GDiaH)(char*);
static void* (__stdcall *CefClient_GDisH)(char*);
static void* (__stdcall *CefClient_GDoH)(char*);
static void* (__stdcall *CefClient_GDrH)(char*);
static void* (__stdcall *CefClient_GFiH)(char*);
static void* (__stdcall *CefClient_GFoH)(char*);
static void* (__stdcall *CefClient_GGH)(char*);
static void* (__stdcall *CefClient_GJH)(char*);
static void* (__stdcall *CefClient_GKH)(char*);
static void* (__stdcall *CefClient_GLSH)(char*);
static void* (__stdcall *CefClient_GLH)(char*);
static void* (__stdcall *CefClient_GRenH)(char*);
static void* (__stdcall *CefClient_GReqH)(char*);

static int (__stdcall *CefClient_OPMR)(char*,
	Au3Obj* browser,
	cef_process_id_t source_process,
	Au3Obj* message);

EXPORT(void) CefClient_Init(Au3Obj *obj, void *GCMH, void *GDiaH, void *GDisH, void *GDoH, void *GDrH)
{
	CefClient_obj = obj;
	CefClient_GCMH = GCMH;
	CefClient_GDiaH = GDiaH;
	CefClient_GDisH = GDisH;
	CefClient_GDoH = GDoH;
	CefClient_GDrH = GDrH;
}

EXPORT(void) CefClient_Init2(void *GFiH, void *GFoH, void *GGH, void *GJH, void *GKH)
{
	CefClient_GFiH = GFiH;
	CefClient_GFoH = GFoH;
	CefClient_GGH = GGH;
	CefClient_GJH = GJH;
	CefClient_GKH = GKH;
}

EXPORT(void) CefClient_Init3(void *GLSH, void *GLH, void *GRenH, void *GReqH, void *OPMR)
{
	CefClient_GLSH = GLSH;
	CefClient_GLH = GLH;
	CefClient_GRenH = GRenH;
	CefClient_GReqH = GReqH;
}

EXPORT(Au3Obj*) CefClient_Create(CefClient *p)
{
	if (!p) {
		p = alloc(sizeof(CefClient));
		p->self.base.size = sizeof(CefClient);
	}

	AutoitSetPointerProxy(CefClient_obj, p);
	return Au3ObjClone(CefClient_obj);
}

CefHandlerElement(CefClient, get_context_menu_handler, GCMH, void*)
{
	return CefClient_GCMH(self->GCMH);
}

CefHandlerElement(CefClient, get_dialog_handler, GDiaH, void*)
{
	return CefClient_GDiaH(self->GDiaH);
}

CefHandlerElement(CefClient, get_display_handler, GDisH, void*)
{
	return CefClient_GDisH(self->GDisH);
}

CefHandlerElement(CefClient, get_download_handler, GDoH, void*)
{
	return CefClient_GDoH(self->GDoH);
}

CefHandlerElement(CefClient, get_drag_handler, GDrH, void*)
{
	return CefClient_GDrH(self->GDrH);
}

CefHandlerElement(CefClient, get_find_handler, GFiH, void*)
{
	return CefClient_GFiH(self->GFiH);
}

CefHandlerElement(CefClient, get_focus_handler, GFoH, void*)
{
	return CefClient_GFoH(self->GFoH);
}

CefHandlerElement(CefClient, get_geolocation_handler, GGH, void*)
{
	return CefClient_GGH(self->GGH);
}

CefHandlerElement(CefClient, get_jsdialog_handler, GJH, void*)
{
	return CefClient_GJH(self->GJH);
}

CefHandlerElement(CefClient, get_keyboard_handler, GKH, void*)
{
	return CefClient_GKH(self->GKH);
}

CefHandlerElement(CefClient, get_life_span_handler, GLSH, void*)
{
	return CefClient_GLSH(self->GLSH);
}

CefHandlerElement(CefClient, get_load_handler, GLH, void*)
{
	return CefClient_GLH(self->GLH);
}

CefHandlerElement(CefClient, get_render_handler, GRenH, void*)
{
	return CefClient_GRenH(self->GRenH);
}

CefHandlerElement(CefClient, get_request_handler, GReqH, void*)
{
	return CefClient_GReqH(self->GReqH);
}

CefHandlerElement(CefClient, on_process_message_received, OPMR, int,
	CefBrowser* browser,
	cef_process_id_t source_process,
	CefProcessMessage* message)
{
	return CefClient_OPMR(
		self->OPMR,
		CefBrowser_Create(browser),
		source_process,
		CefProcessMessage_Create(message, nil)
	);
}