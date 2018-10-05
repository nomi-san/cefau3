#cs
	file: api/v8.au3
	author: wuuyi123
#ce

#include-once

; CefV8Context
; ==================================================

global $tag_CefV8Context = ( _
    $tag_CefBase 	& _
    'ptr[9];' 		_
)

func CefV8Context_Create($ptr = null)
    local $self = CefObject_Create('CefV8Context', $ptr)

    CefObject_AddMethod($self, 'GetTaskRunner',   '__CefV8Context_GetTaskRunner')
    CefObject_AddMethod($self, 'IsValid',         '__CefV8Context_IsValid')
    CefObject_AddMethod($self, 'GetBrowser',      '__CefV8Context_GetBrowser')
    CefObject_AddMethod($self, 'GetFrame',        '__CefV8Context_GetFrame')
    CefObject_AddMethod($self, 'GetGlobal',       '__CefV8Context_GetGlobal')
    CefObject_AddMethod($self, 'Enter',           '__CefV8Context_Enter')
    CefObject_AddMethod($self, 'Exit',            '__CefV8Context_Exit')
    CefObject_AddMethod($self, 'IsSame',          '__CefV8Context_IsSame')
    CefObject_AddMethod($self, 'Eval',            '__CefV8Context_Eval')

    ; static functions
    CefObject_AddMethod($self, 'GetCurrentContext',	'__CefV8Context_GetCurrentContext')
    CefObject_AddMethod($self, 'GetEnteredContext',	'__CefV8context_GetEnteredContext')
    CefObject_AddMethod($self, 'InContext',			'__CefV8context_InContext')

    return $self
endfunc

