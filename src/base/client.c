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

CefHandlerObjCreate(CefClient);

CefHandlerFunc(CefClient, get_context_menu_handler, GCMH);
CefHandlerFunc(CefClient, get_dialog_handler, GDiaH);
CefHandlerFunc(CefClient, get_display_handler, GDisH);
CefHandlerFunc(CefClient, get_download_handler, GDoH);
CefHandlerFunc(CefClient, get_drag_handler, GDrH);
CefHandlerFunc(CefClient, get_find_handler, GFiH);
CefHandlerFunc(CefClient, get_focus_handler, GFoH);
CefHandlerFunc(CefClient, get_geolocation_handler, GGH);
CefHandlerFunc(CefClient, get_jsdialog_handler, GJH);
CefHandlerFunc(CefClient, get_keyboard_handler, GKH);
CefHandlerFunc(CefClient, get_life_span_handler, GLSH);
CefHandlerFunc(CefClient, get_load_handler, GLH);
CefHandlerFunc(CefClient, get_render_handler, GRenH);
CefHandlerFunc(CefClient, get_request_handler, GReqH);
CefHandlerFunc(CefClient, on_process_message_received, OPMR);