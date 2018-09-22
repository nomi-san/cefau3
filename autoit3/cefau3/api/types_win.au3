#cs
	file: api/types_win.au3
	author: wuuyi123
#ce

global $tag_CefWindowInfo = ( _
	'dword ex_style;' & _
	$tag_CefString & _
	'dword style;' & _
	'int x;' & _
	'int y;' & _
	'int width;' & _
	'int height;' & _
	'hwnd parent_window;' & _
	'ptr menu;' & _
	'int windowless_rendering_enabled;' & _
	'hwnd window;' _
)

func CefWindowInfo_Create()
	local $struct = _AutoItObject_DllStructCreate($tag_CefWindowInfo);, $ret)

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddMethod($struct, 'window_name', '__CefWindowInfo_wn')

	return $struct
endfunc

func __CefWindowInfo_wn($self, $value = null)
	if @numparams == 1 then return __CefWindowInfo_Get_wn($self.ptr)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefWindowInfo_Set_window_name', 'ptr', $self.ptr, 'wstr', $value)
endfunc

func __CefWindowInfo_Get_wn($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefWindowInfo_Get_window_name', 'ptr', $self)
	return @error ? null : $ret[0]
endfunc

global $tag_CefMainArgs = ( _
	'ptr instance;' _
)

func CefMainArgs_Create()
	local $struct = _AutoItObject_DllStructCreate($tag_CefMainArgs)
	local $mod = DllCall('user32.dll', 'ptr', 'GetModuleHandleA', 'ptr', 0)
	$struct.instance =  @error ? null : $mod[0]

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())

	return $struct
endfunc

; //////////////////////
