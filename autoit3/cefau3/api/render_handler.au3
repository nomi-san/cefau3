#cs
	file: api/render_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefRenderHandler
; ==================================================

global $__CefRenderHandler = null

$__CefRenderHandler = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefRenderHandler, '__ptr')
_AutoItObject_AddProperty($__CefRenderHandler, '__type', 1, 'CefRenderHandler')

_AutoItObject_AddMethod($__CefRenderHandler, 'GetAccessibilityHandler', '__CefRenderHandler_GAH')
_AutoItObject_AddMethod($__CefRenderHandler, 'GetRootScreenRect', 		'__CefRenderHandler_GRSR')
_AutoItObject_AddMethod($__CefRenderHandler, 'GetViewRect', 			'__CefRenderHandler_GVR')
_AutoItObject_AddMethod($__CefRenderHandler, 'GetScreenPoint', 			'__CefRenderHandler_GSP')
_AutoItObject_AddMethod($__CefRenderHandler, 'GetScreenInfo', 			'__CefRenderHandler_GSI')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnPopupShow', 			'__CefRenderHandler_OPSh')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnPopupSize', 			'__CefRenderHandler_OPSi')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnPaint', 				'__CefRenderHandler_OP')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnCursorChange', 			'__CefRenderHandler_OCC')
_AutoItObject_AddMethod($__CefRenderHandler, 'StartDragging', 			'__CefRenderHandler_SD')
_AutoItObject_AddMethod($__CefRenderHandler, 'UpdateDragCursor', 		'__CefRenderHandler_UDC')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnScrollOffsetChanged', 	'__CefRenderHandler_OSOC')
_AutoItObject_AddMethod($__CefRenderHandler, 'OnIMECompositionRangeChanged', '__CefRenderHandler_OICRC')

global $__CefRenderHandler__GAH 	= Cef_CallbackRegister(__CefRenderHandler__GAH, 	'ptr', 	'ptr')
global $__CefRenderHandler__GRSR 	= Cef_CallbackRegister(__CefRenderHandler__GRSR, 	'int', 	'ptr;ptr;ptr')
global $__CefRenderHandler__GVR		= Cef_CallbackRegister(__CefRenderHandler__GVR, 	'int', 	'ptr;ptr;ptr')
global $__CefRenderHandler__GSP		= Cef_CallbackRegister(__CefRenderHandler__GSP, 	'int', 	'ptr;ptr;int;int;ptr;ptr')
global $__CefRenderHandler__GSI		= Cef_CallbackRegister(__CefRenderHandler__GSI, 	'int', 	'ptr;ptr;ptr')
global $__CefRenderHandler__OPSh 	= Cef_CallbackRegister(__CefRenderHandler__OPSh, 	'none', 'ptr;ptr;int')
global $__CefRenderHandler__OPSi 	= Cef_CallbackRegister(__CefRenderHandler__OPSi, 	'none', 'ptr;ptr;ptr')
global $__CefRenderHandler__OP 		= Cef_CallbackRegister(__CefRenderHandler__OP, 		'none', 'ptr;ptr;int;uint;ptr;ptr;int;int')
global $__CefRenderHandler__OCC		= Cef_CallbackRegister(__CefRenderHandler__OCC, 	'none', 'ptr;ptr;int;int;ptr')
global $__CefRenderHandler__SD 		= Cef_CallbackRegister(__CefRenderHandler__SD, 		'int', 	'ptr;ptr;ptr;int;int;int')
global $__CefRenderHandler__UDC 	= Cef_CallbackRegister(__CefRenderHandler__UDC, 	'none', 'ptr;ptr;int')
global $__CefRenderHandler__OSOC	= Cef_CallbackRegister(__CefRenderHandler__OSOC, 	'ptr', 	'ptr;ptr;double;double')
global $__CefRenderHandler__OICRC 	= Cef_CallbackRegister(__CefRenderHandler__OICRC, 	'ptr', 	'ptr;ptr;ptr;uint;ptr')

; ==================================================

func CefRenderHandler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefRenderHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefRenderHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefRenderHandler_GAH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GAH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_GAH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_GAH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__GAH : null)
endfunc

