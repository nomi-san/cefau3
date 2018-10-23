#cs
	file: api/types_win.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefMainArgs
; ==================================================

global $__CefMainArgs = null

$__CefMainArgs = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefMainArgs, '__ptr')
_AutoItObject_AddProperty($__CefMainArgs, '__type', 1, 'CefMainArgs')

_AutoItObject_AddMethod($__CefMainArgs, 'instance', '__CefMainArgs_instance')

; ==================================================

func CefMainArgs_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefMainArgs)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefMainArgs_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefMainArgs_instance($self, $value = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefMainArgs_Get_instance', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefMainArgs_Set_instance', 'ptr', $self.__ptr, 'ptr', $value)
endfunc

; CefWindowInfo
; ==================================================

global $__CefCefWindowInfo = null

$__CefCefWindowInfo = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefCefWindowInfo, '__ptr')
_AutoItObject_AddProperty($__CefCefWindowInfo, '__type', 1, 'CefWindowInfo')

_AutoItObject_AddMethod($__CefCefWindowInfo, 'window_name', '__CefWindowInfo_wn')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'ex_style', '__CefWindowInfo_ex_style')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'style', '__CefWindowInfo_style')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'x', '__CefWindowInfo_x')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'y', '__CefWindowInfo_y')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'width', '__CefWindowInfo_width')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'height', '__CefWindowInfo_height')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'parent_window', '__CefWindowInfo_parent_window')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'menu', '__CefWindowInfo_menu')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'windowless_rendering_enabled', '__CefWindowInfo_windowless_rendering_enabled')
_AutoItObject_AddMethod($__CefCefWindowInfo, 'window', '__CefWindowInfo_window')

func CefWindowInfo_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefCefWindowInfo)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefWindowInfo_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefWindowInfo_wn($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__ptr, 'CefWindowInfo', 'window_name')
    __CefTypes_SetString($self.__ptr, 'CefWindowInfo', 'window_name', $value)
endfunc

func __CefWindowInfo_ex_style($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefWindowInfo_Get_ex_style', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_ex_style', 'ptr', $self.__ptr, 'uint', $value)
endfunc

func __CefWindowInfo_style($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefWindowInfo_Get_style', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_style', 'ptr', $self.__ptr, 'uint', $value)
endfunc

func __CefWindowInfo_x($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'int:cdecl', 'CefWindowInfo_Get_x', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_x', 'ptr', $self.__ptr, 'int', $value)
endfunc

func __CefWindowInfo_y($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'int:cdecl', 'CefWindowInfo_Get_y', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_y', 'ptr', $self.__ptr, 'int', $value)
endfunc

func __CefWindowInfo_width($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'int:cdecl', 'CefWindowInfo_Get_width', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_width', 'ptr', $self.__ptr, 'int', $value)
endfunc

func __CefWindowInfo_height($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'int:cdecl', 'CefWindowInfo_Get_height', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_height', 'ptr', $self.__ptr, 'int', $value)
endfunc

func __CefWindowInfo_parent_window($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefWindowInfo_Get_parent_window', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_parent_window', 'ptr', $self.__ptr, 'hwnd', $value)
endfunc

func __CefWindowInfo_menu($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefWindowInfo_Get_menu', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_menu', 'ptr', $self.__ptr, 'ptr', $value)
endfunc

func __CefWindowInfo_windowless_rendering_enabled($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'int:cdecl', 'CefWindowInfo_Get_windowless_rendering_enabled', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_windowless_rendering_enabled', 'ptr', $self.__ptr, 'int', $value)
endfunc

func __CefWindowInfo_window($self, $value = null)
	if @numparams == 1 then return _
		dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefWindowInfo_Get_window', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_window', 'ptr', $self.__ptr, 'hwnd', $value)
endfunc
