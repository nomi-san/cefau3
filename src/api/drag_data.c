#include "../cefau3.h"

#include "include/capi/cef_drag_data_capi.h"

/* CefDragData
--------------------------------------------------*/

CEFAU3API struct _cef_drag_data_t* CefDragData_Clone(struct _cef_drag_data_t* self)
{
	return self->clone(self);
}

CEFAU3API int CefDragData_IsReadOnly(struct _cef_drag_data_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API int CefDragData_IsLink(struct _cef_drag_data_t* self)
{
	return self->is_link(self);
}

CEFAU3API int CefDragData_IsFragment(struct _cef_drag_data_t* self)
{
	return self->is_fragment(self);
}

CEFAU3API int CefDragData_IsFile(struct _cef_drag_data_t* self)
{
	return self->is_file(self);
}

CEFAU3API const wchar_t* CefDragData_GetLinkUrl(
	struct _cef_drag_data_t* self)
{
	return self->get_link_url(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetLinkTitle(
	struct _cef_drag_data_t* self)
{
	return self->get_link_title(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetLinkMetadata(
	struct _cef_drag_data_t* self)
{
	return self->get_link_metadata(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetFragmentText(
	struct _cef_drag_data_t* self)
{
	return self->get_fragment_text(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetFragmentHtml(
	struct _cef_drag_data_t* self)
{
	return self->get_fragment_html(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetFragmentBaseUrl(
	struct _cef_drag_data_t* self)
{
	return self->get_fragment_base_url(self)->str;
}

CEFAU3API const wchar_t* CefDragData_GetFileName(
	struct _cef_drag_data_t* self)
{
	return self->get_file_name(self)->str;
}

CEFAU3API size_t CefDragData_GetFileContents(struct _cef_drag_data_t* self,
	struct _cef_stream_writer_t* writer)
{
	return self->get_file_contents(self, writer);
}

CEFAU3API int CefDragData_GetFileNames(struct _cef_drag_data_t* self,
	cef_string_list_t names)
{
	return self->get_file_names(self, names);
}

CEFAU3API void CefDragData_SetLinkUrl(struct _cef_drag_data_t* self,
	const wchar_t* url)
{
	self->set_link_url(self, cefstring_pwcs(url));
}

CEFAU3API void CefDragData_SetLinkTitle(struct _cef_drag_data_t* self,
	const wchar_t* title)
{
	self->set_link_title(self, cefstring_pwcs(title));
}

CEFAU3API void CefDragData_SetLinkMetadata(struct _cef_drag_data_t* self,
	const wchar_t* data)
{
	self->set_link_metadata(self, cefstring_pwcs(data));
}

CEFAU3API void CefDragData_SetFragmentText(struct _cef_drag_data_t* self,
	const wchar_t* text)
{
	self->set_fragment_text(self, cefstring_pwcs(text));
}

CEFAU3API void CefDragData_SetFragmentHtml(struct _cef_drag_data_t* self,
	const wchar_t* html)
{
	self->set_fragment_html(self, cefstring_pwcs(html));
}

CEFAU3API void CefDragData_SetFragmentBaseUrl(struct _cef_drag_data_t* self,
	const wchar_t* base_url)
{
	self->set_fragment_base_url(self, cefstring_pwcs(base_url));
}

CEFAU3API void CefDragData_ResetFileContents(struct _cef_drag_data_t* self)
{
	self->reset_file_contents(self);
}

CEFAU3API void CefDragData_AddFile(struct _cef_drag_data_t* self,
	const wchar_t* path,
	const wchar_t* display_name)
{
	self->add_file(self, cefstring_pwcs(path), cefstring_pwcs(display_name));
}

CEFAU3API struct _cef_image_t* CefDragData_GetImage(struct _cef_drag_data_t* self)
{
	return self->get_image(self);
}

CEFAU3API cef_point_t CefDragData_GetImageHotspot(struct _cef_drag_data_t* self)
{
	return self->get_image_hotspot(self);
}

CEFAU3API int CefDragData_HasImage(struct _cef_drag_data_t* self)
{
	return self->has_image(self);
}

CEFAU3API cef_drag_data_t* CefDragData_Create()
{
	return cef_drag_data_create();
}