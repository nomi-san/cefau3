#include "../cefau3.h"

#include "include/capi/cef_resource_bundle_handler_capi.h"

/* CefResourceBundleHandler
--------------------------------------------------*/

typedef struct CefResourceBundleHandler {
	cef_resource_bundle_handler_t self;
	const char *GLS;
	const char *GDR;
	const char *GDRFS;
} CefResourceBundleHandler;

CefHandlerCreate(CefResourceBundleHandler);

CefHandlerFunc(CefResourceBundleHandler, get_localized_string, GLS);
CefHandlerFunc(CefResourceBundleHandler, get_data_resource, GDR);
CefHandlerFunc(CefResourceBundleHandler, get_data_resource_for_scale, GDRFS);