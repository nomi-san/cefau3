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

typedef struct CefPrintHandler {
	cef_print_handler_t self;
	const char *OPSt;
	const char *OPSe;
	const char *OPD;
	const char *OPJ;
	const char *OPR;
	const char *GPPS;
} CefPrintHandler;

CefCreation(CefPrintHandler);

CefHandlerSetGetFunc(CefPrintHandler, OPSt);
CefHandlerSetGetFunc(CefPrintHandler, OPSe);
CefHandlerSetGetFunc(CefPrintHandler, OPD);
CefHandlerSetGetFunc(CefPrintHandler, OPJ);
CefHandlerSetGetFunc(CefPrintHandler, OPR);
CefHandlerSetGetFunc(CefPrintHandler, GPPS);

CEFAU3API void CefPrintHandler_OnPrintStart(CefPrintHandler* self, void *p)
{
	self->self.on_print_start = p;
}

CEFAU3API void CefPrintHandler_OnPrintSettings(CefPrintHandler* self, void *p)
{
	self->self.on_print_start = p;
}

CEFAU3API void CefPrintHandler_OnPrintDialog(CefPrintHandler* self, void *p)
{
	self->self.on_print_dialog = p;
}

CEFAU3API void CefPrintHandler_OnPrintJob(CefPrintHandler* self, void *p)
{
	self->self.on_print_job = p;
}

CEFAU3API void CefPrintHandler_OnPrintReset(CefPrintHandler* self, void *p)
{
	self->self.on_print_reset = p;
}

CEFAU3API void CefPrintHandler_GetPDFPaperSize(CefPrintHandler *self, void *p)
{
	self->self.get_pdf_paper_size = p;
}