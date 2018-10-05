#include "../cefau3.h"

#include "include/capi/cef_geolocation_handler_capi.h"

/* CefGeolocationHandler
--------------------------------------------------*/

typedef struct CefGeolocationHandler {
	cef_geolocation_handler_t self;
	const char *ORGP;
	const char *OCGP;
} CefGeolocationHandler;

CefHandlerCreate(CefGeolocationHandler);

CefHandlerSetGetFunc(CefGeolocationHandler, ORGP);
CefHandlerSetGetFunc(CefGeolocationHandler, OCGP);

CEFAU3API void CefGeolocationHandler_OnRequestGeolocationPermission(
	CefGeolocationHandler *self,
	void *ptr)
{
	self->self.on_request_geolocation_permission = ptr;
}

CEFAU3API void CefGeolocationHandler_OnCancelGeolocationPermission(
	CefGeolocationHandler *self,
	void *ptr)
{
	self->self.on_cancel_geolocation_permission = ptr;
}