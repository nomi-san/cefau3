#cs
	file: types/string.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefString
; ==================================================

global $tag_CefString = 'ptr str;uint len;ptr dior;'

func CefString_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__isCreated')
		.AddProperty('__type', 1, 'CefString')

		.AddMethod('val', 	'__CefString_val')
		.AddMethod('len', 	'__CefString_len')
		.AddMethod('clear', '__CefString_clear')
		.AddMethod('free', 	'__CefString_free')

		global const $__CefString = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefString_Init', 'idispatch', $__CefString)

endfunc

; ==================================================

func CefString_Create($ptr = null, $str = null)
	local $self = dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefString_Create', 'ptr', $ptr, 'wstr', $str)[0]
	if (not $ptr) then $self.__isCreated = 1
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