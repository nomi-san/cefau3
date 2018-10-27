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

CefHandlerCreate(CefPrintHandler);

CefHandlerFunc(CefPrintHandler, on_print_start, OPSt);
CefHandlerFunc(CefPrintHandler, on_print_settings, OPSe);
CefHandlerFunc(CefPrintHandler, on_print_dialog, OPD);
CefHandlerFunc(CefPrintHandler, on_print_job, OPJ);
CefHandlerFunc(CefPrintHandler, on_print_reset, OPR);
CefHandlerFunc(CefPrintHandler, get_pdf_paper_size, GPPS);