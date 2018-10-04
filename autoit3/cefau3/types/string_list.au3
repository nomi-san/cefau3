#cs
	file: types/string_list.au3
	author: wuuyi123
#ce

#include-once

; CefStringList
; ==================================================

global $tag_CefStringList = 'ptr;'

func CefStringList_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefStringList, 'CefStringList', $ptr)

	CefStruct_AddMethod($struct, 'Size', 	'__CefStringList_Size')
	CefStruct_AddMethod($struct, 'Read', 	'__CefStringList_Read')
	CefStruct_AddMethod($struct, 'Append', 	'__CefStringList_Append')
	CefStruct_AddMethod($struct, 'Clear', 	'__CefStringList_Clear')

	return $struct
endfunc

func __CefStringList_Size($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefStringList_Size', 'ptr', $self.__pointer__)
	return @error ? null : $ret[0]
endfunc

func __CefStringList_Read($self, $index = 0)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefStringList_Read', 'ptr', $self.__pointer__, 'uint', $index)
	return @error ? null : $ret[0]
endfunc

func __CefStringList_Append($self, $value = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Append', 'ptr', $self.__pointer__, 'wstr', $value)
endfunc

func __CefStringList_Clear($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefStringList_Clear', 'ptr', $self.__pointer__)
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