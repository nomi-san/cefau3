#cs
	file: api/render_process_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefRenderProcessHandler
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefRenderProcessHandler')

	.AddMethod('OnRenderThreadCreated', '__CefRenderProcessHandler_ORTC')
	.AddMethod('OnWebKitInitialized', 	'__CefRenderProcessHandler_OWKI')
	.AddMethod('OnBrowserCreated', 	'__CefRenderProcessHandler_OBC')
	.AddMethod('OnBrowserDestroyed', 	'__CefRenderProcessHandler_OBD')
	.AddMethod('GetLoadHandler', 		'__CefRenderProcessHandler_GLH')
	.AddMethod('OnBeforeNavigation', 	'__CefRenderProcessHandler_OBN')
	.AddMethod('OnContextCreated', 	'__CefRenderProcessHandler_OCC')
	.AddMethod('OnContextReleased', 	'__CefRenderProcessHandler_OCR')
	.AddMethod('OnUncaughtException', 	'__CefRenderProcessHandler_OUE')
	.AddMethod('OnFocusedNodeChanged', '__CefRenderProcessHandler_OFNC')
	.AddMethod('OnProcessMessageReceived', '__CefRenderProcessHandler_OPMR')

	global $__CefRenderProcessHandler = .Object

endwith

global const $__CefRenderProcessHandler__ORTC = Cef_CallbackRegister(__CefRenderProcessHandler__ORTC, 'none', 'ptr;ptr')
global const $__CefRenderProcessHandler__OWKI = Cef_CallbackRegister(__CefRenderProcessHandler__OWKI, 'none', 'ptr')
global const $__CefRenderProcessHandler__OBC  = Cef_CallbackRegister(__CefRenderProcessHandler__OBC,  'none', 'ptr;ptr')
global const $__CefRenderProcessHandler__OBD  = Cef_CallbackRegister(__CefRenderProcessHandler__OBD,  'none', 'ptr;ptr')
global const $__CefRenderProcessHandler__GLH  = Cef_CallbackRegister(__CefRenderProcessHandler__GLH,  'ptr',  'ptr')
global const $__CefRenderProcessHandler__OBN  = Cef_CallbackRegister(__CefRenderProcessHandler__OBN,  'int',  'ptr;ptr;ptr;ptr;int;int')
global const $__CefRenderProcessHandler__OCC  = Cef_CallbackRegister(__CefRenderProcessHandler__OCC,  'none', 'ptr;ptr;ptr;ptr')
global const $__CefRenderProcessHandler__OCR  = Cef_CallbackRegister(__CefRenderProcessHandler__OCR,  'none', 'ptr;ptr;ptr;ptr')
global const $__CefRenderProcessHandler__OUE  = Cef_CallbackRegister(__CefRenderProcessHandler__OUE,  'none', 'ptr;ptr;ptr;ptr;ptr;ptr')
global const $__CefRenderProcessHandler__OFNC = Cef_CallbackRegister(__CefRenderProcessHandler__OFNC, 'none', 'ptr;ptr;ptr;ptr')
global const $__CefRenderProcessHandler__OPMR = Cef_CallbackRegister(__CefRenderProcessHandler__OPMR, 'int',  'ptr;ptr;int;ptr')

; ==================================================

func CefRenderProcessHandler_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefRenderProcessHandler_Create', 'idispatch', $__CefRenderProcessHandler, 'ptr', $ptr)[0]
endfunc

func __CefRenderProcessHandler_ORTC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_ORTC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_ORTC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_ORTC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__ORTC : null)
endfunc

func __CefRenderProcessHandler_OWKI($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OWKI', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OWKI', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OWKI', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OWKI : null)
endfunc

func __CefRenderProcessHandler_OBC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OBC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OBC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OBC : null)
endfunc

func __CefRenderProcessHandler_OBD($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBD', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OBD', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OBD', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OBD : null)
endfunc

func __CefRenderProcessHandler_GLH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_GLH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_GLH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_GLH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__GLH : null)
endfunc

func __CefRenderProcessHandler_OBN($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBN', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OBN', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OBN', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OBN : null)
endfunc

func __CefRenderProcessHandler_OCC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OCC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OCC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OCC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OCC : null)
endfunc

func __CefRenderProcessHandler_OCR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OCR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OCR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OCR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OCR : null)
endfunc

func __CefRenderProcessHandler_OUE($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OUE', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OUE', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OUE', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OUE : null)
endfunc

func __CefRenderProcessHandler_OFNC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OFNC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OFNC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OFNC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OFNC : null)
endfunc

func __CefRenderProcessHandler_OPMR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OPMR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_Set_OPMR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OPMR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefRenderProcessHandler__OPMR : null)
endfunc

; ==================================================

func __CefRenderProcessHandler__ORTC($self, $extra_info)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_ORTC', 'ptr', $self)[0]
	;$extra_info = CefListValue_Create($extra_info)

	call($self, $extra_info)
endfunc

func __CefRenderProcessHandler__OWKI($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OWKI', 'ptr', $self)[0]

	call($self)
endfunc

func __CefRenderProcessHandler__OBC($self, $browser)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBC', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)

	call($self, $browser)
endfunc

func __CefRenderProcessHandler__OBD($self, $browser)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBD', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)

	call($self, $browser)
endfunc

func __CefRenderProcessHandler__GLH($self)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_GLH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefRenderProcessHandler__OBN($self, $browser, $frame, $request, $navigation_type, $is_redirect)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OBN', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$request 	= CefRequest_Create($request)

	return call($self, $browser, $frame, $request, $navigation_type, $is_redirect)
endfunc

func __CefRenderProcessHandler__OCC($self, $browser, $frame, $context)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OCC', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)

	call($self, $browser, $frame, $context)
endfunc

func __CefRenderProcessHandler__OCR($self, $browser, $frame, $context)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OCR', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)

	call($self, $browser, $frame, $context)
endfunc

func __CefRenderProcessHandler__OUE($self, $browser, $frame, $context, $exception, $stackTrace)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OUE', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)
	;$exception 	= CefV8Exception_Create($exception)
	;$stackTrace	= CefV8StackTrace_Create($stackTrace)

	call($self, $browser, $frame, $context, $exception, $stackTrace)
endfunc

func __CefRenderProcessHandler__OFNC($self, $browser, $frame, $node)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OFNC', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$node 		= CefDOMNode_Create($node)

	call($self, $browser, $frame, $node)
endfunc

func __CefRenderProcessHandler__OPMR($self, $browser, $source_process, $message)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefRenderProcessHandler_Get_OPMR', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)

	;$message 	= CefProcessMessage_Create($message)

	return call($self, $browser, $source_process, $message)
endfunc