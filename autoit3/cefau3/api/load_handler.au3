#cs
	file: api/load_handler.au3
	author: wuuyi123
#ce

; CefLoadHandler
; ==================================================

global $tag_CefLoadHandler = ( _
    $tag_CefBase & _
    'ptr __OLSC;' & _ ; on_loading_state_change
    'ptr __OLS;' & _ ; on_load_start
    'ptr __OLEn;' & _ ; on_load_end
    'ptr __OLEr;' _ ; on_load_error
)

global $__params_OnLoadingStateChange = 'ptr;ptr;int;int;int', _
	$__return_OnLoadingStateChange = 'none'

global $__params_OnLoadStart = 'ptr;ptr;ptr;int', _
	$__return_OnLoadStart = 'none'

global $__params_OnLoadEnd = 'ptr;ptr;ptr;int', _
	$__return_OnLoadEnd = 'none'

global $__params_OnLoadError = 'ptr;ptr;ptr;int;ptr;ptr', _
	$__return_OnLoadError = 'none'

func CefLoadHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefLoadHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefLoadHandler)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefLoadHandler')

	_AutoItObject_AddMethod($struct, 'OnLoadingStateChange', '__CefLoadHandler_OLSCd')
	_AutoItObject_AddMethod($struct, 'OnLoadStart', '__CefLoadHandler_OLSd')
	_AutoItObject_AddMethod($struct, 'OnLoadEnd', '__CefLoadHandler_OLEnd')
	_AutoItObject_AddMethod($struct, 'OnLoadError', '__CefLoadHandler_OLErd')

	return $struct
endfunc

func __CefLoadHandler_OLSC($self, $func = null)
	if @NumParams == 1 then return $self.__OLSC

	local $cb = dllcallbackregister($func, $__return_OnLoadingStateChange, $__params_OnLoadingStateChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadingStateChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLoadHandler_OLS($self,  $func = null)
	if @NumParams == 1 then return $self.__OLS

	local $cb = dllcallbackregister($func, $__return_OnLoadStart, $__params_OnLoadStart)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadStart', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLoadHandler_OLEn($self,  $func = null)
	if @NumParams == 1 then return $self.__OLEn

	local $cb = dllcallbackregister($func, $__return_OnLoadEnd, $__params_OnLoadEnd)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadEnd', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLoadHandler_OLEr($self,  $func = null)
	if @NumParams == 1 then return $self.__OLEr

	local $cb = dllcallbackregister($func, $__return_OnLoadError, $__params_OnLoadError)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadError', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc