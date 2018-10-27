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

CefHandlerCreate(CefJSDialogHandler);

CefHandlerFunc(CefJSDialogHandler, on_jsdialog, OJD);
CefHandlerFunc(CefJSDialogHandler, on_before_unload_dialog, OBUD);
CefHandlerFunc(CefJSDialogHandler, on_reset_dialog_state, ORDS);
CefHandlerFunc(CefJSDialogHandler, on_dialog_closed, ODC);