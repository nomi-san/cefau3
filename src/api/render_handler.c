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

CefCreation(CefRenderHandler);

CefHandlerSetGetFunc(CefRenderHandler, GAH);
CefHandlerSetGetFunc(CefRenderHandler, GRSR);
CefHandlerSetGetFunc(CefRenderHandler, GVR);
CefHandlerSetGetFunc(CefRenderHandler, GSP);
CefHandlerSetGetFunc(CefRenderHandler, GSI);
CefHandlerSetGetFunc(CefRenderHandler, OPSh);
CefHandlerSetGetFunc(CefRenderHandler, OPSi);
CefHandlerSetGetFunc(CefRenderHandler, OP);
CefHandlerSetGetFunc(CefRenderHandler, OCC);
CefHandlerSetGetFunc(CefRenderHandler, SD);
CefHandlerSetGetFunc(CefRenderHandler, UDC);
CefHandlerSetGetFunc(CefRenderHandler, OSOC);
CefHandlerSetGetFunc(CefRenderHandler, OICRC);

CEFAU3API void CefRenderHandler_GetAccessibilityHandler(CefRenderHandler *self, ptr p)
{
	self->self.get_accessibility_handler = p;
}

CEFAU3API void CefRenderHandler_GetRootScreenRect(CefRenderHandler *self, ptr p)
{
	self->self.get_root_screen_rect = p;
}

CEFAU3API void CefRenderHandler_GetViewRect(CefRenderHandler *self, ptr p)
{
	self->self.get_view_rect = p;
}

CEFAU3API void CefRenderHandler_GetScreenPoint(CefRenderHandler *self, ptr p)
{
	self->self.get_screen_point = p;
}

CEFAU3API void CefRenderHandler_GetScreenInfo(CefRenderHandler *self, ptr p)
{
	self->self.get_screen_info = p;
}

CEFAU3API void CefRenderHandler_OnPopupShow(CefRenderHandler *self, ptr p)
{
	self->self.on_popup_show = p;
}

CEFAU3API void CefRenderHandler_OnPopupSize(CefRenderHandler *self, ptr p)
{
	self->self.on_popup_size = p;
}

CEFAU3API void CefRenderHandler_OnPaint(CefRenderHandler *self, ptr p)
{
	self->self.on_paint = p;
}

CEFAU3API void CefRenderHandler_OnCursorChange(CefRenderHandler *self, ptr p)
{
	self->self.on_cursor_change = p;
}

CEFAU3API void CefRenderHandler_StartDragging(CefRenderHandler *self, ptr p)
{
	self->self.start_dragging = p;
}

CEFAU3API void CefRenderHandler_UpdateDragCursor(CefRenderHandler *self, ptr p)
{
	self->self.update_drag_cursor = p;
}

CEFAU3API void CefRenderHandler_OnScrollOffsetChanged(CefRenderHandler *self, ptr p)
{
	self->self.on_scroll_offset_changed = p;
}

CEFAU3API void CefRenderHandler_OnIMECompositionRangeChanged(CefRenderHandler *self, ptr p)
{
	self->self.on_ime_composition_range_changed = p;
}