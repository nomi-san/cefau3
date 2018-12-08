#include "frame.h"

/* CefFrame
--------------------------------------------------*/

Au3Obj* CefFrame_obj;

EXPORT(void) CefFrame_Init(Au3Obj* obj)
{
	CefFrame_obj = obj;
}

EXPORT(Au3Obj*) CefFrame_Create(CefFrame* p)
{
	AutoitSetPointerProxy(CefFrame_obj, p);
	return Au3ObjClone(CefFrame_obj);
}

//--------------------------------------------------

EXPORT(int) CefFrame_IsValid(struct _cef_frame_t* self)
{
	return self->is_valid(self);
}

EXPORT(void) CefFrame_Undo(struct _cef_frame_t* self)
{
	self->undo(self);
}

EXPORT(void) CefFrame_Redo(struct _cef_frame_t* self)
{
	self->redo(self);
}

EXPORT(void) CefFrame_Cut(struct _cef_frame_t* self)
{
	self->cut(self);
}

EXPORT(void) CefFrame_Copy(struct _cef_frame_t* self)
{
	self->copy(self);
}

EXPORT(void) CefFrame_Paste(struct _cef_frame_t* self)
{
	self->paste(self);
}

EXPORT(void) CefFrame_Delete(struct _cef_frame_t* self)
{
	self->del(self);
}

EXPORT(void) CefFrame_SelectAll(struct _cef_frame_t* self)
{
	self->select_all(self);
}

EXPORT(void) CefFrame_ViewSource(struct _cef_frame_t* self)
{
	self->view_source(self);
}

EXPORT(void) CefFrame_GetSource(struct _cef_frame_t* self,
	struct _cef_string_visitor_t* visitor)
{
	self->get_source(self, visitor);
}

EXPORT(void) CefFrame_GetText(struct _cef_frame_t* self,
	struct _cef_string_visitor_t* visitor)
{
	self->get_text(self, visitor);
}

EXPORT(void) CefFrame_LoadRequest(struct _cef_frame_t* self,
	struct _cef_request_t* request)
{
	self->load_request(self, request);
}

EXPORT(void) CefFrame_LoadUrl(struct _cef_frame_t* self,
	const wchar_t* url)
{
	self->load_url(self, cefstring_pwcs(url));
}

EXPORT(void) CefFrame_LoadString(struct _cef_frame_t* self,
	const wchar_t* string_val,
	const wchar_t* url)
{
	self->load_string(
		self,
		cefstring_pwcs(string_val),
		cefstring_pwcs(url)
	);
}

EXPORT(void) CefFrame_ExecuteJavaScript(struct _cef_frame_t* self,
	const wchar_t* code,
	const wchar_t* script_url,
	int start_line)
{
	self->execute_java_script(
		self,
		cefstring_pwcs(code),
		cefstring_pwcs(script_url),
		start_line
	);
}

EXPORT(int) CefFrame_IsMain(struct _cef_frame_t* self)
{
	return self->is_main(self);
}

EXPORT(int) CefFrame_IsFocused(struct _cef_frame_t* self)
{
	return self->is_focused(self);
}

EXPORT(const wchar_t *) CefFrame_GetName(struct _cef_frame_t* self)
{
	return self->get_name(self)->str;
}

EXPORT(int64) CefFrame_GetIdentifier(struct _cef_frame_t* self)
{
	return self->get_identifier(self);
}

EXPORT(struct _cef_frame_t*) CefFrame_GetParent(struct _cef_frame_t* self)
{
	return self->get_parent(self);
}

EXPORT(const wchar_t*) CefFrame_GetUrl(struct _cef_frame_t* self)
{
	return self->get_url(self)->str;
}

EXPORT(struct _cef_browser_t*) CefFrame_GetBrowser(struct _cef_frame_t* self)
{
	return self->get_browser(self);
}

EXPORT(struct _cef_v8context_t*) CefFrame_GetV8Context(struct _cef_frame_t* self)
{
	return self->get_v8context(self);
}

EXPORT(void) CefFrame_VisitDOM(struct _cef_frame_t* self, struct _cef_domvisitor_t* visitor)
{
	self->visit_dom(self, visitor);
}