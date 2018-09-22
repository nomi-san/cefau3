#cs
	file: api/keyboard_handler.au3
	author: wuuyi123
#ce

global $tag_CefKeyboardHandler = $tag_CefBase & 'ptr;ptr'

global $__params_CefKeybordHandler_OnPreKeyEvent = 'ptr;ptr;ptr;ptr;ptr', _
	$__return_CefKeybordHandler_OnPreKeyEvent = 'int'

global $__params_CefKeybordHandler_OnKeyEvent = 'ptr;ptr;ptr;ptr', _
	$__return_CefKeybordHandler_OnKeyEvent = 'int'

func CefKeyboardHandler_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefKeyboardHandler_Create')
	return @error ? 0 : $ret[0]
endfunc

func CefKeyboardHandler_OnPreKeyEvent($self, $func)
	local $cb = dllcallbackregister($func, $__return_CefKeybordHandler_OnPreKeyEvent, $__params_CefKeybordHandler_OnPreKeyEvent)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnPreKeyEvent', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc

func CefKeyboardHandler_OnKeyEvent($self, $func)
	local $cb = dllcallbackregister($func, $__return_CefKeybordHandler_OnKeyEvent, $__params_CefKeybordHandler_OnKeyEvent)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnKeyEvent', 'ptr', $self, 'ptr', dllcallbackgetptr($cb))
endfunc