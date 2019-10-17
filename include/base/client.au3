#cs
	file: base/client.au3
	author: wuuyi123
#ce

#include-once

; CefClient
; ==================================================

func CefClient_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefClient')

		.AddMethod('GetContextMenuHandler', '__CefClient_GCMH')
		.AddMethod('GetDialogHandler', '__CefClient_GDiaH')
		.AddMethod('GetDisplayHandler', '__CefClient_GDisH')
		.AddMethod('GetDownloadHandler', '__CefClient_GDoH')
		.AddMethod('GetDragHandler', '__CefClient_GDrH')
		.AddMethod('GetFindHandler', '__CefClient_GFiH')
		.AddMethod('GetFocusHandler', '__CefClient_GFoH')
		.AddMethod('GetGeolocationHandler', '__CefClient_GGH')
		.AddMethod('GetJSDialogHandler', '__CefClient_GJH')
		.AddMethod('GetKeyboardHandler', '__CefClient_GKH')
		.AddMethod('GetLifeSpanHandler', '__CefClient_GLSH')
		.AddMethod('GetLoadHandler', '__CefClient_GLH')
		.AddMethod('GetRenderHandler', '__CefClient_GRenH')
		.AddMethod('GetRequestHandler', '__CefClient_GReqH')
		.AddMethod('OnProcessMessageReceived', '__CefClient_OPMR')

		global const $__CefClient = .Object

	endwith

	global const $__CefClient__GCMH 	= Cef_CallbackRegister(__CefClient__GCMH, 	'ptr', 'str')
	global const $__CefClient__GDiaH  	= Cef_CallbackRegister(__CefClient__GDiaH,	'ptr', 'str')
	global const $__CefClient__GDisH 	= Cef_CallbackRegister(__CefClient__GDisH, 	'ptr', 'str')
	global const $__CefClient__GDoH 	= Cef_CallbackRegister(__CefClient__GDoH, 	'ptr', 'str')
	global const $__CefClient__GDrH 	= Cef_CallbackRegister(__CefClient__GDrH, 	'ptr', 'str')

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Init', _
		'idispatch', $__CefClient, _
		'ptr',  $__CefClient__GCMH, _
		'ptr',  $__CefClient__GDiaH, _
		'ptr',  $__CefClient__GDisH, _
		'ptr',  $__CefClient__GDoH, _
		'ptr',  $__CefClient__GDrH _
	)

	global const $__CefClient__GFiH 	= Cef_CallbackRegister(__CefClient__GFiH, 	'ptr', 'str')
	global const $__CefClient__GFoH 	= Cef_CallbackRegister(__CefClient__GFoH, 	'ptr', 'str')
	global const $__CefClient__GGH 		= Cef_CallbackRegister(__CefClient__GGH, 	'ptr', 'str')
	global const $__CefClient__GJH 		= Cef_CallbackRegister(__CefClient__GJH, 	'ptr', 'str')
	global const $__CefClient__GKH 		= Cef_CallbackRegister(__CefClient__GKH, 	'ptr', 'str')

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Init2', _
		'ptr',  $__CefClient__GFiH, _
		'ptr',  $__CefClient__GFoH, _
		'ptr',  $__CefClient__GGH, _
		'ptr',  $__CefClient__GJH, _
		'ptr',  $__CefClient__GKH _
	)

	global const $__CefClient__GLSH 	= Cef_CallbackRegister(__CefClient__GLSH, 	'ptr', 'str')
	global const $__CefClient__GLH 		= Cef_CallbackRegister(__CefClient__GLH, 	'ptr', 'str')
	global const $__CefClient__GRenH 	= Cef_CallbackRegister(__CefClient__GRenH, 	'ptr', 'str')
	global const $__CefClient__GReqH 	= Cef_CallbackRegister(__CefClient__GReqH, 	'ptr', 'str')
	global const $__CefClient__OPMR 	= Cef_CallbackRegister(__CefClient__OPMR, 	'int', 'ptr;ptr;int;ptr')

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Init3', _
		'ptr',  $__CefClient__GCMH, _
		'ptr',  $__CefClient__GDiaH, _
		'ptr',  $__CefClient__GDisH, _
		'ptr',  $__CefClient__GDoH, _
		'ptr',  $__CefClient__GDrH _
	)

endfunc

; ==================================================

func CefClient_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefClient_Create', 'ptr', $ptr)[0]
endfunc

func __CefClient_GCMH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GCMH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GCMH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GDiaH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDiaH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDiaH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GDisH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDisH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDisH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GDoH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDoH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDoH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GDrH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDrH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDrH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GFiH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFiH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GFiH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GFoH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFoH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GFoH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GGH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GGH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GGH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GJH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GJH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GJH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GKH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GKH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GKH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GLSH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLSH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GLSH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GLH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GLH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GRenH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GRenH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GRenH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_GReqH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GReqH', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GReqH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefClient_OPMR($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_OPMR', 'ptr', $self.__ptr)[0]
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_OPMR', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

; ==================================================

func __CefClient__GCMH($self)
	return call($self)
endfunc

func __CefClient__GDiaH($self)
	return call($self)
endfunc

func __CefClient__GDisH($self)
	return call($self)
endfunc

func __CefClient__GDoH($self)
	return call($self)
endfunc

func __CefClient__GDrH($self)
	return call($self)
endfunc

func __CefClient__GFiH($self)
	return call($self)
endfunc

func __CefClient__GFoH($self)
	return call($self)
endfunc

func __CefClient__GGH($self)
	return call($self)
endfunc

func __CefClient__GJH($self)
	return call($self)
endfunc

func __CefClient__GKH($self)
	return call($self)
endfunc

func __CefClient__GLSH($self)
	return call($self)
endfunc

func __CefClient__GLH($self)
	return call($self)
endfunc

func __CefClient__GRenH($self)
	return call($self)
endfunc

func __CefClient__GReqH($self)
	return call($self)
endfunc

func __CefClient__OPMR($self, $browser, $source_process, $message)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_OPMR', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($self)

	;$message 	= CefProcessMessage_Create($message)

	return call($self, $browser, $source_process, $message)
endfunc