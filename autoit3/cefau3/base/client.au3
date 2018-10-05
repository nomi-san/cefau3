#cs
	file: base/client.au3
	author: wuuyi123
#ce

#include-once

; CefClient
; ==================================================

global const $__CefClient__GCMH 	= Cef_CallbackRegister(__CefClient__GCMH, 	'ptr', 'ptr')
global const $__CefClient__GDiaH  	= Cef_CallbackRegister(__CefClient__GDiaH,	'ptr', 'ptr')
global const $__CefClient__GDisH 	= Cef_CallbackRegister(__CefClient__GDisH, 	'ptr', 'ptr')
global const $__CefClient__GDoH 	= Cef_CallbackRegister(__CefClient__GDoH, 	'ptr', 'ptr')
global const $__CefClient__GDrH 	= Cef_CallbackRegister(__CefClient__GDrH, 	'ptr', 'ptr')
global const $__CefClient__GFiH 	= Cef_CallbackRegister(__CefClient__GFiH, 	'ptr', 'ptr')
global const $__CefClient__GFoH 	= Cef_CallbackRegister(__CefClient__GFoH, 	'ptr', 'ptr')
global const $__CefClient__GGH 		= Cef_CallbackRegister(__CefClient__GGH, 	'ptr', 'ptr')
global const $__CefClient__GJH 		= Cef_CallbackRegister(__CefClient__GJH, 	'ptr', 'ptr')
global const $__CefClient__GKH 		= Cef_CallbackRegister(__CefClient__GKH, 	'ptr', 'ptr')
global const $__CefClient__GLSH 	= Cef_CallbackRegister(__CefClient__GLSH, 	'ptr', 'ptr')
global const $__CefClient__GLH 		= Cef_CallbackRegister(__CefClient__GLH, 	'ptr', 'ptr')
global const $__CefClient__GRenH 	= Cef_CallbackRegister(__CefClient__GRenH, 	'ptr', 'ptr')
global const $__CefClient__GReqH 	= Cef_CallbackRegister(__CefClient__GReqH, 	'ptr', 'ptr')
global const $__CefClient__OPMR 	= Cef_CallbackRegister(__CefClient__OPMR, 	'int', 'ptr;ptr;int;ptr')

; ==================================================

func CefClient_Create($ptr = null)
	local $self = CefObject_Create('CefClient', $ptr)

	CefObject_AddMethod($self, 'GetContextMenuHandler', 	'__CefClient_GCMH')
	CefObject_AddMethod($self, 'GetDialogHandler', 			'__CefClient_GDiaH')
	CefObject_AddMethod($self, 'GetDisplayHandler', 		'__CefClient_GDisH')
	CefObject_AddMethod($self, 'GetDownloadHandler', 		'__CefClient_GDoH')
	CefObject_AddMethod($self, 'GetDragHandler', 			'__CefClient_GDrH')
	CefObject_AddMethod($self, 'GetFindHandler', 			'__CefClient_GFiH')
	CefObject_AddMethod($self, 'GetFocusHandler', 			'__CefClient_GFoH')
	CefObject_AddMethod($self, 'GetGeolocationHandler', 	'__CefClient_GGH')
	CefObject_AddMethod($self, 'GetJSDialogHandler', 		'__CefClient_GJH')
	CefObject_AddMethod($self, 'GetKeyboardHandler', 		'__CefClient_GKH')
	CefObject_AddMethod($self, 'GetLifeSpanHandler', 		'__CefClient_GLSH')
	CefObject_AddMethod($self, 'GetLoadHandler', 			'__CefClient_GLH')
	CefObject_AddMethod($self, 'GetRenderHandler', 			'__CefClient_GRenH')
	CefObject_AddMethod($self, 'GetRequestHandler', 		'__CefClient_GReqH')
	CefObject_AddMethod($self, 'OnProcessMessageReceived', 	'__CefClient_OPMR')

	return $self
endfunc

func __CefClient_GCMH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GCMH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GCMH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GCMH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GCMH : null)
endfunc

func __CefClient_GDiaH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDiaH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDiaH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GDiaH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GDiaH : null)
endfunc

func __CefClient_GDisH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDisH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDisH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GDisH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GDisH : null)
endfunc

func __CefClient_GDoH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDoH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDoH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GDoH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GDoH : null)
endfunc

func __CefClient_GDrH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDrH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GDrH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GDrH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GDrH : null)
endfunc

func __CefClient_GFiH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFiH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GFiH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GFiH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GFiH : null)
endfunc

func __CefClient_GFoH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFoH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GFoH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GFoH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GFoH : null)
endfunc

func __CefClient_GGH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GGH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GGH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GGH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GGH : null)
endfunc

func __CefClient_GJH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GJH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GJH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GJH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GJH : null)
endfunc

func __CefClient_GKH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GKH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GKH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GKH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GKH : null)
endfunc

func __CefClient_GLSH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLSH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GLSH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GLSH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GLSH : null)
endfunc

func __CefClient_GLH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GLH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GLH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GLH : null)
endfunc

func __CefClient_GRenH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GRenH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GRenH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GRenH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GRenH : null)
endfunc

func __CefClient_GReqH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GReqH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_GReqH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GReqH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__GReqH : null)
endfunc

func __CefClient_OPMR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_OPMR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_Set_OPMR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_OPMR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefClient__OPMR : null)
endfunc

; ==================================================

func __CefClient__GCMH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GCMH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GDiaH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDiaH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GDisH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDisH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GDoH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDoH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GDrH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GDrH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GFiH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFiH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GFoH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GFoH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GGH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GGH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GJH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GJH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GKH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GKH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GLSH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLSH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GLH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GLH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GRenH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GRenH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__GReqH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_GReqH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefClient__OPMR($self, $browser, $source_process, $message)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefClient_Get_OPMR', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($self)

	;$message 	= CefProcessMessage_Create($message)

	return call($self, $browser, $source_process, $message)
endfunc