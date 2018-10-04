#cs
	file: api/types_win.au3
	author: wuuyi123
#ce

#include-once

; CefWindowInfo
; ==================================================

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

func CefWindowInfo_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefWindowInfo, 'CefWindowInfo', $ptr)

	CefStruct_AddMethod($struct, 'window_name', '__CefWindowInfo_wn')

	return $struct
endfunc

func __CefWindowInfo_wn($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefWindowInfo', 'window_name')
    __CefTypes_SetString($self.__pointer__, 'CefWindowInfo', 'window_name', $value)
endfunc

; CefMainArgs
; ==================================================

global $tag_CefMainArgs = ( _
	'ptr instance;' _
)

func CefMainArgs_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefMainArgs, 'CefMainArgs', $ptr)

	local $mod = DllCall('kernel32.dll', 'ptr', 'GetModuleHandleA', 'ptr', 0)
	$struct.instance =  @error ? null : $mod[0]

	return $struct
endfunc