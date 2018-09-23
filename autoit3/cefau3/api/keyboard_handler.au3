#cs
	file: api/keyboard_handler.au3
	author: wuuyi123
#ce

; CefKeyboardHandler
; ==================================================

global $tag_CefKeyboardHandler = ( _
	$tag_CefBase & _
	'ptr __OPKE;' & _
	'ptr __OKE;' _
)

global $__params_CefKeybordHandler_OnPreKeyEvent = 'ptr;ptr;ptr;ptr;ptr', _
	$__return_CefKeybordHandler_OnPreKeyEvent = 'int'

global $__params_CefKeybordHandler_OnKeyEvent = 'ptr;ptr;ptr;ptr', _
	$__return_CefKeybordHandler_OnKeyEvent = 'int'

Func CefKeyboardHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefKeyboardHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefKeyboardHandler)
	$struct.size = $struct.__size__

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefKeyboardHandler')

	_AutoItObject_AddMethod($struct, 'OnPreKeyEvent', '__CefKeyboardHandler_OPKE')
	_AutoItObject_AddMethod($struct, 'OnKeyEvent', '__CefKeyboardHandler_OKE')

	return $struct
EndFunc

func __CefKeyboardHandler_OPKE($self, $func)
	if @NumParams == 1 then return $self.__OPKE

	local $cb = dllcallbackregister($func, $__return_CefKeybordHandler_OnPreKeyEvent, $__params_CefKeybordHandler_OnPreKeyEvent)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnPreKeyEvent', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefKeyboardHandler_OKE($self, $func)
	if @NumParams == 1 then return $self.__OKE

	local $cb = dllcallbackregister($func, $__return_CefKeybordHandler_OnKeyEvent, $__params_CefKeybordHandler_OnKeyEvent)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnKeyEvent', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc