#include "../cefau3.h"

#include "include/capi/cef_download_item_capi.h"

/* CefDownloadItem
--------------------------------------------------*/

CEFAU3API int CefDownloadItem_IsValid(cef_download_item_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefDownloadItem_IsInProgress(cef_download_item_t* self)
{
	return self->is_in_progress(self);
}

CEFAU3API int CefDownloadItem_IsComplete(cef_download_item_t* self)
{
	return self->is_complete(self);
}

CEFAU3API int CefDownloadItem_IsCanceled(cef_download_item_t* self)
{
	return self->is_canceled(self);
}

CEFAU3API int64 CefDownloadItem_GetCurrentSpeed(cef_download_item_t* self)
{
	return self->get_current_speed(self);
}

CEFAU3API int CefDownloadItem_GetPercentComplete(cef_download_item_t* self)
{
	return self->get_percent_complete(self);
}

CEFAU3API int64 CefDownloadItem_GetTotalBytes(cef_download_item_t* self)
{
	return self->get_total_bytes(self);
}

CEFAU3API int64 CefDownloadItem_GetReceivedBytes(cef_download_item_t* self)
{
	return self->get_received_bytes(self);
}

CEFAU3API cef_time_t CefDownloadItem_GetStartTime(cef_download_item_t* self)
{
	return self->get_start_time(self);
}

CEFAU3API cef_time_t CefDownloadItem_GetEndTime(cef_download_item_t* self)
{
	return self->get_end_time(self);
}

CEFAU3API const wchar_t * CefDownloadItem_GetFullPath(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_full_path(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}

CEFAU3API uint32 CefDownloadItem_GetId(cef_download_item_t* self)
{
	return self->get_id(self);
}

CEFAU3API const wchar_t * CefDownloadItem_GetUrl(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_url(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}

CEFAU3API const wchar_t * CefDownloadItem_GetOriginalUrl(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_original_url(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}

CEFAU3API const wchar_t * CefDownloadItem_GetSuggestedFileName(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_suggested_file_name(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}

CEFAU3API const wchar_t * CefDownloadItem_GetContentDisposition(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_content_disposition(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}

CEFAU3API const wchar_t * CefDownloadItem_GetMimeType(
	cef_download_item_t* self)
{
	cef_string_userfree_t s = self->get_mime_type(self);
	const wchar_t* r = s->str;
	cef_string_userfree_free(s);

	return r;
}