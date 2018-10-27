#cs
	file: api/life_span_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefLifeSpanHandler
; ==================================================

func CefLifeSpanHandler_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefLifeSpanHandler')

		.AddMethod('OnBeforePopup',  '__CefLifeSpanHandler_OBP')
		.AddMethod('OnAfterCreated', '__CefLifeSpanHandler_OAC')
		.AddMethod('DoClose', 		 '__CefLifeSpanHandler_DC')
		.AddMethod('OnBeforeClose',  '__CefLifeSpanHandler_OBC')

		global const $__CefLifeSpanHandler = .Object

	endwith

	global const $__CefLifeSpanHandler__OBP = Cef_CallbackRegister(__CefLifeSpanHandler__OBP, 'int',  'str;idispatch;ptr;ptr;ptr;int;ptr;ptr;ptr;ptr;ptr')
	global const $__CefLifeSpanHandler__OAC = Cef_CallbackRegister(__CefLifeSpanHandler__OAC, 'none', 'str;idispatch')
	global const $__CefLifeSpanHandler__DC 	= Cef_CallbackRegister(__CefLifeSpanHandler__DC,  'int',  'str;idispatch')
	global const $__CefLifeSpanHandler__OBC = Cef_CallbackRegister(__CefLifeSpanHandler__OBC, 'none', 'str;idispatch')

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Init', _
		'idispatch', $__CefLifeSpanHandler, _
		'ptr', $__CefLifeSpanHandler__OBP, _
		'ptr', $__CefLifeSpanHandler__OAC, _
		'ptr', $__CefLifeSpanHandler__DC, _
		'ptr', $__CefLifeSpanHandler__OBC _
	)

endfunc

; ==================================================

func CefLifeSpanHandler_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefLifeSpanHandler_Create', 'ptr', $ptr)[0]
endfunc

func __CefLifeSpanHandler_OBP($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBP', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OBP', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefLifeSpanHandler_OAC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OAC', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OAC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefLifeSpanHandler_DC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_DC', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_DC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefLifeSpanHandler_OBC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBC', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OBC', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

; ==================================================

func __CefLifeSpanHandler__OBP($self, $browser, $frame, $target_url, $target_frame_name, $target_disposition, $windowInfo, $client, $settings, $no_javascript_access)
	return call($self, $browser, $frame, $target_url, $target_frame_name, $target_disposition, $windowInfo, $client, $settings, $no_javascript_access)
endfunc

func __CefLifeSpanHandler__OAC($self, $browser)
	call($self, $browser)
endfunc

func __CefLifeSpanHandler__DC($self, $browser)
	return call($self, $browser)
endfunc

func __CefLifeSpanHandler__OBC($self, $browser)
	call($self, $browser)
endfunc