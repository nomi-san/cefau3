#include "../cefau3.h"

#include "include/capi/cef_request_handler_capi.h"

/* CefRequestCallback
--------------------------------------------------*/

CEFAU3API void CefRequestCallback_Continue(struct _cef_request_callback_t* self, int allow)
{
	self->cont(self, allow);
}

CEFAU3API void CefRequestCallback_Cancel(struct _cef_request_callback_t* self)
{
	self->cancel(self);
}

/* CefSelectClientCertificateCallback
--------------------------------------------------*/

CEFAU3API void CefSelectClientCertificateCallback_Select(
	struct _cef_select_client_certificate_callback_t* self,
	struct _cef_x509certificate_t* cert)
{
	self->select(self, cert);
}

/* CefRequestHandler
--------------------------------------------------*/

typedef struct CefRequestHandler {
	cef_request_handler_t self;
	const char *OBB;
	const char *OOUFT;
	const char *OBRL;
	const char *GRH;
	const char *ORRed;
	const char *ORRes;
	const char *GRRF;
	const char *ORLC;
	const char *GAC;
	const char *OQR;
	const char *OPE;
	const char *OCE;
	const char *OSCC;
	const char *OPC;
	const char *ORVL;
	const char *ORPT;
} CefRequestHandler;

CefHandlerCreate(CefRequestHandler);

CefHandlerFunc(CefRequestHandler, on_before_browse, OBB);
CefHandlerFunc(CefRequestHandler, on_open_urlfrom_tab, OOUFT);
CefHandlerFunc(CefRequestHandler, on_before_resource_load, OBRL);
CefHandlerFunc(CefRequestHandler, get_resource_handler, GRH);
CefHandlerFunc(CefRequestHandler, on_resource_redirect, ORRed);
CefHandlerFunc(CefRequestHandler, on_resource_response, ORRes);
CefHandlerFunc(CefRequestHandler, get_resource_response_filter, GRRF);
CefHandlerFunc(CefRequestHandler, on_resource_load_complete, ORLC);
CefHandlerFunc(CefRequestHandler, get_auth_credentials, GAC);
CefHandlerFunc(CefRequestHandler, on_quota_request, OQR);
CefHandlerFunc(CefRequestHandler, on_protocol_execution, OPE);
CefHandlerFunc(CefRequestHandler, on_certificate_error, OCE);
CefHandlerFunc(CefRequestHandler, on_select_client_certificate, OSCC);
CefHandlerFunc(CefRequestHandler, on_plugin_crashed, OPC);
CefHandlerFunc(CefRequestHandler, on_render_view_ready, ORVL);
CefHandlerFunc(CefRequestHandler, on_render_process_terminated, ORPT);