#include "../cefau3.h"

#include "include/capi/cef_command_line_capi.h"

/* CefCommandLine
--------------------------------------------------*/

CEFAU3API int CefCommandLine_IsValid(struct _cef_command_line_t* self) {
	return self->is_valid(self);
}

CEFAU3API int CefCommandLine_IsReadOnly(struct _cef_command_line_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API struct _cef_command_line_t* CefCommandLine_Copy(
	struct _cef_command_line_t* self)
{
	return self->copy(self);
}

CEFAU3API void CefCommandLine_InitFromArgv(struct _cef_command_line_t* self,
	int argc,
	const char* const* argv)
{
	self->init_from_argv(self, argc, argv);
}

CEFAU3API void CefCommandLine_InitFromString(struct _cef_command_line_t* self,
	const wchar_t* command_line)
{
	self->init_from_string(self, cefstring_pwcs(command_line));
}

CEFAU3API void CefCommandLine_Reset(struct _cef_command_line_t* self)
{
	self->reset(self);
}

CEFAU3API void CefCommandLine_GetArgv(struct _cef_command_line_t* self,
	cef_string_list_t argv)
{
	self->get_argv(self, argv);
}

CEFAU3API const wchar_t * CefCommandLine_GetCommandLineString(
	struct _cef_command_line_t* self)
{
	return self->get_command_line_string(self)->str;
}

CEFAU3API const wchar_t * CefCommandLine_GetProgram(
	struct _cef_command_line_t* self)
{
	return self->get_program(self)->str;
}

CEFAU3API void CefCommandLine_SetProgram(struct _cef_command_line_t* self,
	const wchar_t* program)
{
	self->set_program(self, cefstring_pwcs(program));
}

CEFAU3API int CefCommandLine_HasSwitches(struct _cef_command_line_t* self)
{
	return self->has_switches(self);
}

CEFAU3API int CefCommandLine_HasSwitch(struct _cef_command_line_t* self,
	const wchar_t* name)
{
	return self->has_switch(self, cefstring_pwcs(name));
}

CEFAU3API cef_string_userfree_t CefCommandLine_GetSwitchValue(
	struct _cef_command_line_t* self,
	const wchar_t* name)
{
	return self->get_switch_value(self, cefstring_pwcs(name));
}

CEFAU3API void CefCommandLine_GetSwitches(struct _cef_command_line_t* self,
	cef_string_map_t switches)
{
	self->get_switches(self, switches);
}

CEFAU3API void CefCommandLine_AppendSwitch(struct _cef_command_line_t* self,
	const wchar_t* name)
{
	self->append_switch(self, cefstring_pwcs(name));
}

CEFAU3API void CefCommandLine_AppendSwitchWithValue(struct _cef_command_line_t* self,
	const wchar_t* name,
	const wchar_t* value)
{
	self->append_switch_with_value(self, cefstring_pwcs(name), cefstring_pwcs(value));
}

CEFAU3API int CefCommandLine_HasArguments(struct _cef_command_line_t* self)
{
	return self->has_arguments(self);
}

CEFAU3API void CefCommandLine_GetArguments(struct _cef_command_line_t* self,
	cef_string_list_t arguments)
{
	self->get_arguments(self, arguments);
}

CEFAU3API void CefCommandLine_AppendArgument(struct _cef_command_line_t* self,
	const wchar_t* argument)
{
	self->append_argument(self, cefstring_pwcs(argument));
}

CEFAU3API void CefCommandLine_PrependWrapper(struct _cef_command_line_t* self,
	const wchar_t* wrapper)
{
	self->prepend_wrapper(self, cefstring_pwcs(wrapper));
}

/////////////////////////////////////////////////////

CEFAU3API cef_command_line_t* CefCommandLine_Create()
{
	return cef_command_line_create();
}

CEFAU3API cef_command_line_t* CefCommandLine_GetGlobal()
{
	return cef_command_line_get_global();
}