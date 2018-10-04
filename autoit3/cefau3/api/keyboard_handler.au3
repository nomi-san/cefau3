#cs
	file: api/keyboard_handler.au3
	author: wuuyi123
#ce

#include-once

; CefKeyboardHandler
; ==================================================

global $tag_CefKeyboardHandler = ( _
	$tag_CefBase 		& _
	'ptr[2];'			& _
	'char __OPKE[100];' & _
	'char __OKE[100];' 	_
)

global $__CefKeyboardHandler__OPKE 	= Cef_CallbackRegister(__CefKeyboardHandler__OPKE, 	'int', 'ptr;ptr;ptr;ptr;ptr')
global $__CefKeyboardHandler__OKE 	= Cef_CallbackRegister(__CefKeyboardHandler__OKE, 	'int', 'ptr;ptr;ptr;ptr')

; ==================================================

Func CefKeyboardHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefKeyboardHandler, 'CefKeyboardHandler', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'OnPreKeyEvent', 	'__CefKeyboardHandler_OPKE')
	CefStruct_AddMethod($struct, 'OnKeyEvent', 		'__CefKeyboardHandler_OKE')

	return $struct
EndFunc

func __CefKeyboardHandler_OPKE($self, $func)
	if @NumParams == 1 then return $self.__OPKE

	$self.__OPKE = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnPreKeyEvent', 'ptr', $self.__pointer__, 'ptr', $__CefKeyboardHandler__OPKE)
endfunc

func __CefKeyboardHandler_OKE($self, $func)
	if @NumParams == 1 then return $self.__OKE

	$self.__OKE = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefKeyboardHandler_OnKeyEvent', 'ptr', $self.__pointer__, 'ptr', $__CefKeyboardHandler__OKE)
endfunc

; ==================================================

func __CefKeyboardHandler__OPKE($self, $browser, $event, $os_event, $is_keyboard_shortcut)
	$self 		= CefKeyboardHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	;$event 	=
	;$os_event 	=
	;$is_keyboard_shortcut =

	return call($self.__OPKE, $self, $browser, $event, $os_event, $is_keyboard_shortcut)
endfunc

func __CefKeyboardHandler__OKE($self, $browser, $event, $os_event)
	$self 		= CefKeyboardHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	;$event 	=
	;$os_event 	=

	return call($self.__OKE, $self, $browser, $event, $os_event)
endfunc