#include "../cefau3.h"

#include "include/capi/cef_accessibility_handler_capi.h"

/* CefAccessibilityHandler
--------------------------------------------------*/

typedef struct CefAccessibility {
	cef_accessibility_handler_t self;
	const char *OATC;
	const char *OALC;
} CefAccessibility;

CefHandlerCreate(CefAccessibility);

CefHandlerSetGetFunc(CefAccessibility, OATC);
CefHandlerSetGetFunc(CefAccessibility, OALC);

//--------------------------------------------------

CEFAU3API void CefAccessibilityHandler_pOATC(
	CefAccessibility *self, void *p)
{
	self->self.on_accessibility_tree_change = p;
}

CEFAU3API void CefAccessibilityHandler_pOALC(
	CefAccessibility *self, void *p)
{
	self->self.on_accessibility_location_change = p;
}