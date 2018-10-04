#include "../cefau3.h"

#include "include/capi/cef_geolocation_handler_capi.h"

/* CefGeolocationHandler
--------------------------------------------------*/

CEFAU3API cef_geolocation_handler_t * CefGeolocationHandler_Create()
{
	size_t sz = sizeof(cef_geolocation_handler_t);
	cef_geolocation_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefGeolocationHandler_OnRequestGeolocationPermission(
	cef_geolocation_handler_t *self,
	void *ptr)
{
	self->on_request_geolocation_permission = ptr;
}

CEFAU3API void CefGeolocationHandler_OnCancelGeolocationPermission(
	cef_geolocation_handler_t *self,
	void *ptr)
{
	self->on_cancel_geolocation_permission = ptr;
}