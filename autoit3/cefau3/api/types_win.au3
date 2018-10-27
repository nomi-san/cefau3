#cs
	file: api/types_win.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefMainArgs
; ==================================================

func CefMainArgs_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefMainArgs')

		.AddMethod('instance', '__CefMainArgs_instance')

		global const $__CefMainArgs = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefMainArgs_Init', 'idispatch', $__CefMainArgs)

endfunc

; ==================================================

func CefMainArgs_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefMainArgs_Create', 'ptr', $ptr)[0] 
endfunc

; ==================================================

func __CefMainArgs_instance($self, $value = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefMainArgs_Get_instance', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefMainArgs_Set_instance', 'ptr', $self.__ptr, 'ptr', $value)
endfunc

; ==================================================
; // CefWindowInfo
; ==================================================

func CefWindowInfo_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefWindowInfo')

		.AddMethod('pos', '__CefWindowInfo_pos')

		.AddMethod('window_name', '__CefWindowInfo_wn')
		.AddMethod('ex_style', '__CefWindowInfo_ex_style')
		.AddMethod('style', '__CefWindowInfo_style')
		.AddMethod('x', '__CefWindowInfo_x')
		.AddMethod('y', '__CefWindowInfo_y')
		.AddMethod('width', '__CefWindowInfo_width')
		.AddMethod('height', '__CefWindowInfo_height')
		.AddMethod('parent_window', '__CefWindowInfo_parent_window')
		.AddMethod('menu', '__CefWindowInfo_menu')
		.AddMethod('windowless_rendering_enabled', '__CefWindowInfo_windowless_rendering_enabled')
		.AddMethod('window', '__CefWindowInfo_window')

		global const $__CefCefWindowInfo = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Init', 'idispatch', $__CefCefWindowInfo)

endfunc

; ==================================================

func CefWindowInfo_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefWindowInfo_Create', 'ptr', $ptr)[0] 
endfunc

; ==================================================

func __CefWindowInfo_pos($self, $x = 0, $y = 0, $w = 0, $h = 0)
	if @numparams <> 5 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_pos', 'ptr', $self.__ptr, 'int', $x, 'int', $x, 'int', $w, 'int', $h)
endfunc

; ==================================================

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
