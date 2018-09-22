#include "../cefau3.h"

#include "include/capi/cef_download_handler_capi.h"

/* CefDownloadHandler
--------------------------------------------------*/

CEFAU3API void CefBeforeDownloadCallback_Continue(cef_before_download_callback_t *self, wchar_t *download_path, int show_dialog)
{
	self->cont(self, cefstring_pwcs(download_path), show_dialog);
}

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

CEFAU3API cef_download_handler_t * CefDowbloadHandler_New()
{
	size_t sz = sizeof(cef_download_handler_t);
	cef_download_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefDownloadHandler_OnBeforeDownload(cef_download_handler_t *self, void* ptr)
{
	self->on_before_download = ptr;
}

CEFAU3API void CefDownloadHandler_OnDownloadUpdated(cef_download_handler_t *self, void* ptr)
{
	self->on_download_updated = ptr;
}