#include "../cefau3.h"

#include "include/capi/cef_dialog_handler_capi.h"

/* CefFileDialogCallback
--------------------------------------------------*/

CEFAU3API void CefFileDialogCallback_Continue(struct _cef_file_dialog_callback_t* self,
	int selected_accept_filter,
	cef_string_list_t file_paths)
{
	self->cont(self, selected_accept_filter, file_paths);
}

CEFAU3API void CefFileDialogCallback_Cancel(struct _cef_file_dialog_callback_t* self)
{
	self->cancel(self);
}

/* CefDialogHandler
--------------------------------------------------*/

CEFAU3API cef_dialog_handler_t * CefDialogHandler_Create()
{
	size_t sz = sizeof(cef_dialog_handler_t);
	cef_dialog_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefDialodHandler_OnFileDialog(cef_dialog_handler_t *self, void *ptr)
{
	self->on_file_dialog = ptr;
}