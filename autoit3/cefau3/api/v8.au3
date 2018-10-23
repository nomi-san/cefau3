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
	#forceref $self
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Context_GetCurrentContext')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8context_GetEnteredContext($self)
	#forceref $self
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8context_GetEnteredContext')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8context_InContext($self)
	#forceref $self
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

; ==================================================
; // CefV8Handler
; ==================================================

global $__CefV8Handler = null

$__CefV8Handler = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefV8Handler, '__ptr')
_AutoItObject_AddProperty($__CefV8Handler, '__type', 1, 'CefV8Handler')

_AutoItObject_AddMethod($__CefV8Handler, 'Execute', '__CefV8Handler_E')

global const $__CefV8Handler__E = Cef_CallbackRegister(__CefV8Handler__E, 'int', 'ptr;ptr;ptr;uint;ptr;ptr;ptr')

; ==================================================

func CefV8Handler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefV8Handler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Handler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefV8Handler_E($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefV8Handler_Get_E', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Handler_Set_E', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Handler_E', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefV8Handler__E : null)
endfunc

; ==================================================

volatile func __CefV8Handler__E($self, $n, $o, $c, $a, $r, $e)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefV8Handler_Get_E', 'ptr', $self)[0]
	$n = CefString_Create($n)
	;$object = CefV8Value_Create($object)
	;$c = int($c)

	local $args[1] = [$c] ; index 0: counter

	if ($c > 0) then

		redim $args[$c+1] ; length = max arg + 1

		; stack *->[n]
		local $st = dllstructcreate('ptr[' & $c & ']', $a)

		for $i=1 to $c
			; [p1], [p2]...
			$args[$i] = CefV8Value_Create(dllstructgetdata($st, 1, $i))
		next

		; it's not array, couldn't use: [*][p<1>|p<2>|...|p<N>]
		; => *p<N> = *p<N-1> + sizeof(ptr);

	endif

	;$retval
	;$exception

	return call($self, $n, $o, $args, $r, $e)
endfunc

; ==================================================
; // CefV8Value
; ==================================================

global $__CefV8Value = null

$__CefV8Value = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefV8Value, '__ptr')
_AutoItObject_AddProperty($__CefV8Value, '__type', 1, 'CefV8Value')

_AutoItObject_AddMethod($__CefV8Value, 'IsValid', '__CefV8Value_IsValid')
_AutoItObject_AddMethod($__CefV8Value, 'IsUndefined', '__CefV8Value_IsUndefined')
_AutoItObject_AddMethod($__CefV8Value, 'IsNull', '__CefV8Value_IsNull')
_AutoItObject_AddMethod($__CefV8Value, 'IsBool', '__CefV8Value_IsBool')
_AutoItObject_AddMethod($__CefV8Value, 'IsInt', '__CefV8Value_IsInt')
_AutoItObject_AddMethod($__CefV8Value, 'IsUInt', '__CefV8Value_IsUInt')
_AutoItObject_AddMethod($__CefV8Value, 'IsDouble', '__CefV8Value_IsDouble')
_AutoItObject_AddMethod($__CefV8Value, 'IsDate', '__CefV8Value_IsDate')
_AutoItObject_AddMethod($__CefV8Value, 'IsString', '__CefV8Value_IsString')
_AutoItObject_AddMethod($__CefV8Value, 'IsObject', '__CefV8Value_IsObject')
_AutoItObject_AddMethod($__CefV8Value, 'IsArray', '__CefV8Value_IsArray')
_AutoItObject_AddMethod($__CefV8Value, 'IsFunction', '__CefV8Value_IsFunction')
_AutoItObject_AddMethod($__CefV8Value, 'IsSame', '__CefV8Value_IsSame')
_AutoItObject_AddMethod($__CefV8Value, 'GetBoolValue', '__CefV8Value_GetBoolValue')
_AutoItObject_AddMethod($__CefV8Value, 'GetIntValue', '__CefV8Value_GetIntValue')
_AutoItObject_AddMethod($__CefV8Value, 'GetUIntValue', '__CefV8Value_GetUIntValue')
_AutoItObject_AddMethod($__CefV8Value, 'GetDoubleValue', '__CefV8Value_GetDoubleValue')
_AutoItObject_AddMethod($__CefV8Value, 'GetStringValue', '__CefV8Value_GetStringValue')
_AutoItObject_AddMethod($__CefV8Value, 'IsUserCreated', '__CefV8Value_IsUserCreated')
_AutoItObject_AddMethod($__CefV8Value, 'CreateUndefined', '__CefV8Value_CreateUndefined')
_AutoItObject_AddMethod($__CefV8Value, 'CreateNull', '__CefV8Value_CreateNull')
_AutoItObject_AddMethod($__CefV8Value, 'CreateBool', '__CefV8Value_CreateBool')
_AutoItObject_AddMethod($__CefV8Value, 'CreateInt', '__CefV8Value_CreateInt')
_AutoItObject_AddMethod($__CefV8Value, 'CreateUInt', '__CefV8Value_CreateUInt')
_AutoItObject_AddMethod($__CefV8Value, 'CreateDouble', '__CefV8Value_CreateDouble')
_AutoItObject_AddMethod($__CefV8Value, 'CreateString', '__CefV8Value_CreateString')

; ==================================================

func CefV8Value_Create($ptr)
	local $self = _AutoItObject_Create($__CefV8Value)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefV8Value_IsValid($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsValid', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsUndefined($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUndefined', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsNull($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsNull', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsBool($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsBool', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsInt($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsInt', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsUInt($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUInt', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsDouble($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsDouble', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsDate($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsDate', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsString($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsString', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsObject($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsObject', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsArray($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsArray', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsFunction($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsFunction', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsSame($self, $that)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsSame', 'ptr', $self.__ptr, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_GetBoolValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_GetBoolValue', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_GetIntValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_GetIntValue', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_GetUIntValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefV8Value_GetUIntValue', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_GetDoubleValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'CefV8Value_GetDoubleValue', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

#cs
func CefV8Value_GetDateValue($self)
	local $ret = dllcall($__Cefau3Dll__, '', 'CefV8Value_GetDateValue', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc
#ce

func __CefV8Value_GetStringValue($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefV8Value_GetStringValue', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_IsUserCreated($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefV8Value_IsUserCreated', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateUndefined()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateUndefined')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateNull()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateNull')
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateBool($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateBool', 'int', $value)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateInt($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateInt', 'int', $value)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateUInt($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateUInt', 'uint', $value)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateDouble($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateDouble', 'double', $value)
	return @error ? 0 : $ret[0]
endfunc

func __CefV8Value_CreateString($value)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Value_CreateString', 'wstr', $value)
	return @error ? 0 : $ret[0]
endfunc

; // custom

func __CefV8Value_SetReturn($V8Value_retval, $V8Value_your_value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Value_SetReturn', 'ptr', $V8Value_retval,'ptr', $V8Value_your_value)
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
	#forceref $self
	if @numparams == 1 then return

	if (not $extension_name) then $extension_name = 'v8/app' ; default
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefRegisterExtension', _
		'wstr', $extension_name, _
		'wstr', $javascript_code, _
		'ptr', $v8handler _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefRegisterExtension($extension_name, $javascript_code, $v8handler)
	if (not $extension_name) then $extension_name = 'v8/app' ; default
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefRegisterExtension', _
		'wstr', $extension_name, _
		'wstr', $javascript_code, _
		'ptr', $v8handler _
	)
	return @error ? 0 : $ret[0]
endfunc