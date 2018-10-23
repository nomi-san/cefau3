#cs
	file: api/accessibility_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefAccessibilityHandler
; ==================================================

global $__CefAccessibilityHandler = null

$__CefAccessibilityHandler = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefAccessibilityHandler, '__ptr')
_AutoItObject_AddProperty($__CefAccessibilityHandler, '__type', 1, 'CefAccessibilityHandler')

_AutoItObject_AddMethod($__CefAccessibilityHandler, 'OnAccessibilityTreeChange', 	'__CefAccessibilityHandler_OATC')
_AutoItObject_AddMethod($__CefAccessibilityHandler, 'OnAccessibilityLocationChange', '__CefAccessibilityHandler_OALC')

global const $__CefAccessibilityHandler__OATC = Cef_CallbackRegister(__CefAccessibilityHandler__OATC, 'none', 'ptr;ptr')
global const $__CefAccessibilityHandler__OALC = Cef_CallbackRegister(__CefAccessibilityHandler__OALC, 'none', 'ptr;ptr')

; ==================================================

func CefAccessibilityHandler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefAccessibilityHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefAccessibilityHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefAccessibilityHandler_OATC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefAccessibilityHandler_Get_OATC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_Set_OATC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OATC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefAccessibilityHandler__OATC : null)
endfunc

func __CefAccessibilityHandler_OALC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefAccessibilityHandler_Get_OALC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_Set_OALC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OALC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefAccessibilityHandler__OALC : null)
endfunc

; ==================================================

func __CefAccessibilityHandler__OATC($self, $value)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefAccessibilityHandler_Get_OATC', 'ptr', $self)[0]
	;$value = CefValue_Create($value)

	call($self, $value)
endfunc

func __CefAccessibilityHandler__OALC($self, $value)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefAccessibilityHandler_Get_OALC', 'ptr', $self)[0]
	;$value = CefValue_Create($value)

	call($self, $value)
endfunc