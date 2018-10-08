#cs
	file: api/command_line.au3
	author: wuuyi123
#ce

; CefCommandLine
; ==================================================

global $__CefCommandLine = null

; ==================================================

func CefCommandLine_Create($ptr = null)
	if $__CefCommandLine == null then
		$__CefCommandLine = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefCommandLine, '__ptr')
		_AutoItObject_AddProperty($__CefCommandLine, '__type', 1, 'CefCommandLine')
		
		_AutoItObject_AddMethod($__CefCommandLine, 'IsValid', '__CefCommandLine_IsValid')
		_AutoItObject_AddMethod($__CefCommandLine, 'IsReadOnly', '__CefCommandLine_IsReadOnly')
		_AutoItObject_AddMethod($__CefCommandLine, 'Copy', '__CefCommandLine_Copy')
		_AutoItObject_AddMethod($__CefCommandLine, 'InitFromArgv', '__CefCommandLine_InitFromArgv')
		_AutoItObject_AddMethod($__CefCommandLine, 'InitFromString', '__CefCommandLine_InitFromString')
		_AutoItObject_AddMethod($__CefCommandLine, 'Reset', '__CefCommandLine_Reset')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetArgv', '__CefCommandLine_GetArgv')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetCommandLineString', '__CefCommandLine_GetCommandLineString')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetProgram', '__CefCommandLine_GetProgram')
		_AutoItObject_AddMethod($__CefCommandLine, 'SetProgram', '__CefCommandLine_SetProgram')
		_AutoItObject_AddMethod($__CefCommandLine, 'HasSwitches', '__CefCommandLine_HasSwitches')
		_AutoItObject_AddMethod($__CefCommandLine, 'HasSwitch', '__CefCommandLine_HasSwitch')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetSwitchValue', '__CefCommandLine_GetSwitchValue')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetSwitches', '__CefCommandLine_GetSwitches')
		_AutoItObject_AddMethod($__CefCommandLine, 'AppendSwitch', '__CefCommandLine_AppendSwitch')
		_AutoItObject_AddMethod($__CefCommandLine, 'AppendSwitchWithValue', '__CefCommandLine_AppendSwitchWithValue')
		_AutoItObject_AddMethod($__CefCommandLine, 'HasArguments', '__CefCommandLine_HasArguments')
		_AutoItObject_AddMethod($__CefCommandLine, 'GetArguments', '__CefCommandLine_GetArguments')
		_AutoItObject_AddMethod($__CefCommandLine, 'AppendArgument', '__CefCommandLine_AppendArgument')
		_AutoItObject_AddMethod($__CefCommandLine, 'PrependWrapper', '__CefCommandLine_PrependWrapper')
	endif

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