#include "../cefau3.h"

#include "include/capi/cef_jsdialog_handler_capi.h"

/* CefJSDialogHandler
--------------------------------------------------*/

CEFAU3API cef_jsdialog_handler_t * CefJSDialogHandler_Create()
{
	size_t sz = sizeof(cef_jsdialog_handler_t);
	cef_jsdialog_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefJSDialogHandler_OnJSDialog(cef_jsdialog_handler_t *self, void *p)
{
	self->on_jsdialog = p;
}

CEFAU3API void CefJSDialogHandler_OnBeforeUnloadDialog(cef_jsdialog_handler_t *self, void *p)
{
	self->on_before_unload_dialog = p;
}

CEFAU3API void CefJSDialogHandler_OnResetDialogState(cef_jsdialog_handler_t *self, void *p)
{
	self->on_reset_dialog_state = p;
}

CEFAU3API void CefJSDialogHandler_OnDialogClosed(cef_jsdialog_handler_t *self, void *p)
{
	self->on_dialog_closed = p;
}