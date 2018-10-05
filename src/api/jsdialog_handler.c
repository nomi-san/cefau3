#include "../cefau3.h"

#include "include/capi/cef_jsdialog_handler_capi.h"

/* CefJSDialogHandler
--------------------------------------------------*/

typedef struct CefJSDialogHandler {
	cef_jsdialog_handler_t self;
	const char *OJD;
	const char *OBUD;
	const char *ORDS;
	const char *ODC;
} CefJSDialogHandler;

CefCreation(CefJSDialogHandler);

CefHandlerSetGetFunc(CefJSDialogHandler, OJD);
CefHandlerSetGetFunc(CefJSDialogHandler, OBUD);
CefHandlerSetGetFunc(CefJSDialogHandler, ORDS);
CefHandlerSetGetFunc(CefJSDialogHandler, ODC);

CEFAU3API void CefJSDialogHandler_OnJSDialog(CefJSDialogHandler *self, void *p)
{
	self->self.on_jsdialog = p;
}

CEFAU3API void CefJSDialogHandler_OnBeforeUnloadDialog(CefJSDialogHandler *self, void *p)
{
	self->self.on_before_unload_dialog = p;
}

CEFAU3API void CefJSDialogHandler_OnResetDialogState(CefJSDialogHandler *self, void *p)
{
	self->self.on_reset_dialog_state = p;
}

CEFAU3API void CefJSDialogHandler_OnDialogClosed(CefJSDialogHandler *self, void *p)
{
	self->self.on_dialog_closed = p;
}