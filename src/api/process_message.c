#include "process_message.h"

/* CefProcessMessage
--------------------------------------------------*/

static Au3Obj* CefProcessMessage_obj;

EXPORT(void) CefProcessMessage_Init(Au3Obj *obj)
{
	CefProcessMessage_obj = obj;
}

EXPORT(Au3Obj*) CefProcessMessage_Create(CefProcessMessage *p, const wchar_t *name)
{
	if (!p)
		p = cef_process_message_create(cefstring_pwcs(name));

	AutoitSetPointerProxy(CefProcessMessage_obj, p);
	return Au3ObjClone(CefProcessMessage_obj);
}

EXPORT(int) CefProcessMessage_IsValid(struct _cef_process_message_t* self)
{
	return self->is_valid(self);
}

EXPORT(int) CefProcessMessage_IsReadOnly(struct _cef_process_message_t* self)
{
	return self->is_read_only(self);
}

EXPORT(Au3Obj*) CefProcessMessage_Copy(
	struct _cef_process_message_t* self)
{
	return CefProcessMessage_Create(
		self->copy(self),
		NULL
	);
}

EXPORT(const wchar_t*) CefProcessMessage_GetName(
	struct _cef_process_message_t* self)
{
	return self->get_name(self)->str;
}

EXPORT(struct _cef_list_value_t*) CefProcessMessage_GetArgumentList(
	struct _cef_process_message_t* self)
{
	return NULL;
	// to do
}
