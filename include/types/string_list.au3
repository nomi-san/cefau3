#cs
	file: types/string_list.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefStringList
; ==================================================

func CefStringList_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__isCreated')
		.AddProperty('__type', 1, 'CefStringList')

		.AddMethod('size', 		'__CefStringList_Size')
		.AddMethod('read', 		'__CefStringList_Read')
		.AddMethod('append', 	'__CefStringList_Append')
		.AddMethod('clear', 	'__CefStringList_Clear')

		global const $__CefStringList = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Init', 'idispatch', $__CefStringList)

endfunc

; ==================================================

func CefStringList_Create($ptr = null)
	local $self = dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefStringList_Create', 'ptr', $ptr)[0]
	if (not $ptr) then $self.__isCreated = 1
	return $self
endfunc

; ==================================================

func __CefStringList_size($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefStringList_Size', 'ptr', $self.__ptr)
	return @error ? null : $ret[0]
endfunc

func __CefStringList_read($self, $index = 0)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefStringList_Read', 'ptr', $self.__ptr, 'uint', $index)
	return @error ? null : $ret[0]
endfunc

func __CefStringList_append($self, $value = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Append', 'ptr', $self.__ptr, 'wstr', $value)
endfunc

func __CefStringList_clear($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Clear', 'ptr', $self.__ptr)
endfunc

func __CefStringList_free($self)
	if ($self.__isCreated) then _
		dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Free', 'ptr', $self.__ptr)
endfunc

;///////////////////////

func CefStringList_Create_()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefStringList_Create')
	return @error ? null : $ret[0]
endfunc

func CefStringList_Size($CefStringList)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefStringList_Size', 'ptr', $CefStringList)
	return @error ? null : $ret[0]
endfunc

func CefStringList_Read($CefStringList, $index = 0)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefStringList_Read', 'ptr', $CefStringList, 'uint', $index)
	return @error ? null : $ret[0]
endfunc

func CefStringList_Append($CefStringList, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Append', 'ptr', $CefStringList, 'wstr', $value)
endfunc

func CefStringList_Clear($CefStringList)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Clear', 'ptr', $CefStringList)
endfunc

func CefStringList_Free($CefStringList)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Free', 'ptr', $CefStringList)
endfunc

func CefStringList_Copy($CefStringList)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefStringList_Copy', 'ptr', $CefStringList)
	return @error ? null : $ret[0]
endfunc