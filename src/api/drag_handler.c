#include "../cefau3.h"

#include "include/capi/cef_drag_handler_capi.h"

/* CefDragHandler
--------------------------------------------------*/

typedef struct CefDragHandler {
	cef_drag_handler_t self;
	const char *ODE;
	const char *ODRC;
} CefDragHandler;

CefHandlerCreate(CefDragHandler);

CefHandlerSetGetFunc(CefDragHandler, ODE);
CefHandlerSetGetFunc(CefDragHandler, ODRC);

CEFAU3API void CefDragHandler_OnDragEnter(CefDragHandler *self, void *ptr)
{
	self->self.on_drag_enter = ptr;
}

CEFAU3API void CefDragHandler_OnDraggableRegionsChanged(CefDragHandler *self, void *ptr)
{
	self->self.on_draggable_regions_changed = ptr;
}