#cs
	file: types/string.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefString
; ==================================================

global $tag_CefString = 'ptr str;uint len;ptr dior;'

global $__CefString = null

$__CefString = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefString, '__ptr')
_AutoItObject_AddProperty($__CefString, '__isCreated')
_AutoItObject_AddProperty($__CefString, '__type', 1, 'CefString')

_AutoItObject_AddMethod($__CefString, 'val', 	'__CefString_val')
_AutoItObject_AddMethod($__CefString, 'len', 	'__CefString_len')
_AutoItObject_AddMethod($__CefString, 'clear', 	'__CefString_clear')
_AutoItObject_AddMethod($__CefString, 'free', 	'__CefString_free')

; ==================================================

func CefString_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefString)
	if ($ptr == null) then 
		$ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefString_Create', 'wstr', '')[0]
		$self.__isCreated = 1
	endif
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefString_val($self, $val = null)
	if @numparams == 1 then 
		local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefString_Read', 'ptr', $self.__ptr)
		return @error ? 0 : $ret[0]
	endif

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Set', 'ptr', $self.__ptr, 'wstr', $val)
endfunc

func __CefString_len($self)
	if @numparams <> 1 then return
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefString_Len', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefString_clear($self)
	if @numparams <> 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Clear', 'ptr', $self.__ptr)
endfunc

func __CefString_free($self)
	if ($self.__isCreated) then _
		dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Free', 'ptr', $self.__ptr)
endfunc

; ==================================================
; ==================================================

func CefString_Create_($string)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefString_Create', 'wstr', $string)
	Return @error ? null : $ret[0]
endfunc

func CefString_Free($CefString)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Free', 'ptr', $CefString)
endfunc

func CefString_Read($CefString)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefString_Read', 'ptr', $CefString)
	Return @error ? 0 : $ret[0]
endfunc

func CefString_Len($CefString)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefString_Len', 'ptr', $CefString)
	Return @error ? 0 : $ret[0]
endfunc

func CefString_Clear($CefString)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Clear', 'ptr', $CefString)
endfunc

func CefString_Copy($CefString)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefString_Len', 'ptr', $CefString)
	Return @error ? null : $ret[0]
endfunc

;///////////////////