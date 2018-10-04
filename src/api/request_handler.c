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

CEFAU3API cef_request_handler_t * CefRequestHandler_Create()
{
	size_t sz = sizeof(cef_request_handler_t);
	cef_request_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefRequestHandler_on_before_browse(cef_request_handler_t *self, void *p)
{
	self->on_before_browse = p;
}

CEFAU3API void CefRequestHandler_on_open_urlfrom_tab(cef_request_handler_t *self, void *p)
{
	self->on_open_urlfrom_tab = p;
}

CEFAU3API void CefRequestHandler_on_before_resource_load(cef_request_handler_t *self, void *p)
{
	self->on_before_resource_load = p;
}

CEFAU3API void CefRequestHandler_get_resource_handler(cef_request_handler_t *self, void *p)
{
	self->get_resource_handler = p;
}

CEFAU3API void CefRequestHandler_on_resource_redirect(cef_request_handler_t *self, void *p)
{
	self->on_resource_redirect = p;
}

CEFAU3API void CefRequestHandler_on_resource_response(cef_request_handler_t *self, void *p)
{
	self->on_resource_response = p;
}

CEFAU3API void CefRequestHandler_get_resource_response_filter(cef_request_handler_t *self, void *p)
{
	self->get_resource_response_filter = p;
}

CEFAU3API void CefRequestHandler_on_resource_load_complete(cef_request_handler_t *self, void *p)
{
	self->on_resource_load_complete = p;
}

CEFAU3API void CefRequestHandler_get_auth_credentials(cef_request_handler_t *self, void *p)
{
	self->get_auth_credentials = p;
}

CEFAU3API void CefRequestHandler_on_quota_request(cef_request_handler_t *self, void *p)
{
	self->on_quota_request = p;
}

CEFAU3API void CefRequestHandler_on_protocol_execution(cef_request_handler_t *self, void *p)
{
	self->on_protocol_execution = p;
}

CEFAU3API void CefRequestHandler_on_certificate_error(cef_request_handler_t *self, void *p)
{
	self->on_certificate_error = p;
}

CEFAU3API void CefRequestHandler_on_select_client_certificate(cef_request_handler_t *self, void *p)
{
	self->on_select_client_certificate = p;
}

CEFAU3API void CefRequestHandler_on_plugin_crashed(cef_request_handler_t *self, void *p)
{
	self->on_plugin_crashed = p;
}

CEFAU3API void CefRequestHandler_on_render_view_ready(cef_request_handler_t *self, void *p)
{
	self->on_render_view_ready = p;
}

CEFAU3API void CefRequestHandler_on_render_process_terminated(cef_request_handler_t *self, void *p)
{
	self->on_render_process_terminated = p;
}