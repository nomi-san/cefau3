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

CefHandlerFunc(CefGeolocationHandler, on_request_geolocation_permission, ORGP);
CefHandlerFunc(CefGeolocationHandler, on_cancel_geolocation_permission, OCGP);