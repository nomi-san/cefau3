#include "../cefau3.h"

#include "include/capi/cef_geolocation_capi.h"

/* CefGeolocationCallback
--------------------------------------------------*/

CEFAU3API cef_get_geolocation_callback_t *  CefGetGeolocationCallback_Create()
{
	size_t sz = sizeof(cef_get_geolocation_callback_t);
	cef_get_geolocation_callback_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API int CefGetGeolocation(cef_get_geolocation_callback_t* callback)
{
	return cef_get_geolocation(callback);
}