#cs
	file: base/client.au3
	author: wuuyi123
#ce

; CefClient
; ==================================================

global $tag_CefClient = ( _
	$tag_CefBase & 'ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;ptr;' & _
	'char __GCMH[100];' & _
	'char __GDiaH[100];' & _
	'char __GDisH[100];' & _
	'char __GDoH[100];' & _
	'char __GDrH[100];' & _
	'char __GFiH[100];' & _
	'char __GFoH[100];' & _
	'char __GGH[100];' & _
	'char __GJH[100];' & _
	'char __GKH[100];' & _
	'char __GLSH[100];' & _
	'char __GLH[100];' & _
	'char __GRenH[100];' & _
	'char __GReqH[100];' & _
	'char __OPMR[100];' _
)

global $__Cef__GetContextMenuHandler 	= Cef_CallbackRegister(__Cef__GetContextMenuHandler, 'ptr', 'ptr')
global $__Cef__GetDialogHandler  		= Cef_CallbackRegister(__Cef__GetDialogHandler , 'ptr', 'ptr')
global $__Cef__GetDisplayHandler 		= Cef_CallbackRegister(__Cef__GetDisplayHandler, 'ptr', 'ptr')
global $__Cef__GetDownloadHandler 		= Cef_CallbackRegister(__Cef__GetDownloadHandler, 'ptr', 'ptr')
global $__Cef__GetDragHandler 			= Cef_CallbackRegister(__Cef__GetDragHandler, 'ptr', 'ptr')
global $__Cef__GetFindHandler 			= Cef_CallbackRegister(__Cef__GetFindHandler, 'ptr', 'ptr')
global $__Cef__GetFocusHandler 			= Cef_CallbackRegister(__Cef__GetFocusHandler, 'ptr', 'ptr')
global $__Cef__GetGeolocationHandler 	= Cef_CallbackRegister(__Cef__GetGeolocationHandler, 'ptr', 'ptr')
global $__Cef__GetJSDialogHandler 		= Cef_CallbackRegister(__Cef__GetJSDialogHandler, 'ptr', 'ptr')
global $__Cef__GetKeyboardHandler 		= Cef_CallbackRegister(__Cef__GetKeyboardHandler, 'ptr', 'ptr')
global $__Cef__GetLifeSpanHandler 		= Cef_CallbackRegister(__Cef__GetLifeSpanHandler, 'ptr', 'ptr')
global $__Cef__GetLoadHandler 			= Cef_CallbackRegister(__Cef__GetLoadHandler, 'ptr', 'ptr')
global $__Cef__GetRenderHandler 		= Cef_CallbackRegister(__Cef__GetRenderHandler, 'ptr', 'ptr')
global $__Cef__GetRequestHandler 		= Cef_CallbackRegister(__Cef__GetRequestHandler, 'ptr', 'ptr')
global $__Cef__OnProcessMessageReceived = Cef_CallbackRegister(__Cef__OnProcessMessageReceived, 'int', 'ptr;ptr;int;ptr')

; ==================================================

Func CefClient_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefClient, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefClient)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefClient')

	_AutoItObject_AddMethod($struct, 'GetContextMenuHandler', '__CefClient_GCMH')
	_AutoItObject_AddMethod($struct, 'GetDialogHandler', '__CefClient_GDiaH')
	_AutoItObject_AddMethod($struct, 'GetDisplayHandler', '__CefClient_GDisH')
	_AutoItObject_AddMethod($struct, 'GetDownloadHandler', '__CefClient_GDoH')
	_AutoItObject_AddMethod($struct, 'GetDragHandler', '__CefClient_GDrH')
	_AutoItObject_AddMethod($struct, 'GetFindHandler', '__CefClient_GFiH')
	_AutoItObject_AddMethod($struct, 'GetFocusHandler', '__CefClient_GFoH')
	_AutoItObject_AddMethod($struct, 'GetGeolocationHandler', '__CefClient_GGH')
	_AutoItObject_AddMethod($struct, 'GetJSDialogHandler', '__CefClient_GJH')
	_AutoItObject_AddMethod($struct, 'GetKeyboardHandler', '__CefClient_GKH')
	_AutoItObject_AddMethod($struct, 'GetLifeSpanHandler', '__CefClient_GLSH')
	_AutoItObject_AddMethod($struct, 'GetLoadHandler', '__CefClient_GLH')
	_AutoItObject_AddMethod($struct, 'GetRenderHandler', '__CefClient_GRenH')
	_AutoItObject_AddMethod($struct, 'GetRequestHandler', '__CefClient_GReqH')
	_AutoItObject_AddMethod($struct, 'OnProcessMessageReceived', '__CefClient_OPMR')

	return $struct
