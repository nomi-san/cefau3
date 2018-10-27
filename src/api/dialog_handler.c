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

typedef struct CefDialogHandler {
	cef_dialog_handler_t self;
	const char *OFD;
} CefDialogHandler;

CefHandlerCreate(CefDialogHandler);

CefHandlerFunc(CefDialogHandler, on_file_dialog, OFD);