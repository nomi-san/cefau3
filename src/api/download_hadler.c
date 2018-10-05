#include "../cefau3.h"

#include "include/capi/cef_download_handler_capi.h"

/* CefBeforeDownloadCallback
--------------------------------------------------*/

CEFAU3API void CefBeforeDownloadCallback_Continue(cef_before_download_callback_t *self, wchar_t *download_path, int show_dialog)
{
	self->cont(self, cefstring_pwcs(download_path), show_dialog);
}

/* CefDownloadItemCallback
--------------------------------------------------*/

CEFAU3API void CefDownloadItemCallback_Cancel(cef_download_item_callback_t *self)
{
	self->cancel(self);
}

CEFAU3API void CefDownloadItemCallback_Pause(cef_download_item_callback_t *self)
{
	self->pause(self);
}

CEFAU3API void CefDownloadItemCallback_Resume(cef_download_item_callback_t *self)
{
	self->resume(self);
}

/* CefDownloadHandler
--------------------------------------------------*/

typedef struct CefDownloadHandler {
	cef_download_handler_t self;
	const char *OBD;
	const char *ODU;
} CefDownloadHandler;

CefHandlerCreate(CefDownloadHandler);
CefHandlerFunc(CefDownloadHandler, on_before_download, OBD);
CefHandlerFunc(CefDownloadHandler, on_download_updated, ODU);