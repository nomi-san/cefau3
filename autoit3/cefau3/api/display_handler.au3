#cs
	file: api/display_handler.au3
	author: wuuyi123
#ce

; CefDisplayHandler
; ==================================================

global $tag_CefDiaplayHandler = ( _
	$tag_CefBase & _
	'ptr __OAC;' & _
	'ptr __OTC;' & _
	'ptr __OFUC;' & _
	'ptr __OFMC;' & _
	'ptr __OT;' & _
	'ptr __OSM;' & _
	'ptr __OCM;' _
)

global $__params_OnAddressChange = 'ptr;ptr;ptr;ptr', _
	$__return_OnAddressChange = 'none'

global $__params_OnTitleChange = 'ptr;ptr;ptr', _
	$__return_OnTitleChange = 'none'

global $__params_OnFaviconUrlChange = 'ptr;ptr;ptr', _
	$__return_OnFaviconUrlChange = 'none'

global $__params_OnFullscreenModeChange = 'ptr;ptr;int', _
	$__return_OnFullscreenModeChange = 'none'

global $__params_OnTooltip = 'ptr;ptr;ptr', _
	$__return_OnTooltip = 'int'

global $__params_OnStatusMessage = 'ptr;ptr;ptr', _
	$__return_OnStatusMessage = 'none'

global $__params_OnConsoleMessage = 'ptr;ptr;ptr;ptr;int', _
	$__return_OnConsoleMessage = 'int'

func CefDisplayHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefDiaplayHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefDiaplayHandler)
	$struct.size = $struct.__size__

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefDisplayHandler')

	_AutoItObject_AddMethod($struct, 'OnAddressChange', '__CefDisplayHandler_OAC')
    _AutoItObject_AddMethod($struct, 'OnTitleChange', '__CefDisplayHandler_OTC')
    _AutoItObject_AddMethod($struct, 'OnFaviconUrlChange', '__CefDisplayHandler_OFUC')
    _AutoItObject_AddMethod($struct, 'OnFullscreenModeChange', '__CefDisplayHandler_OFMC')
    _AutoItObject_AddMethod($struct, 'OnTooltip', '__CefDisplayHandler_OT')
    _AutoItObject_AddMethod($struct, 'OnStatusMessage', '__CefDisplayHandler_OSM')
    _AutoItObject_AddMethod($struct, 'OnConsoleMessage', '__CefDisplayHandler_OCM')

	return $struct
endfunc

func __CefDisplayHandler_OAC($self, $func = null)
	if @NumParams == 1 then return $self.__OAC

	local $cb = dllcallbackregister($func, $__return_OnAddressChange, $__params_OnAddressChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnAddressChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OTC($self, $func = null)
	if @NumParams == 1 then return $self.__OTC

	local $cb = dllcallbackregister($func, $__return_OnTitleChange, $__params_OnTitleChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnTitleChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OFUC($self, $func = null)
	if @NumParams == 1 then return $self.__OFUC

	local $cb = dllcallbackregister($func, $__return_OnFaviconUrlChange, $__params_OnFaviconUrlChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnFaviconUrlChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OFMC($self, $func = null)
	if @NumParams == 1 then return $self.__OFMC

	local $cb = dllcallbackregister($func, $__return_OnFullscreenModeChange, $__params_OnFullscreenModeChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnFullscreenModeChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OT($self, $func = null)
	if @NumParams == 1 then return $self.__OT

	local $cb = dllcallbackregister($func, $__return_OnTooltip, $__params_OnTooltip)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnTooltip', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OSM($self, $func = null)
	if @NumParams == 1 then return $self.__OSM

	local $cb = dllcallbackregister($func, $__return_OnStatusMessage, $__params_OnStatusMessage)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnStatusMessage', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefDisplayHandler_OCM($self, $func = null)
	if @NumParams == 1 then return $self.__OCM

	local $cb = dllcallbackregister($func, $__return_OnConsoleMessage, $__params_OnConsoleMessage)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnConsoleMessage', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc