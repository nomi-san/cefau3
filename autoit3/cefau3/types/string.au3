#cs
	file: types/string.au3
	author: wuuyi123
#ce

Global $tag_CefString = 'ptr str;int len;ptr dior;'

func CefString_Create($string)
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

func CefStringList_Create()
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







