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

CefHandlerFunc(CefAccessibility, on_accessibility_tree_change, OATC);
CefHandlerFunc(CefAccessibility, on_accessibility_location_change, OALC);