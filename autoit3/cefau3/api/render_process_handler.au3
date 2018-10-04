#cs
	file: api/render_process_handler.au3
	author: wuuyi123
#ce

#include-once

; CefRenderProcessHandler
; ==================================================

global $tag_CefRenderProcessHandler = ( _
	$tag_CefBase 		& _
	'ptr[11];' 			& _
	'char __ORTC[100];' & _
	'char __OWKI[100];' & _
	'char __OBC[100];' 	& _
	'char __OBD[100];' 	& _
	'char __GLH[100];' 	& _
	'char __OBN[100];' 	& _
	'char __OCC[100];' 	& _
	'char __OCR[100];'	& _
	'char __OUE[100];' 	& _
	'char __OFNC[100];' & _
	'char __OPMR[100];' _
)

global $__CefRenderProcessHandler__ORTC = Cef_CallbackRegister(__CefRenderProcessHandler__ORTC, 'none', 'ptr;ptr')
global $__CefRenderProcessHandler__OWKI = Cef_CallbackRegister(__CefRenderProcessHandler__OWKI, 'none', 'ptr')
global $__CefRenderProcessHandler__OBC 	= Cef_CallbackRegister(__CefRenderProcessHandler__OBC, 	'none', 'ptr;ptr')
global $__CefRenderProcessHandler__OBD 	= Cef_CallbackRegister(__CefRenderProcessHandler__OBD, 	'none', 'ptr;ptr')
global $__CefRenderProcessHandler__GLH 	= Cef_CallbackRegister(__CefRenderProcessHandler__GLH, 	'ptr', 	'ptr')
global $__CefRenderProcessHandler__OBN 	= Cef_CallbackRegister(__CefRenderProcessHandler__OBN, 	'int', 	'ptr;ptr;ptr;ptr;int;int')
global $__CefRenderProcessHandler__OCC	= Cef_CallbackRegister(__CefRenderProcessHandler__OCC, 	'none', 'ptr;ptr;ptr;ptr')
global $__CefRenderProcessHandler__OCR 	= Cef_CallbackRegister(__CefRenderProcessHandler__OCR, 	'none', 'ptr;ptr;ptr;ptr')
global $__CefRenderProcessHandler__OUE 	= Cef_CallbackRegister(__CefRenderProcessHandler__OUE, 	'none', 'ptr;ptr;ptr;ptr;ptr;ptr')
global $__CefRenderProcessHandler__OFNC = Cef_CallbackRegister(__CefRenderProcessHandler__OFNC, 'none', 'ptr;ptr;ptr;ptr')
global $__CefRenderProcessHandler__OPMR = Cef_CallbackRegister(__CefRenderProcessHandler__OPMR, 'int', 	'ptr;ptr;int;ptr')

; ==================================================

func CefRenderProcessHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefRenderProcessHandler, 'CefRenderProcessHandler', $ptr)
	$struct.size = $struct.__size__;

	CefStruct_AddMethod($struct, 'OnRenderThreadCreated', 		'__CefRenderProcessHandler__ORTC')
	CefStruct_AddMethod($struct, 'OnWebKitInitialized', 		'__CefRenderProcessHandler__OWKI')
	CefStruct_AddMethod($struct, 'OnBrowserCreated', 			'__CefRenderProcessHandler__OBC')
	CefStruct_AddMethod($struct, 'OnBrowserDestroyed', 			'__CefRenderProcessHandler__OBD')
	CefStruct_AddMethod($struct, 'GetLoadHandler', 				'__CefRenderProcessHandler__GLH')
	CefStruct_AddMethod($struct, 'OnBeforeNavigation', 			'__CefRenderProcessHandler__OBN')
	CefStruct_AddMethod($struct, 'OnContextCreated', 			'__CefRenderProcessHandler__OCC')
	CefStruct_AddMethod($struct, 'OnContextReleased', 			'__CefRenderProcessHandler__OCR')
	CefStruct_AddMethod($struct, 'OnUncaughtException', 		'__CefRenderProcessHandler__OUE')
	CefStruct_AddMethod($struct, 'OnFocusedNodeChanged', 		'__CefRenderProcessHandler__OFNC')
	CefStruct_AddMethod($struct, 'OnProcessMessageReceived', 	'__CefRenderProcessHandler__OPMR')

	return $struct
endfunc

func __CefRenderProcessHandler_ORTC($self, $func = null)
	if @NumParams == 1 then return $self.__ORTC

	$self.__ORTC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnRenderThreadCreated', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__ORTC)
