#include "../cefau3.h"

#include "include/capi/cef_accessibility_handler_capi.h"

/* CefAccessibilityHandler
--------------------------------------------------*/

CEFAU3API cef_accessibility_handler_t * CefAccessibilityHandler_Create()
{
	size_t sz = sizeof(cef_accessibility_handler_t);
	cef_accessibility_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefAccessibilityHandler_OnAccessibilityTreeChange(
	struct _cef_accessibility_handler_t* self, void *p)
{
	self->on_accessibility_tree_change = p;
}

CEFAU3API void CefAccessibilityHandler_OnAccessibilityLocationchange(
	struct _cef_accessibility_handler_t* self, void *p)
{
	self->on_accessibility_location_change = p;
}