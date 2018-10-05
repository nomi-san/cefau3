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

CefHandlerSetGetFunc(CefResourceBundleHandler, GLS);
CefHandlerSetGetFunc(CefResourceBundleHandler, GDR);
CefHandlerSetGetFunc(CefResourceBundleHandler, GDRFS);

CEFAU3API void CefResourceBundleHandler_GetLocalizedString(CefResourceBundleHandler *self, void *p)
{
	self->self.get_localized_string = p;
}

CEFAU3API void CefResourceBundleHandler_GetDataResource(CefResourceBundleHandler *self, void *p)
{
	self->self.get_data_resource = p;
}

CEFAU3API void CefResourceBundleHandler_GetDataResourceForScale(CefResourceBundleHandler *self, void *p)
{
	self->self.get_data_resource_for_scale = p;
}