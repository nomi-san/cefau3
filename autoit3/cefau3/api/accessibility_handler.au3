#cs
	file: api/accessibility_handler.au3
	author: wuuyi123
#ce

#include-once

; CefAccessibilityHandler
; ==================================================

global $tag_CefAccessibilityHandler = ( _
    $tag_CefBase 		& _
    'ptr[2];'			& _
    'char __OATC[100];' & _
    'char __OALC[100];' _
)

global $__CefAccessibilityHandler__OATC = Cef_CallbackRegister(__CefAccessibilityHandler__OATC, 'none', 'ptr;ptr')
global $__CefAccessibilityHandler__OALC = Cef_CallbackRegister(__CefAccessibilityHandler__OALC, 'none', 'ptr;ptr')

; ==================================================

func CefAccessibilityHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefAccessibilityHandler, 'CefAccessibilityHandler', $ptr)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefAccessibilityHandler')

	CefStruct_AddMethod($struct, 'OnAccessibilityTreeChange', 		'__CefAccessibilityHandler_OATC')
	CefStruct_AddMethod($struct, 'OnAccessibilityLocationChange', 	'__CefAccessibilityHandler_OALC')

	return $struct
endfunc

func __CefAccessibilityHandler_OATC($self, $func = null)
	if @NumParams == 1 then return $self.__OATC

	$self.__OATC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OnAccessibilityTreeChange', 'ptr', $self.__pointer__, 'ptr', $__CefAccessibilityHandler__OATC)
endfunc

func __CefAccessibilityHandler_OALC($self, $func = null)
	if @NumParams == 1 then return $self.__OALC

	$self.__OALC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OnAccessibilityLocationChange', 'ptr', $self.__pointer__, 'ptr', $__CefAccessibilityHandler__OALC)
endfunc

; ==================================================

func __CefAccessibilityHandler__OATC($self, $value)
	$self = CefAccessibilityHandler_Create($self)
	;$value = CefValue_Create($value)

	call($self.__OATC, $self, $value)
endfunc

func __CefAccessibilityHandler__OALC($self, $value)
	$self = CefAccessibilityHandler_Create($self)
	;$value = CefValue_Create($value)

	call($self.__OALC, $self, $value)
endfunc