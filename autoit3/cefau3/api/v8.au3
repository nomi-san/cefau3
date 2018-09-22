#cs
	file: api/v8.au3
	author: wuuyi123
#ce

global $tag_CefV8Handler = ( _
	$tag_CefBase & _
	'ptr Execute;' _
)

global $__params_Execute = 'ptr;ptr;ptr;uint;ptr;ptr;ptr', _
	$__return_Execute = 'int'

func CefV8Handler_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefV8Handler_Create')
	return @error ? 0 : $ret[0]
endfunc

func CefV8Handler_Execute($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_Execute, $__params_Execute)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefV8Handler_Execute', 'ptr', $self, 'ptr', $ptr)
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