#cs
	file: api/life_span_handler.au3
	author: wuuyi123
#ce

; CefLifeSpanHandler
; ==================================================

global $tag_CefLifeSpanHandler = ( _
	$tag_CefBase & 'ptr;ptr;ptr;ptr;' & _
	'char __OBP[100];' 	& _
	'char __OAC[100];' 	& _
	'char __DC[100];' 	& _
	'char __OBC[100];' 	_
)

global $__Cef__OnBeforePopup 	= Cef_CallbackRegister(__Cef__OnBeforePopup, 'int', 'ptr;ptr;ptr;ptr;ptr;int;ptr;ptr;ptr;ptr;ptr')
global $__Cef__OnAfterCreated 	= Cef_CallbackRegister(__Cef__OnAfterCreated, 'none', 'ptr;ptr')
global $__Cef__DoClose 			= Cef_CallbackRegister(__Cef__DoClose, 'int', 'ptr;ptr')
global $__Cef__OnBeforeClose 	= Cef_CallbackRegister(__Cef__OnBeforeClose, 'none', 'ptr;ptr')

; ==================================================

func CefLifeSpanHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefLifeSpanHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefLifeSpanHandler)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefLifeSpanHandler')

	_AutoItObject_AddMethod($struct, 'OnBeforePopup', '__CefLifeSpanHandler_OBP')
	_AutoItObject_AddMethod($struct, 'OnAfterCreated', '__CefLifeSpanHandler_OAC')
	_AutoItObject_AddMethod($struct, 'DoClose', '__CefLifeSpanHandler_DC')
	_AutoItObject_AddMethod($struct, 'OnBeforeClose', '__CefLifeSpanHandler_OBC')

	return $struct
endfunc

func __CefLifeSpanHandler_OBP($self, $func = null)
	if @NumParams == 1 then return $self.__OBP

	$self.__OBP = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforePopup', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnBeforePopup)
endfunc

func __CefLifeSpanHandler_OAC($self, $func = null)
	if @NumParams == 1 then return $self.__OAC

	$self.__OAC = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnAfterCreated', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnAfterCreated)
endfunc

func __CefLifeSpanHandler_DC($self, $func = null)
	if @NumParams == 1 then return $self.__DC

	$self.__DC = $func
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_DoClose', 'ptr', $self.__pointer__, 'ptr', $__Cef__DoClose)
endfunc

func __CefLifeSpanHandler_OBC($self, $func = null)
	if @NumParams == 1 then return $self.__OBC

	$self.__OBC = $func
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforeClose', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnBeforeClose)
endfunc

; ==================================================

func __Cef__OnBeforePopup($self, $browser);, $frame, $target_url, $target_frame_name, $target_disposition, $windowInfo, $client, $settings, $no_javascript_access)
	$self = CefLifeSpanHandler_Create($self)
	$browser = CefBrowser_Create($browser)

	return call($self.__OBP, $self, $browser)
endfunc

func __Cef__OnAfterCreated($self, $browser)
	$self = CefLifeSpanHandler_Create($self)
	$browser = CefBrowser_Create($browser)

	call($self.__OAC, $self, $browser)
endfunc

func __Cef__DoClose($self, $browser)
	$self = CefLifeSpanHandler_Create($self)
	$browser = CefBrowser_Create($browser)

	return call($self.__DC, $self, $browser)
endfunc

func __Cef__OnBeforeClose($self, $browser)
	$self = CefLifeSpanHandler_Create($self)
	$browser = CefBrowser_Create($browser)

	call($self.__OBC, $self, $browser)
endfunc