func __CefV8Context_GetTaskRunner($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetTaskRunner', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_IsValid($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Context_IsValid', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_GetBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetBrowser', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_GetFrame($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetFrame', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_GetGlobal($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetGlobal', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_Enter($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Context_Enter', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_Exit($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Context_Exit', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_IsSame($self, $that)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Context_IsSame', 'ptr', $self.__ptr, 'ptr', $that)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8Context_Eval($self, $code, $script_url, $start_line, $retval, $exception)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_Eval', _
        'ptr', $self.__ptr, _
        'wstr', $code, _
        'wstr', $script_url, _
        'int', $start_line, _
        'ptr', $retval, _
        'ptr', $exception _
    )
    return @error ? 0 : $ret[0]
endfunc

; static functions ------------------------------

func __CefV8Context_GetCurrentContext($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetCurrentContext')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8context_GetEnteredContext($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8context_GetEnteredContext')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8context_InContext($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8context_InContext')
	return @error ? 0 : $ret[0]
endfunc

; ----------

func CefV8Context_GetCurrentContext()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetCurrentContext')
	return @error ? 0 : $ret[0]
endfunc

func CefV8context_GetEnteredContext()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8context_GetEnteredContext')
	return @error ? 0 : $ret[0]
endfunc

func CefV8context_InContext()
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8context_InContext', 'ptr')
	return @error ? 0 : $ret[0]
endfunc

; CefV8Handler
; ==================================================

global $__CefV8Handler__E = Cef_CallbackRegister(__CefV8Handler__E, 'int', 'ptr;ptr;ptr;uint;ptr;ptr;ptr')

; ==================================================

func CefV8Handler_Create($ptr = null)
	local $self = CefObject_Create('CefV8Handler', $ptr)

	CefObject_AddMethod($self, 'Execute', '__CefV8Handler_E')

	return $self
endfunc

func __CefV8Handler_E($self, $func = null)
	if @numparams == 1 then return $self.__E

	$self.__E = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Handler_Execute', 'ptr', $self.__ptr, 'ptr', $__CefV8Handler__E)
endfunc

; ==================================================

func __CefV8Handler__E($self, $name, $object, $argumentsCount, $arguments, $retval, $exception)
	$self = CefV8Handler_Create($self)
	$name = CefString_Read($name)
	;$object = CefV8Value_Create($object)

	;$arguments
	;$retval
	;$exception

	return call($self.__E, $self, $name, $object, $argumentsCount, $arguments, $retval, $exception)
endfunc



;/////////////////////////////////
; ==================================================



; //////////////////////////////////////

func CefV8Value_IsValid($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsValid', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsUndefined($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUndefined', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsNull($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsNull', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsBool($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsBool', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsInt($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsInt', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsUInt($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUInt', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsDouble($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsDouble', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsDate($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsDate', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsString($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsString', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsObject($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsObject', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsArray($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsArray', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsFunction($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsFunction', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsSame($self, $that)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsSame', 'ptr', $self, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_GetBoolValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_GetBoolValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_GetIntValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_GetIntValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_GetUIntValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefV8Value_GetUIntValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_GetDoubleValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'CefV8Value_GetDoubleValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

#cs
func CefV8Value_GetDateValue($self)
	local $ret = dllcall($__Cefau3Dll__, '', 'CefV8Value_GetDateValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc
#ce

func CefV8Value_GetStringValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefV8Value_GetStringValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_IsUserCreated($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUserCreated', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateUndefined($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateUndefined')
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateNull($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateNull')
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateBool($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateBool', 'int', $value)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateInt($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateInt', 'int', $value)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateUInt($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateUInt', 'uint', $value)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateDouble($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateDouble', 'double', $value)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_CreateString($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateString', 'wstr', $value)
	return @error ? 0 : $ret[0]
endfunc

func CefV8Value_SetReturn($V8Value_retval, $V8Value_your_value)
	local $ret = dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Value_SetReturn', 'ptr', $V8Value_retval,'ptr', $V8Value_your_value)
endfunc

; //////////////////////////////////////////
; my addons

func CefV8ValueArg_ToStruct($V8Value_args, $count_arg)
	local $ret = dllstructcreate('ptr[' & $count_arg & ']', $V8Value_args)
	return @error ? null : $ret
endfunc

func CefV8ValueArg_Get($V8Value_Struct, $index)
	local $ret = dllstructgetdata($V8Value_Struct, 1, $index) ; count from 1, not like array
	return @error ? null : $ret
endfunc









; CefV8StackFrame
; ==================================================

func CefV8StackFrame_Create($ptr = null)
    local $self = CefObject_Create('CefV8StackFrame', $ptr)

    CefObject_AddMethod($self, 'IsValid',   		'__CefV8StackFrame_IsValid')
    CefObject_AddMethod($self, 'GetScriptName',   '__CefV8StackFrame_GetScriptName')
    CefObject_AddMethod($self, 'GetScriptNameOrSourceUrl',   '__CefV8StackFrame_GetScriptNameOrSourceUrl')
    CefObject_AddMethod($self, 'GetFunctionName', '__CefV8StackFrame_GetFunctionName')
    CefObject_AddMethod($self, 'GetLineNumber',   '__CefV8StackFrame_GetLineNumber')
    CefObject_AddMethod($self, 'GetColumn',   	'__CefV8StackFrame_GetColumn')
    CefObject_AddMethod($self, 'IsEval',   		'__CefV8StackFrame_IsEval')
    CefObject_AddMethod($self, 'IsConstructor',   '__CefV8StackFrame_IsConstructor')

    return $self
endfunc

func __CefV8StackFrame_IsValid($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8StackFrame_IsValid', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_GetScriptName($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefV8StackFrame_GetScriptName', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_GetScriptNameOrSourceUrl($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefV8StackFrame_GetScriptNameOrSourceUrl', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_GetFunctionName($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefV8StackFrame_GetFunctionName', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_GetLineNumber($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8StackFrame_GetLineNumber', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_GetColumn($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8StackFrame_GetColumn', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_IsEval($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8StackFrame_IsEval', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

func __CefV8StackFrame_IsConstructor($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8StackFrame_IsConstructor', 'ptr', $self.__ptr)
    return @error ? 0 : $ret[0]
endfunc

; static functions
; ==================================================

func __Cef_RegisterExtension($self, $extension_name = null, $javascript_code = null, $v8handler = null)
	if @numparams == 1 then return

	if (not $extension_name) then $extension_name = 'v8/app' ; default
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefRegisterExtension', _
		'wstr', $extension_name, _
		'wstr', $javascript_code, _
		'ptr', $v8handler _
	)
	return @error ? 0 : $ret[0]
endfunc

func Cef_RegisterExtension($extension_name, $javascript_code, $v8handler)
	if (not $extension_name) then $extension_name = 'v8/app' ; default
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefRegisterExtension', _
		'wstr', $extension_name, _
		'wstr', $javascript_code, _
		'ptr', $v8handler _
	)
	return @error ? 0 : $ret[0]
endfunc