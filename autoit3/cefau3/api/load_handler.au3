#cs
	file: api/load_handler.au3
	author: wuuyi123
#ce

#include-once

; CefLoadHandler
; ==================================================

global $tag_CefLoadHandler = ( _
    $tag_CefBase & 'ptr;ptr;ptr;' & _
    'char __OLSC[100];' & _ ; on_loading_state_change
    'char __OLS[100];' 	& _ ; on_load_start
    'char __OLEn[100];' & _ ; on_load_end
    'char __OLEr[100];' _ 	; on_load_error
)

global $__CefLoadHandler__OLSC 	= Cef_CallbackRegister(__CefLoadHandler__OLSC, 	'none', 'ptr;ptr;int;int;int')
global $__CefLoadHandler__OLS 	= Cef_CallbackRegister(__CefLoadHandler__OLS, 	'none', 'ptr;ptr;ptr;int')
global $__CefLoadHandler__OLEn 	= Cef_CallbackRegister(__CefLoadHandler__OLEn, 	'none', 'ptr;ptr;ptr;int')
global $__CefLoadHandler__OLEr 	= Cef_CallbackRegister(__CefLoadHandler__OLEr, 	'none', 'ptr;ptr;ptr;int;ptr;ptr')

; ==================================================

func CefLoadHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefLoadHandler, 'CefLoadHandler', $ptr)
	$struct.size = $struct.__size__;

	CefStruct_AddMethod($struct, 'OnLoadingStateChange', 	'__CefLoadHandler_OLSC')
	CefStruct_AddMethod($struct, 'OnLoadStart', 			'__CefLoadHandler_OLS')
	CefStruct_AddMethod($struct, 'OnLoadEnd', 				'__CefLoadHandler_OLEn')
	CefStruct_AddMethod($struct, 'OnLoadError', 			'__CefLoadHandler_OLEr')

	return $struct
endfunc

func __CefLoadHandler_OLSC($self, $func = null)
	if @NumParams == 1 then return $self.__OLSC

	$self.__OLSC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadingStateChange', 'ptr', $self.__pointer__, 'ptr', $__CefLoadHandler__OLSC)
endfunc

func __CefLoadHandler_OLS($self,  $func = null)
	if @NumParams == 1 then return $self.__OLS

	$self.__OLS = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadStart', 'ptr', $self.__pointer__, 'ptr', $__CefLoadHandler__OLS)
endfunc

func __CefLoadHandler_OLEn($self,  $func = null)
	if @NumParams == 1 then return $self.__OLEn

	$self.__OLEn = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadEnd', 'ptr', $self.__pointer__, 'ptr', $__CefLoadHandler__OLEn)
endfunc

func __CefLoadHandler_OLEr($self,  $func = null)
	if @NumParams == 1 then return $self.__OLEr

	$self.__OLEr = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadError', 'ptr', $self.__pointer__, 'ptr', $__CefLoadHandler__OLEr)
endfunc

; ==================================================

func __CefLoadHandler__OLSC($self, $browser, $isLoading, $canGoBack, $canGoForward)
	$self 		= CefLoadHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	call($self.__OLSC, $self, $browser, $isLoading, $canGoBack, $canGoForward)
endfunc

func __CefLoadHandler__OLS($self, $browser, $frame, $transition_type)
	$self 		= CefLoadHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)

	call($self.__OLS, $self, $browser, $frame, $transition_type)
endfunc

func __CefLoadHandler__OLEn($self, $browser, $frame, $httpStatusCode)
	$self 		= CefLoadHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)

	call($self.__OLEn, $self, $browser, $frame, $httpStatusCode)
endfunc

func __CefLoadHandler__OLEr($self, $browser, $frame, $errorCode, $errorText, $failedUrl)
	$self 		= CefLoadHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	$frame 		= CefFrame_Create($frame)

	$errorText 	= CefString_Read($errorText)
	$failedUrl 	= CefString_Read($failedUrl)

	call($self.__OLEr, $self, $browser, $frame, $errorCode, $errorText, $failedUrl)
endfunc