func __CefRenderHandler_GRSR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GRSR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_GRSR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_GRSR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__GRSR : null)
endfunc

func __CefRenderHandler_GVR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GVR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_GVR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_GVR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__GVR : null)
endfunc

func __CefRenderHandler_GSP($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GSP', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_GSP', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_GSP', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__GSP : null)
endfunc

func __CefRenderHandler_GSI($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GSI', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_GSI', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_GSI', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__GSI : null)
endfunc

func __CefRenderHandler_OPSh($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OPSh', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OPSh', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OPSh', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OPSh : null)
endfunc

func __CefRenderHandler_OPSi($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OPSi', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OPSi', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OPSi', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OPSi : null)
endfunc

func __CefRenderHandler_OP($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OP', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OP', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OP', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OP : null)
endfunc

func __CefRenderHandler_OCC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OCC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OCC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OCC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OCC : null)
endfunc

func __CefRenderHandler_SD($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_SD', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_SD', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_SD', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__SD : null)
endfunc

func __CefRenderHandler_UDC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_UDC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_UDC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_UDC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__UDC : null)
endfunc

func __CefRenderHandler_OSOC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OSOC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OSOC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OSOC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OSOC : null)
endfunc

func __CefRenderHandler_OICRC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OICRC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_Set_OICRC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderHandler_OICRC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderHandler__OICRC : null)
endfunc

; ==================================================

func __CefRenderHandler__GAH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GAH', 'ptr', $self.__ptr)[0]

	return call($self)
endfunc

func __CefRenderHandler__GRSR($self, $browser, $rect)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GRSR', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	$rect 		= CefRect_Create($rect)

	return call($self, $browser, $rect)
endfunc

func __CefRenderHandler__GVR($self, $browser, $rect)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GVR', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	$rect 		= CefRect_Create($rect)

	return call($self, $browser, $rect)
endfunc

func __CefRenderHandler__GSP($self, $browser, $viewX, $viewY, $screenX, $screenY)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GSP', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)


	$screenX 	= CefInt_Create($screenX)
	$screenY 	= CefInt_Create($screenY)

	return call($self, $browser, $viewX, $viewY, $screenX, $screenY)
endfunc

func __CefRenderHandler__GSI($self, $browser, $screen_info)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_GSI', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	$screen_info = CefScreenInfo_Create($screen_info)

	return call($self, $browser, $screen_info)
endfunc

func __CefRenderHandler__OPSh($self, $browser, $show)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OPSh', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	return call($self, $browser, $show)
endfunc

func __CefRenderHandler__OPSi($self, $browser, $rect)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OPSi', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	$rect 		= CefRect_Create($rect)

	return call($self, $browser, $rect)
endfunc

func __CefRenderHandler__OP($self, $browser, $type, $dirtyRectsCount, $dirtyRects, $buffer, $width, $height)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OP', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)


	; <list>dirtyRects

	return call($self, $browser, $type, $dirtyRectsCount, $dirtyRects, $buffer, $width, $height)
endfunc

func __CefRenderHandler__OCC($self, $browser, $cursor, $type, $custom_cursor_info)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OCC', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)


	$custom_cursor_info = CefCursorInfo_Create($custom_cursor_info)

	call($self, $browser, $cursor, $type, $custom_cursor_info)
endfunc

func __CefRenderHandler__SD($self, $browser, $drag_data, $allowed_ops, $x, $y)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_SD', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	;$drag_data 	= CefDragData_Create($drag_data)

	return call($self, $browser, $drag_data, $allowed_ops, $x, $y)
endfunc

func __CefRenderHandler__UDC($self, $browser, $operation)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_UDC', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	call($self, $browser, $operation)
endfunc

func __CefRenderHandler__OSOC($self, $browser, $x, $y)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OSOC', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	call($self, $browser, $x, $y)
endfunc

func __CefRenderHandler__OICRC($self, $browser, $selected_range, $character_boundsCount, $character_bounds)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderHandler_Get_OICRC', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	;$selected_range = CefRange_Create($selected_range)
	;
	;

	call($self, $browser, $selected_range, $character_boundsCount, $character_bounds)
endfunc