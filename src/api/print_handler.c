#include "../cefau3.h"

#include "include/capi/cef_print_handler_capi.h"

/* CefPrintDialogCallback
--------------------------------------------------*/

CEFAU3API void CefPrintDialogCallback_Continue(struct _cef_print_dialog_callback_t* self,
	struct _cef_print_settings_t* settings)
{
	self->cont(self, settings);
}

CEFAU3API void CefPrintDialogCallback_Cancel(struct _cef_print_dialog_callback_t* self)
{
	self->cancel(self);
}

/* CefPrintJobCallback
--------------------------------------------------*/

CEFAU3API void CefPrintJobCallback_Continue(struct _cef_print_job_callback_t* self)
{
	self->cont(self);
}

/* CefPrintHandler
--------------------------------------------------*/

CEFAU3API cef_print_handler_t * CefPrintHandler_Create()
{
	size_t sz = sizeof(cef_print_handler_t);
	cef_print_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefPrintHandler_OnPrintStart(struct _cef_print_handler_t* self, void *p)
{
	self->on_print_start = p;
}

CEFAU3API void CefPrintHandler_OnPrintSettings(struct _cef_print_handler_t* self, void *p)
{
	self->on_print_start = p;
}

CEFAU3API void CefPrintHandler_OnPrintDialog(struct _cef_print_handler_t* self, void *p)
{
	self->on_print_dialog = p;
}

CEFAU3API void CefPrintHandler_OnPrintJob(struct _cef_print_handler_t* self, void *p)
{
	self->on_print_job = p;
}

CEFAU3API void CefPrintHandler_OnPrintReset(struct _cef_print_handler_t* self, void *p)
{
	self->on_print_reset = p;
}

CEFAU3API void CefPrintHandler_GetPDFPaperSize(struct _cef_print_handler_t *self, void *p)
{
	self->get_pdf_paper_size = p;
}