endfunc

func __CefRenderProcessHandler_OWKI($self, $func = null)
	if @NumParams == 1 then return $self.__OWKI

	$self.__OWKI = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnWebKitInitialized', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OWKI)
endfunc

func __CefRenderProcessHandler_OBC($self, $func = null)
	if @NumParams == 1 then return $self.__OBC

	$self.__OBC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBrowserCreated', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OBC)
endfunc

func __CefRenderProcessHandler_OBD($self, $func = null)
	if @NumParams == 1 then return $self.__OBD

	$self.__OBD = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBrowserDestroyed', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OBD)
endfunc

func __CefRenderProcessHandler_GLH($self, $func = null)
	if @NumParams == 1 then return $self.__GLH

	$self.__GLH = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_GetLoadHandler', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__GLH)
endfunc

func __CefRenderProcessHandler_OBN($self, $func = null)
	if @NumParams == 1 then return $self.__OBN

	$self.__OBN = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBeforeNavigation', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OBN)
endfunc

func __CefRenderProcessHandler_OCC($self, $func = null)
	if @NumParams == 1 then return $self.__OCC

	$self.__OCC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnContextCreated', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OCC)
endfunc

func __CefRenderProcessHandler_OCR($self, $func = null)
	if @NumParams == 1 then return $self.__OCR

	$self.__OCR = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnContextReleased', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OCR)
endfunc

func __CefRenderProcessHandler_OUE($self, $func = null)
	if @NumParams == 1 then return $self.__OUE

	$self.__OUE = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnUncaughtException', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OUE)
endfunc

func __CefRenderProcessHandler_OFNC($self, $func = null)
	if @NumParams == 1 then return $self.__OFNC

	$self.__OFNC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnFocusedNodeChanged', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OFNC)
endfunc

func __CefRenderProcessHandler_OPMR($self, $func = null)
	if @NumParams == 1 then return $self.__OPMR

	$self.__OPMR = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnProcessMessageReceived', 'ptr', $self.__pointer__, 'ptr', $__CefRenderProcessHandler__OPMR)
endfunc

; ==================================================

func __CefRenderProcessHandler__ORTC($self, $extra_info)
	$self 		= CefRenderProcessHandler_Create($self)
	;$extra_info = CefListValue_Create($extra_info)

	call($self.__ORTC, $self, $extra_info)
endfunc

func __CefRenderProcessHandler__OWKI($self)
	$self = CefRenderProcessHandler_Create($self)

	call($self.__OWKI, $self)
endfunc

func __CefRenderProcessHandler__OBC($self, $browser)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	call($self.__OBC, $self, $browser)
endfunc

func __CefRenderProcessHandler__OBD($self, $browser)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	call($self.__OBC, $self, $browser)
endfunc

func __CefRenderProcessHandler__GLH($self)
	$self 		= CefRenderProcessHandler_Create($self)

	return call($self.__GLH, $self)
endfunc

func __CefRenderProcessHandler__OBN($self, $browser, $frame, $request, $navigation_type, $is_redirect)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$request 	= CefRequest_Create($request)

	return call($self.__OBN, $self, $browser, $frame, $request, $navigation_type, $is_redirect)
endfunc

func __CefRenderProcessHandler__OCC($self, $browser, $frame, $context)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)

	call($self.__OCC, $self, $browser, $frame, $context)
endfunc

func __CefRenderProcessHandler__OCR($self, $browser, $frame, $context)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)

	call($self.__OCR, $self, $browser, $frame, $context)
endfunc

func __CefRenderProcessHandler__OUE($self, $browser, $frame, $context, $exception, $stackTrace)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$context 	= CefV8Context_Create($context)
	;$exception 	= CefV8Exception_Create($exception)
	;$stackTrace	= CefV8StackTrace_Create($stackTrace)

	call($self.__OUE, $self, $browser, $frame, $context, $exception, $stackTrace)
endfunc

func __CefRenderProcessHandler__OFNC($self, $browser, $frame, $node)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	;$node 		= CefDOMNode_Create($node)

	call($self.__OFNC, $self, $browser, $frame, $node)
endfunc

func __CefRenderProcessHandler__OPMR($self, $browser, $source_process, $message)
	$self 		= CefRenderProcessHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	;$message 	= CefProcessMessage_Create($message)

	return call($self.__OPMR, $self, $browser, $source_process, $message)
endfunc