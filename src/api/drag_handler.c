#include "../cefau3.h"

#include "include/capi/cef_drag_handler_capi.h"

/* CefDragHandler
--------------------------------------------------*/

CEFAU3API cef_drag_handler_t * CefDragHandler_Create()
{
	size_t sz = sizeof(cef_drag_handler_t);
	struct _cef_drag_handler_t * p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefDragHandler_OnDragEnter(cef_drag_handler_t *self, void *ptr)
{
	self->on_drag_enter = ptr;
}

CEFAU3API void CefDragHandler_OnDraggableRegionsChanged(cef_drag_handler_t *self, void *ptr)
{
	self->on_draggable_regions_changed = ptr;
}