#include "../cefau3.h"

#include "include/capi/cef_render_handler_capi.h"

/* CefRenderHandler
--------------------------------------------------*/

CEFAU3API cef_render_handler_t * CefRenderHander_Create()
{
	size_t sz = sizeof(cef_render_handler_t);
	cef_render_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefRenderHandler_GetAccessibilityHandler(cef_render_handler_t *self, ptr p)
{
	self->get_accessibility_handler = p;
}

CEFAU3API void CefRenderHandler_GetRootScreenRect(cef_render_handler_t *self, ptr p)
{
	self->get_root_screen_rect = p;
}

CEFAU3API void CefRenderHandler_GetViewRect(cef_render_handler_t *self, ptr p)
{
	self->get_view_rect = p;
}

CEFAU3API void CefRenderHandler_GetScreenPoint(cef_render_handler_t *self, ptr p)
{
	self->get_screen_point = p;
}

CEFAU3API void CefRenderHandler_GetScreenInfo(cef_render_handler_t *self, ptr p)
{
	self->get_screen_info = p;
}

CEFAU3API void CefRenderHandler_OnPopupShow(cef_render_handler_t *self, ptr p)
{
	self->on_popup_show = p;
}

CEFAU3API void CefRenderHandler_OnPopupSize(cef_render_handler_t *self, ptr p)
{
	self->on_popup_size = p;
}

CEFAU3API void CefRenderHandler_OnPaint(cef_render_handler_t *self, ptr p)
{
	self->on_paint = p;
}

CEFAU3API void CefRenderHandler_OnCursorChange(cef_render_handler_t *self, ptr p)
{
	self->on_cursor_change = p;
}

CEFAU3API void CefRenderHandler_StartDragging(cef_render_handler_t *self, ptr p)
{
	self->start_dragging = p;
}

CEFAU3API void CefRenderHandler_UpdateDragCursor(cef_render_handler_t *self, ptr p)
{
	self->update_drag_cursor = p;
}

CEFAU3API void CefRenderHandler_OnScrollOffsetChanged(cef_render_handler_t *self, ptr p)
{
	self->on_scroll_offset_changed = p;
}

CEFAU3API void CefRenderHandler_OnIMECompositionRangeChanged(cef_render_handler_t *self, ptr p)
{
	self->on_ime_composition_range_changed = p;
}