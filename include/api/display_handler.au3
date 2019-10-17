#cs
	file: api/display_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefDisplayHandler
; ==================================================

func CefDisplayHandler_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefDisplayHandler')

		.AddMethod('OnAddressChange', '__CefDisplayHandler_OAC')
		.AddMethod('OnTitleChange', '__CefDisplayHandler_OTC')
		.AddMethod('OnFaviconUrlChange', '__CefDisplayHandler_OFUC')
		.AddMethod('OnFullscreenModeChange', '__CefDisplayHandler_OFMC')
		.AddMethod('OnTooltip', '__CefDisplayHandler_OT')
		.AddMethod('OnStatusMessage', '__CefDisplayHandler_OSM')
		.AddMethod('OnConsoleMessage', '__CefDisplayHandler_OCM')

		global const $__CefDisplayHandler = .Object

	endwith

	global const $__CefDisplayHandler__OAC	= Cef_CallbackRegister(__CefDisplayHandler__OAC, 	'none', 'str;idispatch;idispatch;idispatch')
	global const $__CefDisplayHandler__OTC	= Cef_CallbackRegister(__CefDisplayHandler__OTC, 	'none', 'str;idispatch;idispatch')
	global const $__CefDisplayHandler__OFUC	= Cef_CallbackRegister(__CefDisplayHandler__OFUC, 	'none', 'str;idispatch;idispatch')
	global const $__CefDisplayHandler__OFMC	= Cef_CallbackRegister(__CefDisplayHandler__OFMC, 	'none', 'str;idispatch;int')
	global const $__CefDisplayHandler__OT	= Cef_CallbackRegister(__CefDisplayHandler__OT, 	'int', 	'str;idispatch;idispatch')
	global const $__CefDisplayHandler__OSM	= Cef_CallbackRegister(__CefDisplayHandler__OSM, 	'none', 'str;idispatch;idispatch')
	global const $__CefDisplayHandler__OCM	= Cef_CallbackRegister(__CefDisplayHandler__OCM, 	'int', 	'str;idispatch;idispatch;idispatch;int')

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Init', _
		'idispatch', $__CefDisplayHandler, _
		'ptr', $__CefDisplayHandler__OAC, _
		'ptr', $__CefDisplayHandler__OTC, _
		'ptr', $__CefDisplayHandler__OFUC, _
		'ptr', $__CefDisplayHandler__OFMC, _
		'ptr', $__CefDisplayHandler__OT, _
		'ptr', $__CefDisplayHandler__OSM, _
		'ptr', $__CefDisplayHandler__OCM _
	)

endfunc

; ==================================================

func CefDisplayHandler_Create($ptr = 0)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefDisplayHandler_Create', 'ptr', $ptr)[0]
endfunc

func __CefDisplayHandler_OAC($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OAC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OAC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OTC($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OTC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OTC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OFUC($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OFUC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OFUC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OFMC($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OFMC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OFMC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OT($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OT', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OT', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OSM($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OSM', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OSM', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefDisplayHandler_OCM($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDisplayHandler_Get_OCM', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_Set_OCM', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

; ==================================================

func __CefDisplayHandler__OAC($self, $browser, $frame, $url)
	call($self, $browser, $frame, $url)
endfunc

func __CefDisplayHandler__OTC($self, $browser, $title)
	call($self, $browser, $title)
endfunc

func __CefDisplayHandler__OFUC($self, $browser, $icon_urls)
	call($self, $browser, $icon_urls)
endfunc

func __CefDisplayHandler__OFMC($self, $browser, $fullscreen)
	call($self, $browser, $fullscreen)
endfunc

func __CefDisplayHandler__OT($self, $browser, $text)
	return call($self, $browser, $text)
endfunc

func __CefDisplayHandler__OSM($self, $browser, $value)
	call($self, $browser, $value)
endfunc

func __CefDisplayHandler__OCM($self, $browser, $message, $source, $line)
	return call($self, $browser, $message, $source, $line)
endfunc