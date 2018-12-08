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

CefHandlerFunc(CefDragHandler, on_drag_enter, ODE);
CefHandlerFunc(CefDragHandler, on_draggable_regions_changed, ODRC);