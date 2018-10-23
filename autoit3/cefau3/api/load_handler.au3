#cs
	file: api/load_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefLoadHandler
; ==================================================

global $__CefLoadHandler = null

$__CefLoadHandler = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefLoadHandler, '__ptr')
_AutoItObject_AddProperty($__CefLoadHandler, '__type', 1, 'CefLoadHandler')

_AutoItObject_AddMethod($__CefLoadHandler, 'OnLoadingStateChange', 	'__CefLoadHandler_OLSC')
_AutoItObject_AddMethod($__CefLoadHandler, 'OnLoadStart', 			'__CefLoadHandler_OLS')
_AutoItObject_AddMethod($__CefLoadHandler, 'OnLoadEnd', 			'__CefLoadHandler_OLEn')
_AutoItObject_AddMethod($__CefLoadHandler, 'OnLoadError', 			'__CefLoadHandler_OLEr')

global $__CefLoadHandler__OLSC 	= Cef_CallbackRegister(__CefLoadHandler__OLSC, 	'none', 'ptr;ptr;int;int;int')
global $__CefLoadHandler__OLS 	= Cef_CallbackRegister(__CefLoadHandler__OLS, 	'none', 'ptr;ptr;ptr;int')
global $__CefLoadHandler__OLEn 	= Cef_CallbackRegister(__CefLoadHandler__OLEn, 	'none', 'ptr;ptr;ptr;int')
global $__CefLoadHandler__OLEr 	= Cef_CallbackRegister(__CefLoadHandler__OLEr, 	'none', 'ptr;ptr;ptr;int;ptr;ptr')

; ==================================================

func CefLoadHandler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefLoadHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefLoadHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefLoadHandler_OLSC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLSC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_Set_OLSC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OLSC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLoadHandler__OLSC : null)
endfunc

func __CefLoadHandler_OLS($self,  $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLS', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_Set_OLS', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OLS', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLoadHandler__OLS : null)
endfunc

func __CefLoadHandler_OLEn($self,  $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLEn', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_Set_OLEn', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OLEn', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLoadHandler__OLEn : null)
endfunc

func __CefLoadHandler_OLEr($self,  $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLEr', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_Set_OLEr', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OLEr', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLoadHandler__OLEr : null)
endfunc

; ==================================================

func __CefLoadHandler__OLSC($self, $browser, $isLoading, $canGoBack, $canGoForward)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLSC', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$isLoading 	= int($isLoading)
	$canGoBack 	= int($canGoBack)
	$canGoForward = int($canGoForward)

	call($self, $browser, $isLoading, $canGoBack, $canGoForward)
endfunc

func __CefLoadHandler__OLS($self, $browser, $frame, $transition_type)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLS', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	$transition_type = int($transition_type)

	call($self, $browser, $frame, $transition_type)
endfunc

func __CefLoadHandler__OLEn($self, $browser, $frame, $httpStatusCode)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLEn', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	$httpStatusCode = int($httpStatusCode)

	call($self, $browser, $frame, $httpStatusCode)
endfunc

func __CefLoadHandler__OLEr($self, $browser, $frame, $errorCode, $errorText, $failedUrl)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLoadHandler_Get_OLEr', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)
	$errorCode	= int($errorCode)
	$errorText 	= CefString_Create($errorText)
	$failedUrl 	= CefString_Create($failedUrl)

	call($self, $browser, $frame, $errorCode, $errorText, $failedUrl)
endfunc