EndFunc

func __CefClient_GCMH($self, $func = null)
	if @numparams == 1 then return $self.__GCMH

	$self.__GCMH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetContextMenuHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetContextMenuHandler)
endfunc

func __CefClient_GDiaH($self, $func = null)
	if @numparams == 1 then return $self.__GDiaH

	$self.__GDiaH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDialogHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetDialogHandler)
endfunc

func __CefClient_GDisH($self, $func = null)
	if @numparams == 1 then return $self.__GDisH

	$self.__GDisH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDisplayHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetDisplayHandler)
endfunc

func __CefClient_GDoH($self, $func = null)
	if @numparams == 1 then return $self.__GDoH

	$self.__GDoH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDownloadHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetDownloadHandler)
endfunc

func __CefClient_GDrH($self, $func = null)
	if @numparams == 1 then return $self.__GDrH

	$self.__GDrH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDragHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetDragHandler)
endfunc

func __CefClient_GFiH($self, $func = null)
	if @numparams == 1 then return $self.__GFiH

	$self.__GFiH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetFindHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetFindHandler)
endfunc

func __CefClient_GFoH($self, $func = null)
	if @numparams == 1 then return $self.__GFoH

	$self.__GFoH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetFocusHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetFocusHandler)
endfunc

func __CefClient_GGH($self, $func = null)
	if @numparams == 1 then return $self.__GGH

	$self.__GGH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetGeolocationHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetGeolocationHandler)
endfunc

func __CefClient_GJH($self, $func = null)
	if @numparams == 1 then return $self.__GJH

	$self.__GJH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetJSDialogHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetJSDialogHandler)
endfunc

func __CefClient_GKH($self, $func = null)
	if @numparams == 1 then return $self.__GKH

	$self.__GKH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetKeyboardHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetKeyboardHandler)
endfunc

func __CefClient_GLSH($self, $func = null)
	if @numparams == 1 then return $self.__GLSH

	$self.__GLSH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetLifeSpanHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetLifeSpanHandler)
endfunc

func __CefClient_GLH($self, $func = null)
	if @numparams == 1 then return $self.__GLH

	$self.__GLH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetLoadHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetLoadHandler)
endfunc

func __CefClient_GRenH($self, $func = null)
	if @numparams == 1 then return $self.__GRenH

	$self.__GRenH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetRenderHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetRenderHandler)
endfunc

func __CefClient_GReqH($self, $func = null)
	if @numparams == 1 then return $self.__GReqH

	$self.__GReqH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetRequestHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetRequestHandler)
endfunc

func __CefClient_OPMR($self, $func = null)
	if @numparams == 1 then return $self.__OPMR

	$self.__OPMR = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_OnProcessMessageReceived', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnProcessMessageReceived)
endfunc

; ==================================================

func __Cef__GetContextMenuHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GCMH, $self)
endfunc

func __Cef__GetDialogHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GDiaH, $self)
endfunc

func __Cef__GetDisplayHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GDisH, $self)
endfunc

func __Cef__GetDownloadHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GDoH, $self)
endfunc

func __Cef__GetDragHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GDrH, $self)
endfunc

func __Cef__GetFindHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GFiH, $self)
endfunc

func __Cef__GetFocusHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GFoH, $self)
endfunc

func __Cef__GetGeolocationHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GGH, $self)
endfunc

func __Cef__GetJSDialogHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GJH, $self)
endfunc

func __Cef__GetKeyboardHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GKH, $self)
endfunc

func __Cef__GetLifeSpanHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GLSH, $self)
endfunc

func __Cef__GetLoadHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GLH, $self)
endfunc

func __Cef__GetRenderHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GRenH, $self)
endfunc

func __Cef__GetRequestHandler($self)
	$self = CefClient_Create($self)

	return call($self.__GReqH, $self)
endfunc

func __Cef__OnProcessMessageReceived($self, $browser, $source_process, $message)
	$self = CefClient_Create($self)
	$browser = CefBrowser_Create($self)

	return call($self.__OPMR, $self, $browser, $source_process, $message)
endfunc