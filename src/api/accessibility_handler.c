#include "../cefau3.h"

#include "include/capi/cef_accessibility_handler_capi.h"

/* CefAccessibilityHandler
--------------------------------------------------*/

typedef struct CefAccessibility {
	cef_accessibility_handler_t self;
	const char *OATC;
	const char *OALC;
} CefAccessibility;

CefCreation(CefAccessibility);

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

//--------------------------------------------------

CEFAU3API void CefAccessibilityHandler_Set_OATC(
	CefAccessibility *self, const char *fn)
{
	self->OATC = _strdup(fn);
}

CEFAU3API const char* CefAccessibilityHandler_Get_OATC(
	CefAccessibility *self)
{
	return self->OATC;
}

CEFAU3API void CefAccessibilityHandler_Set_OALC(
	CefAccessibility *self, const char *fn)
{
	self->OALC = _strdup(fn);
}

CEFAU3API const char* CefAccessibilityHandler_Get_OALC(
	CefAccessibility *self)
{
	return self->OALC;
}