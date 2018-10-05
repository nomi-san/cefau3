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

CefCreation(CefRequestHandler);

CefHandlerSetGetFunc(CefRequestHandler, OBB);
CefHandlerSetGetFunc(CefRequestHandler, OOUFT);
CefHandlerSetGetFunc(CefRequestHandler, OBRL);
CefHandlerSetGetFunc(CefRequestHandler, GRH);
CefHandlerSetGetFunc(CefRequestHandler, ORRed);
CefHandlerSetGetFunc(CefRequestHandler, ORRes);
CefHandlerSetGetFunc(CefRequestHandler, GRRF);
CefHandlerSetGetFunc(CefRequestHandler, ORLC);
CefHandlerSetGetFunc(CefRequestHandler, GAC);
CefHandlerSetGetFunc(CefRequestHandler, OQR);
CefHandlerSetGetFunc(CefRequestHandler, OPE);
CefHandlerSetGetFunc(CefRequestHandler, OCE);
CefHandlerSetGetFunc(CefRequestHandler, OSCC);
CefHandlerSetGetFunc(CefRequestHandler, OPC);
CefHandlerSetGetFunc(CefRequestHandler, ORVL);
CefHandlerSetGetFunc(CefRequestHandler, ORPT);

CEFAU3API void CefRequestHandler_OBB(CefRequestHandler *self, void *p)
{
	self->self.on_before_browse = p;
}

CEFAU3API void CefRequestHandler_OOUFT(CefRequestHandler *self, void *p)
{
	self->self.on_open_urlfrom_tab = p;
}

CEFAU3API void CefRequestHandler_OBRL(CefRequestHandler *self, void *p)
{
	self->self.on_before_resource_load = p;
}

CEFAU3API void CefRequestHandler_GRH(CefRequestHandler *self, void *p)
{
	self->self.get_resource_handler = p;
}

CEFAU3API void CefRequestHandler_ORRed(CefRequestHandler *self, void *p)
{
	self->self.on_resource_redirect = p;
}

CEFAU3API void CefRequestHandler_ORRes(CefRequestHandler *self, void *p)
{
	self->self.on_resource_response = p;
}

CEFAU3API void CefRequestHandler_GRRF(CefRequestHandler *self, void *p)
{
	self->self.get_resource_response_filter = p;
}

CEFAU3API void CefRequestHandler_ORLC(CefRequestHandler *self, void *p)
{
	self->self.on_resource_load_complete = p;
}

CEFAU3API void CefRequestHandler_GAC(CefRequestHandler *self, void *p)
{
	self->self.get_auth_credentials = p;
}

CEFAU3API void CefRequestHandler_OQR(CefRequestHandler *self, void *p)
{
	self->self.on_quota_request = p;
}

CEFAU3API void CefRequestHandler_OPE(CefRequestHandler *self, void *p)
{
	self->self.on_protocol_execution = p;
}

CEFAU3API void CefRequestHandler_OCE(CefRequestHandler *self, void *p)
{
	self->self.on_certificate_error = p;
}

CEFAU3API void CefRequestHandler_OSCC(CefRequestHandler *self, void *p)
{
	self->self.on_select_client_certificate = p;
}

CEFAU3API void CefRequestHandler_OPC(CefRequestHandler *self, void *p)
{
	self->self.on_plugin_crashed = p;
}

CEFAU3API void CefRequestHandler_ORVL(CefRequestHandler *self, void *p)
{
	self->self.on_render_view_ready = p;
}

CEFAU3API void CefRequestHandler_ORPT(CefRequestHandler *self, void *p)
{
	self->self.on_render_process_terminated = p;
}