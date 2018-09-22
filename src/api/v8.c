#include "../cefau3.h"

#include "include/capi/cef_v8_capi.h"

/* CefV8Context
--------------------------------------------------*/

CEFAU3API cef_task_runner_t* CefV8Context_GetTaskRunner(
	struct _cef_v8context_t* self)
{
	return self->get_task_runner(self);
}

CEFAU3API int CefV8Context_IsValid(struct _cef_v8context_t* self)
{
	return self->is_valid(self);
}

CEFAU3API cef_browser_t* CefV8Context_get_browser(
	struct _cef_v8context_t* self)
{
	return self->get_browser(self);
}

CEFAU3API cef_frame_t* CefV8Context_get_frame(struct _cef_v8context_t* self)
{
	return self->get_frame(self);
}

CEFAU3API cef_v8value_t* CefV8Context_get_global(
	struct _cef_v8context_t* self)
{
	return self->get_global(self);
}

CEFAU3API int CefV8Context_enter(struct _cef_v8context_t* self)
{
	return self->enter(self);
}

CEFAU3API int CefV8Context_exit(struct _cef_v8context_t* self)
{
	return self->exit(self);
}

CEFAU3API int CefV8Context_is_same(struct _cef_v8context_t* self,
	struct _cef_v8context_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefV8Context_eval(struct _cef_v8context_t* self,
	const wchar_t* code,
	const wchar_t* script_url,
	int start_line,
	struct _cef_v8value_t** retval,
	struct _cef_v8exception_t** exception)
{
	return self->eval(
		self,
		cefstring_pwcs(code),
		cefstring_pwcs(script_url),
		start_line,
		retval,
		exception
	);
}

////////////////////////////////////////////////////////////////////////

CEFAU3API cef_v8context_t* CefV8ContextGetCurrentContext()
{
	return cef_v8context_get_current_context();
}

CEFAU3API cef_v8context_t* CefV8contextGetEnteredContext()
{
	return cef_v8context_get_entered_context();
}

CEFAU3API int CefV8contextInContext()
{
	return cef_v8context_in_context();
}

/* CefV8Handler
--------------------------------------------------*/

CEFAU3API cef_v8handler_t * CefV8Handler_Create()
{
	size_t sz = sizeof(cef_v8handler_t);
	cef_v8handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefV8Handler_Execute(cef_v8handler_t *self, void *ptr)
{
	self->execute = ptr;
}

/* CefV8Accessor
--------------------------------------------------*/

CEFAU3API int CefV8Accessor_Get(struct _cef_v8accessor_t* self,
	const wchar_t* name,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t** retval,
	wchar_t* exception)
{
	return self->get(
		self,
		cefstring_pwcs(name),
		object,
		retval,
		cefstring_pwcs(exception)
	);
}

CEFAU3API int CefV8Accessor_Set(struct _cef_v8accessor_t* self,
	const wchar_t* name,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t* value,
	wchar_t* exception)
{
	return self->set(
		self,
		cefstring_pwcs(name),
		object,
		value,
		cefstring_pwcs(exception)
	);
}

/* CefV8Interceptor
--------------------------------------------------*/

CEFAU3API int CefV8Interceptor_GetByName(struct _cef_v8interceptor_t* self,
	const wchar_t* name,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t** retval,
	wchar_t* exception)
{
	return self->get_byname(
		self,
		cefstring_pwcs(name),
		object,
		retval,
		cefstring_pwcs(exception)
	);
}

CEFAU3API int CefV8Interceptor_GetByindex(struct _cef_v8interceptor_t* self,
	int index,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t** retval,
	wchar_t* exception)
{
	return self->get_byindex(
		self,
		index,
		object,
		retval,
		cefstring_pwcs(exception)
	);
}

CEFAU3API int CefV8Interceptor_SetByname(struct _cef_v8interceptor_t* self,
	const wchar_t* name,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t* value,
	wchar_t* exception)
{
	return self->set_byname(
		self,
		cefstring_pwcs(name),
		object,
		value,
		cefstring_pwcs(exception)
	);
}

CEFAU3API int CefV8Interceptor_SetByIndex(struct _cef_v8interceptor_t* self,
	int index,
	struct _cef_v8value_t* object,
	struct _cef_v8value_t* value,
	wchar_t* exception)
{
	return self->set_byindex(
		self,
		index,
		object,
		value,
		cefstring_pwcs(exception)
	);
}

/* CefV8Exception
--------------------------------------------------*/

CEFAU3API const wchar_t* CefV8Exception_GetMessage(
	struct _cef_v8exception_t* self)
{
	return self->get_message(self)->str;
}

CEFAU3API const wchar_t*  CefV8Exception_GetSourceLine(
	struct _cef_v8exception_t* self)
{
	return self->get_source_line(self)->str;
}

CEFAU3API const wchar_t*  CefV8Exception_GetScriptResourceName(
	struct _cef_v8exception_t* self)
{
	return self->get_script_resource_name(self)->str;
}

CEFAU3API int CefV8Exception_GetLineNumber(struct _cef_v8exception_t* self)
{
	return self->get_line_number(self);
}

CEFAU3API int CefV8Exception_GetStartPosition(struct _cef_v8exception_t* self)
{
	return self->get_start_position(self);
}

CEFAU3API int CefV8Exception_GetEndPosition(struct _cef_v8exception_t* self)
{
	return self->get_end_position(self);
}

CEFAU3API int CefV8Exception_GetStartColumn(struct _cef_v8exception_t* self)
{
	return self->get_start_column(self);
}

CEFAU3API int CefV8Exception_GetEndColumn(struct _cef_v8exception_t* self)
{
	return self->get_end_column(self);
}

/* CefV8Value
--------------------------------------------------*/

CEFAU3API int CefV8Value_IsValid(struct _cef_v8value_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefV8Value_IsUndefined(struct _cef_v8value_t* self)
{
	return self->is_undefined(self);
}

CEFAU3API int CefV8Value_IsNull(struct _cef_v8value_t* self)
{
	return self->is_null(self);
}

CEFAU3API int CefV8Value_IsBool(struct _cef_v8value_t* self)
{
	return self->is_bool(self);
}

CEFAU3API int CefV8Value_IsInt(struct _cef_v8value_t* self)
{
	return self->is_int(self);
}

CEFAU3API int CefV8Value_IsUInt(struct _cef_v8value_t* self)
{
	return self->is_uint(self);
}

CEFAU3API int CefV8Value_IsDouble(struct _cef_v8value_t* self)
{
	return self->is_double(self);
}

CEFAU3API int CefV8Value_IsDate(struct _cef_v8value_t* self)
{
	return self->is_date(self);
}

CEFAU3API int CefV8Value_IsString(struct _cef_v8value_t* self)
{
	return self->is_string(self);
}

CEFAU3API int CefV8Value_IsObject(struct _cef_v8value_t* self)
{
	return self->is_object(self);
}

CEFAU3API int CefV8Value_IsArray(struct _cef_v8value_t* self)
{
	return self->is_array(self);
}

CEFAU3API int CefV8Value_IsFunction(struct _cef_v8value_t* self)
{
	return self->is_function(self);
}

CEFAU3API int CefV8Value_IsSame(struct _cef_v8value_t* self,
	struct _cef_v8value_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefV8Value_GetBoolValue(struct _cef_v8value_t* self)
{
	return self->get_bool_value(self);
}

CEFAU3API int32 CefV8Value_GetIntValue(struct _cef_v8value_t* self)
{
	return self->get_int_value(self);
}

CEFAU3API uint32 CefV8Value_GetUIntValue(struct _cef_v8value_t* self)
{
	return self->get_uint_value(self);
}

CEFAU3API double CefV8Value_GetDoubleValue(struct _cef_v8value_t* self)
{
	return self->get_double_value(self);
}

CEFAU3API cef_time_t CefV8Value_GetDateValue(struct _cef_v8value_t* self)
{
	return self->get_date_value(self);
}

CEFAU3API const wchar_t * CefV8Value_GetStringValue(
	struct _cef_v8value_t* self)
{
	return self->get_string_value(self)->str;
}

CEFAU3API int CefV8Value_IsUserCreated(struct _cef_v8value_t* self)
{
	return self->is_user_created(self);
}

CEFAU3API int CefV8Value_HasException(struct _cef_v8value_t* self)
{
	return self->has_exception(self);
}

CEFAU3API struct _cef_v8exception_t* CefV8Value_GetException(
	struct _cef_v8value_t* self)
{
	return self->get_exception(self);
}

CEFAU3API int CefV8Value_ClearException(struct _cef_v8value_t* self)
{
	return self->clear_exception(self);
}

CEFAU3API int CefV8Value_WillRethrowExceptions(struct _cef_v8value_t* self)
{
	return self->will_rethrow_exceptions(self);
}

CEFAU3API int CefV8Value_SetRethrowExceptions(struct _cef_v8value_t* self,
	int rethrow)
{
	return self->set_rethrow_exceptions(self, rethrow);
}

CEFAU3API int CefV8Value_HasValueBykey(struct _cef_v8value_t* self,
	const wchar_t* key)
{
	return self->has_value_bykey(self, cefstring_pwcs(key));
}

CEFAU3API int CefV8Value_HasValueByIndex(struct _cef_v8value_t* self, int index)
{
	return self->has_value_byindex(self, index);
}

CEFAU3API int CefV8Value_DeleteValueByKey(struct _cef_v8value_t* self,
	const wchar_t* key)
{
	return self->delete_value_bykey(self, cefstring_pwcs(key));
}

CEFAU3API int CefV8Value_DeleteValueByIndex(struct _cef_v8value_t* self,
	int index)
{
	return self->delete_value_byindex(self, index);
}

CEFAU3API cef_v8value_t* CefV8Value_GetValueByKey(
	struct _cef_v8value_t* self,
	const wchar_t* key)
{
	return self->get_value_bykey(self, cefstring_pwcs(key));
}

CEFAU3API cef_v8value_t* CefV8Value_GetValueByIndex(struct _cef_v8value_t* self, int index)
{
	return self->get_value_byindex(self, index);
}

CEFAU3API int CefV8Value_SetValueByKey(struct _cef_v8value_t* self,
	const wchar_t* key,
	struct _cef_v8value_t* value,
	cef_v8_propertyattribute_t attribute)
{
	return self->set_value_bykey(
		self,
		cefstring_pwcs(key),
		value,
		attribute
	);
}

CEFAU3API int CefV8Value_SetValueByIndex(struct _cef_v8value_t* self,
	int index,
	struct _cef_v8value_t* value)
{
	return self->set_value_byindex(self, index, value);
}

CEFAU3API int CefV8Value_SetValueByAccessor(struct _cef_v8value_t* self,
	const wchar_t* key,
	cef_v8_accesscontrol_t settings,
	cef_v8_propertyattribute_t attribute)
{
	return self->set_value_byaccessor(
		self,
		cefstring_pwcs(key),
		settings,
		attribute
	);
}

CEFAU3API int CefV8Value_GetKeys(struct _cef_v8value_t* self,
	cef_string_list_t keys)
{
	return self->get_keys(self, keys);
}

CEFAU3API int CefV8Value_SetUserData(struct _cef_v8value_t* self,
	struct _cef_base_ref_counted_t* user_data)
{
	return self->set_user_data(self, user_data);
}

CEFAU3API cef_base_ref_counted_t* CefV8Value_GetUserData(
	struct _cef_v8value_t* self)
{
	return self->get_user_data(self);
}

CEFAU3API int CefV8Value_GetExternallyAllocatedMemory(
	struct _cef_v8value_t* self)
{
	return self->get_externally_allocated_memory(self);
}

CEFAU3API int CefV8Value_AdjustExternallyAllocatedMemory(
	struct _cef_v8value_t* self,
	int change_in_bytes)
{
	return self->adjust_externally_allocated_memory(self, change_in_bytes);
}


CEFAU3API int CefV8Value_GetArrayLength(struct _cef_v8value_t* self)
{
	return self->get_array_length(self);
}


CEFAU3API cef_string_userfree_t CefV8Value_GetFunctionName(
	struct _cef_v8value_t* self)
{
	return self->get_function_name(self);
}

CEFAU3API cef_v8handler_t* CefV8Value_GetFunctionHandler(
	struct _cef_v8value_t* self)
{
	return self->get_function_handler(self);
}

CEFAU3API cef_v8value_t* CefV8Value_ExecuteFunction(
	struct _cef_v8value_t* self,
	struct _cef_v8value_t* object,
	size_t argumentsCount,
	struct _cef_v8value_t* const* arguments)
{
	return self->execute_function(
		self,
		object,
		argumentsCount,
		arguments
	);
}

CEFAU3API cef_v8value_t* CefV8Value_ExecuteFunctionWithContext(
	struct _cef_v8value_t* self,
	struct _cef_v8context_t* context,
	struct _cef_v8value_t* object,
	size_t argumentsCount,
	struct _cef_v8value_t* const* arguments)
{
	return self->execute_function_with_context(
		self,
		context,
		object,
		argumentsCount,
		arguments
	);
}

////////////////////////////////////////

CEFAU3API cef_v8value_t * CefV8Value_CreateUndefined()
{
	return cef_v8value_create_undefined();
}

CEFAU3API cef_v8value_t * CefV8Value_CreateNull()
{
	return cef_v8value_create_null();
}

CEFAU3API cef_v8value_t * CefV8Value_CreateBool(int value)
{
	return cef_v8value_create_bool(value);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateInt(int32 value)
{
	return cef_v8value_create_int(value);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateUInt(uint32 value)
{
	return cef_v8value_create_uint(value);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateDouble(double value)
{
	return cef_v8value_create_double(value);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateDate(const cef_time_t* date)
{
	return cef_v8value_create_date(date);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateString(const wchar_t* value)
{
	return cef_v8value_create_string(cefstring_pwcs(value));
}

CEFAU3API cef_v8value_t * CefV8Value_CreateObject(
	cef_v8accessor_t* accessor,
	cef_v8interceptor_t* interceptor)
{
	return cef_v8value_create_object(
		accessor,
		interceptor
	);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateArray(int length)
{
	return cef_v8value_create_array(length);
}

CEFAU3API cef_v8value_t * CefV8Value_CreateFunction(const wchar_t* name,
	cef_v8handler_t* handler)
{
	return cef_v8value_create_function(
		cefstring_pwcs(name),
		handler
	);
}

////////////////////

CEFAU3API void CefV8Value_SetReturn(struct _cef_v8value_t** retval, cef_v8value_t* value)
{
	*retval = value;
}

/* CefV8StackTrace
--------------------------------------------------*/

CEFAU3API int CefV8StackTrace_IsValid(struct _cef_v8stack_trace_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefV8StackTrace_GetFrameCount(struct _cef_v8stack_trace_t* self)
{
	return self->get_frame_count(self);
}

CEFAU3API struct _cef_v8stack_frame_t *	 	CefV8StackTrace_GetFrame(struct _cef_v8stack_trace_t* self, int index)
{
	return self->get_frame(self, index);
}

/* CefV8StackFrame
--------------------------------------------------*/

CEFAU3API int CefV8StackFrame_IsValid(struct _cef_v8stack_frame_t* self)
{
	return self->is_valid(self);
}

CEFAU3API const wchar_t * CefV8StackFrame_GetScriptName(
	struct _cef_v8stack_frame_t* self)
{
	return self->get_script_name(self)->str;
}

CEFAU3API const wchar_t * CefV8StackFrame_GetScriptNameOrSourceUrl(
	struct _cef_v8stack_frame_t* self)
{
	cefstring_retfree( self->get_script_name_or_source_url(self));
}

CEFAU3API const wchar_t * CefV8StackFrame_GetFunctionName(
	struct _cef_v8stack_frame_t* self)
{
	return self->get_function_name(self)->str;
}

CEFAU3API int CefV8StackFrame_GetLineNumber(struct _cef_v8stack_frame_t* self)
{
	return self->get_line_number(self);
}

CEFAU3API int CefV8StackFrame_GetColumn(struct _cef_v8stack_frame_t* self)
{
	return self->get_column(self);
}

CEFAU3API int CefV8StackFrame_IsEval(struct _cef_v8stack_frame_t* self)
{
	return self->is_eval(self);
}

CEFAU3API int CefV8StackFrame_IsConstructor(struct _cef_v8stack_frame_t* self)
{
	return self->is_eval(self);
}

/////////////////////////////////////////////////////////////

CEFAU3API int CefRegisterExtension(
	const wchar_t* extension_name,
	const wchar_t* javascript_code,
	cef_v8handler_t* handler)
{
	cef_string_t s1 = { 0 };
	cef_string_t s2 = { 0 };

	cef_string_from_wide(extension_name, wcslen(extension_name), &s1);
	cef_string_from_wide(javascript_code, wcslen(javascript_code), &s2);

	return cef_register_extension(
		&s1,
		&s2,
		handler
	);
}
