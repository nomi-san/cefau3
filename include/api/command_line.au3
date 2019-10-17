#cs
	file: api/command_line.au3
	author: wuuyi123
#ce

; ==================================================
; // CefCommandLine
; ==================================================

with  _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefCommandLine')

	.AddMethod('IsValid', '__CefCommandLine_IsValid')
	.AddMethod('IsReadOnly', '__CefCommandLine_IsReadOnly')
	.AddMethod('Copy', '__CefCommandLine_Copy')
	;.AddMethod('InitFromArgv', '__CefCommandLine_InitFromArgv')
	.AddMethod('InitFromString', '__CefCommandLine_InitFromString')
	.AddMethod('Reset', '__CefCommandLine_Reset')
	.AddMethod('GetArgv', '__CefCommandLine_GetArgv')
	.AddMethod('GetCommandLineString', '__CefCommandLine_GetCommandLineString')
	.AddMethod('GetProgram', '__CefCommandLine_GetProgram')
	.AddMethod('SetProgram', '__CefCommandLine_SetProgram')
	.AddMethod('HasSwitches', '__CefCommandLine_HasSwitches')
	.AddMethod('HasSwitch', '__CefCommandLine_HasSwitch')
	.AddMethod('GetSwitchValue', '__CefCommandLine_GetSwitchValue')
	.AddMethod('GetSwitches', '__CefCommandLine_GetSwitches')
	.AddMethod('AppendSwitch', '__CefCommandLine_AppendSwitch')
	.AddMethod('AppendSwitchWithValue', '__CefCommandLine_AppendSwitchWithValue')
	.AddMethod('HasArguments', '__CefCommandLine_HasArguments')
	.AddMethod('GetArguments', '__CefCommandLine_GetArguments')
	.AddMethod('AppendArgument', '__CefCommandLine_AppendArgument')
	.AddMethod('PrependWrapper', '__CefCommandLine_PrependWrapper')

	global $__CefCommandLine = .Object

endwith

; ==================================================

func CefCommandLine_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefCommandLine)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefCommandLine_IsValid($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefCommandLine_IsValid', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_IsReadOnly($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefCommandLine_IsReadOnly', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_Copy($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_Copy', 'ptr', $self.__ptr)
	return @error ? 0 : CefCommandLine_Create($ret[0])
endfunc

#cs
func __CefCommandLine_InitFromArgv($self)
	dllcall($__Cefau3Dll__, ':cdecl', 'CefCommandLine_InitFromArgv', 'ptr', $self.__ptr)
endfunc
#ce

func __CefCommandLine_InitFromString($self, $command_line = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_InitFromString', 'ptr', $self.__ptr, 'wstr', $command_line)
endfunc

func __CefCommandLine_Reset($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_Reset', 'ptr', $self.__ptr)
endfunc

func __CefCommandLine_GetArgv($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_GetArgv', 'ptr', $self.__ptr)
	return @error ? 0 : CefStringList_Create($ret[0])
endfunc

func __CefCommandLine_GetCommandLineString($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefCommandLine_GetCommandLineString', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_GetProgram($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefCommandLine_GetProgram', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_SetProgram($self, $program = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_SetProgram', 'ptr', $self.__ptr, 'wstr', $program)
endfunc

func __CefCommandLine_HasSwitches($self, $name = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefCommandLine_HasSwitches', 'ptr', $self.__ptr, 'wstr', $name)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_HasSwitch($self)
	dllcall($__Cefau3Dll__, ':cdecl', 'CefCommandLine_HasSwitch', 'ptr', $self.__ptr)
endfunc

func __CefCommandLine_GetSwitchValue($self, $name = null)
	if @numparams == 1 then return
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefCommandLine_GetSwitchValue', 'ptr', $self.__ptr, 'wstr', $name)
	return @error ? 0 : $ret[0]
endfunc

#cs string_map
func __CefCommandLine_GetSwitches($self)
	dllcall($__Cefau3Dll__, ':cdecl', 'CefCommandLine_GetSwitches', 'ptr', $self.__ptr)
endfunc
#ce

func __CefCommandLine_AppendSwitch($self, $name = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_AppendSwitch', 'ptr', $self.__ptr, 'wstr', $name)
endfunc

func __CefCommandLine_AppendSwitchWithValue($self, $name = null, $value = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_AppendSwitchWithValue', 'ptr', $self.__ptr, 'wstr', $name, 'wstr', $value)
endfunc

func __CefCommandLine_HasArguments($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefCommandLine_HasArguments', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefCommandLine_GetArguments($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_GetArguments', 'ptr', $self.__ptr)
	return @error ? 0 : CefStringList_Create($ret[0])
endfunc

func __CefCommandLine_AppendArgument($self, $argument = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_AppendArgument', 'ptr', $self.__ptr, 'wstr', $argument)
endfunc

func __CefCommandLine_PrependWrapper($self, $wrapper = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCommandLine_PrependWrapper', 'ptr', $self.__ptr, 'wstr', $wrapper)
endfunc

; static funcs
; ==================================================

func CefCommandLine_Create__()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_Create')
	return @error ? 0 : $ret[0]
endfunc

func CefCommandLine_GetGlobal()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCommandLine_GetGlobal')
	return @error ? 0 : $ret[0]
endfunc