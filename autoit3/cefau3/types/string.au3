#cs
	file: types/string.au3
	author: wuuyi123
#ce

#include-once

; CefString
; ==================================================

global $tag_CefString = 'ptr str;uint len;ptr dior;'

func CefString_Create($ptr = null)
	local $self = CefObject_Create('CefString', $ptr)

	CefObject_AddMethod($self, 'val', '__CefString_val')
	CefObject_AddMethod($self, 'len', '__CefString_len')
	CefObject_AddMethod($self, 'clear', '__CefString_clear')

	return $self
endfunc

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