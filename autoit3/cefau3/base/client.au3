#cs
	file: base/client.au3
	author: wuuyi123
#ce

global $tag_CefClient = ( _
	$tag_CefBase & _
	'ptr __GCMH;' & _
	'ptr __GDiaH;' & _
	'ptr __GDisH;' & _
	'ptr __GDoH;' & _
	'ptr __GDrH;' & _
	'ptr __GFiH;' & _
	'ptr __GFoH;' & _
	'ptr __GGH;' & _
	'ptr __GJH;' & _
	'ptr __GKH;' & _
	'ptr __GLSH;' & _
	'ptr __GLH;' & _
	'ptr __GRenH;' & _
	'ptr __GReqH;' & _
	'ptr __OPMR;' _
)

global $__params_GetContextMenuHandler = 'ptr', _
	$__return_GetContextMenuHandler = 'ptr'

global $__params_GetDialogHandler = 'ptr', _
	$__return_GetDialogHandler = 'ptr'

global $__params_GetDisplayHandler = 'ptr', _
	$__return_GetDisplayHandler = 'ptr'

global $__params_GetDownloadHandler = 'ptr', _
	$__return_GetDownloadHandler = 'ptr'

global $__params_GetDragHandler = 'ptr', _
	$__return_GetDragHandler = 'ptr'

global $__params_GetFindHandler = 'ptr', _
	$__return_GetFindHandler = 'ptr'

global $__params_GetFocusHandler = 'ptr', _
	$__return_GetFocusHandler = 'ptr'

global $__params_GetGeolocationHandler = 'ptr', _
	$__return_GetGeolocationHandler = 'ptr'

global $__params_GetJSDialogHandler = 'ptr', _
	$__return_GetJSDialogHandler = 'ptr'

global $__params_GetKeyboardHandler = 'ptr', _
	$__return_GetKeyboardHandler = 'ptr'

global $__params_GetLifeSpanHandler = 'ptr', _
	$__return_GetLifeSpanHandler = 'ptr'

global $__params_GetLoadHandler = 'ptr', _
	$__return_GetLoadHandler = 'ptr'

global $__params_GetRenderHandler = 'ptr', _
	$__return_GetRenderHandler = 'ptr'

global $__params_GetRequestHandler = 'ptr', _
	$__return_GetRequestHandler = 'ptr'

global $__params_OnProcessMessageReceived = 'ptr;ptr;int;ptr', _
	$__return_OnProcessMessageReceived = 'int'

Func CefClient_Create()
;~ 	Local $ret = DllCall($__Cefau3Dll__, 'ptr:cdecl', 'CefClient_Create')
;~ 	Return @error ? 0 : $ret[0]
	local $struct = _AutoItObject_DllStructCreate($tag_CefApp)
	$struct.size = Cef_StructSize(2);

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
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

	local $cb = dllcallbackregister($func, $__return_GetContextMenuHandler, $__params_GetContextMenuHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetContextMenuHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GDiaH($self, $func = null)
	if @numparams == 1 then return $self.__GDiaH

	local $cb = dllcallbackregister($func, $__return_GetDialogHandler, $__params_GetDialogHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDialogHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GDisH($self, $func = null)
	if @numparams == 1 then return $self.__GDisH

	local $cb = dllcallbackregister($func, $__return_GetDisplayHandler, $__params_GetDisplayHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDisplayHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GDoH($self, $func = null)
	if @numparams == 1 then return $self.__GDoH

	local $cb = dllcallbackregister($func, $__return_GetDownloadHandler, $__params_GetDownloadHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDownloadHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GDrH($self, $func = null)
	if @numparams == 1 then return $self.__GDrH

	local $cb = dllcallbackregister($func, $__return_GetDragHandler, $__params_GetDragHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetDragHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GFiH($self, $func = null)
	if @numparams == 1 then return $self.__GFiH

	local $cb = dllcallbackregister($func, $__return_GetFindHandler, $__params_GetFindHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetFindHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GFoH($self, $func = null)
	if @numparams == 1 then return $self.__GFoH

	local $cb = dllcallbackregister($func, $__return_GetFocusHandler, $__params_GetFocusHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetFocusHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GGH($self, $func = null)
	if @numparams == 1 then return $self.__GGH

	local $cb = dllcallbackregister($func, $__return_GetGeolocationHandler, $__params_GetGeolocationHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetGeolocationHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GJH($self, $func = null)
	if @numparams == 1 then return $self.__GJH

	local $cb = dllcallbackregister($func, $__return_GetJSDialogHandler, $__params_GetJSDialogHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetJSDialogHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GKH($self, $func = null)
	if @numparams == 1 then return $self.__GKH

	local $cb = dllcallbackregister($func, $__return_GetKeyboardHandler, $__params_GetKeyboardHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetKeyboardHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GLSH($self, $func = null)
	if @numparams == 1 then return $self.__GLSH

	local $cb = dllcallbackregister($func, $__return_GetLifeSpanHandler, $__params_GetLifeSpanHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetLifeSpanHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GLH($self, $func = null)
	if @numparams == 1 then return $self.__GLH

	local $cb = dllcallbackregister($func, $__return_GetLoadHandler, $__params_GetLoadHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetLoadHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GRenH($self, $func = null)
	if @numparams == 1 then return $self.__GRenH

	local $cb = dllcallbackregister($func, $__return_GetRenderHandler, $__params_GetRenderHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetRenderHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_GReqH($self, $func = null)
	if @numparams == 1 then return $self.__GReqH

	local $cb = dllcallbackregister($func, $__return_GetRequestHandler, $__params_GetRequestHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_GetRequestHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefClient_OPMR($self, $func = null)
	if @numparams == 1 then return $self.__OPMR

	local $cb = dllcallbackregister($func, $__return_OnProcessMessageReceived, $__params_OnProcessMessageReceived)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefClient_OnProcessMessageReceived', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc
