#cs
	file: api/keyboard_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefKeyboardHandler
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefKeyboardHandler')

	.AddMethod('OnPreKeyEvent', '__CefKeyboardHandler_OPKE')
	.AddMethod('OnKeyEvent', 	'__CefKeyboardHandler_OKE')

	global $__CefKeyboardHandler = .Object

endwith

global $__CefKeyboardHandler__OPKE 	= Cef_CallbackRegister(__CefKeyboardHandler__OPKE, 	'int', 'ptr;ptr;ptr;ptr;ptr')
global $__CefKeyboardHandler__OKE 	= Cef_CallbackRegister(__CefKeyboardHandler__OKE, 	'int', 'ptr;ptr;ptr;ptr')

; ==================================================

Func CefKeyboardHandler_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefKeyboardHandler_Create', 'idispatch', $__CefKeyboardHandler, 'ptr', $ptr)[0]
EndFunc

func __CefKeyboardHandler_OPKE($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefKeyboardHandler_Get_OPKE', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_Set_OPKE', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OPKE', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefKeyboardHandler__OPKE : null)
endfunc

func __CefKeyboardHandler_OKE($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefKeyboardHandler_Get_OKE', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_Set_OKE', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OKE', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefKeyboardHandler__OKE : null)
endfunc

; ==================================================

func __CefKeyboardHandler__OPKE($self, $browser, $event, $os_event, $is_keyboard_shortcut)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefKeyboardHandler_Get_OPKE', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$event 		= CefKeyEvent_Create($event)
	;$os_event 	=
	$is_keyboard_shortcut = CefInt_Create($is_keyboard_shortcut)

	return call($self, $browser, $event, $os_event, $is_keyboard_shortcut)
endfunc

func __CefKeyboardHandler__OKE($self, $browser, $event, $os_event)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefKeyboardHandler_Get_OKE', 'ptr', $self)[0]
	$browser 	= CefBrowser_Create($browser)
	$event 		= CefKeyEvent_Create($event)
	;$os_event 	=

	return call($self, $browser, $event, $os_event)
endfunc