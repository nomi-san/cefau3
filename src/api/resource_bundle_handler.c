#include "../cefau3.h"

#include "include/capi/cef_resource_bundle_handler_capi.h"

/* CefResourceBundleHandler
--------------------------------------------------*/

CEFAU3API cef_resource_bundle_handler_t * CefResourceBundleHandler_Create()
{
	size_t sz = sizeof(cef_resource_bundle_handler_t);
	cef_resource_bundle_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefResourceBundleHandler_GetLocalizedString(cef_resource_bundle_handler_t *self, void *p)
{
	self->get_localized_string = p;
}

CEFAU3API void CefResourceBundleHandler_GetDataResource(cef_resource_bundle_handler_t *self, void *p)
{
	self->get_data_resource = p;
}

CEFAU3API void CefResourceBundleHandler_GetDataResourceForScale(cef_resource_bundle_handler_t *self, void *p)
{
	self->get_data_resource_for_scale = p;
}