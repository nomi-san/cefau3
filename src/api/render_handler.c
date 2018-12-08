#include "../cefau3.h"

#include "include/capi/cef_render_handler_capi.h"

/* CefRenderHandler
--------------------------------------------------*/

typedef struct CefRenderHandler {
	cef_render_handler_t self;
	const char *GAH;
	const char *GRSR;
	const char *GVR;
	const char *GSP;
	const char *GSI;
	const char *OPSh;
	const char *OPSi;
	const char *OP;
	const char *OCC;
	const char *SD;
	const char *UDC;
	const char *OSOC;
	const char *OICRC;
} CefRenderHandler;

CefHandlerCreate(CefRenderHandler);

CefHandlerFunc(CefRenderHandler, get_accessibility_handler, GAH);
CefHandlerFunc(CefRenderHandler, get_root_screen_rect, GRSR);
CefHandlerFunc(CefRenderHandler, get_view_rect, GVR);
CefHandlerFunc(CefRenderHandler, get_screen_point, GSP);
CefHandlerFunc(CefRenderHandler, get_screen_info, GSI);
CefHandlerFunc(CefRenderHandler, on_popup_show, OPSh);
CefHandlerFunc(CefRenderHandler, on_popup_size, OPSi);
CefHandlerFunc(CefRenderHandler, on_paint, OP);
CefHandlerFunc(CefRenderHandler, on_cursor_change, OCC);
CefHandlerFunc(CefRenderHandler, start_dragging, SD);
CefHandlerFunc(CefRenderHandler, update_drag_cursor, UDC);
CefHandlerFunc(CefRenderHandler, on_scroll_offset_changed, OSOC);
CefHandlerFunc(CefRenderHandler, on_ime_composition_range_changed, OICRC);