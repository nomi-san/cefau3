#cs
	file: api/accessibility_handler.au3
	author: wuuyi123
#ce

; CefAccessibilityHandler
; ==================================================

global $tag_CefAccessibilityHandler = ( _
    $tag_CefBase & _
    'ptr __OATC;' & _ ; on_accessibility_tree_change
    'ptr __OALC;' _ ;on_accessibility_location_change
)

global $__params_OnAccessibilityTreeChange = 'ptr;ptr', _
	$__return_OnAccessibilityTreeChange = 'none'

global $__params_OnAccessibilityLocationChange = 'ptr;ptr', _
	$__return_OnAccessibilityLocationChange = 'none'

func CefAccessibilityHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefAccessibilityHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefAccessibilityHandler)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefAccessibilityHandler')

	_AutoItObject_AddMethod($struct, 'OnBeforePopup', '__CefLifeSpanHandler_OBP')
	_AutoItObject_AddMethod($struct, 'OnAfterCreated', '__CefLifeSpanHandler_OAC')
	_AutoItObject_AddMethod($struct, 'DoClose', '__CefLifeSpanHandler_DC')
	_AutoItObject_AddMethod($struct, 'OnBeforeClose', '__CefLifeSpanHandler_OBC')

	return $struct
endfunc

func __CefAccessibilityHandler_OATC($self, $func = null)
	if @NumParams == 1 then return $self.__OATC

	local $cb = dllcallbackregister($func, $__return_OnAccessibilityTreeChange, $__params_OnAccessibilityTreeChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OnAccessibilityTreeChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefAccessibilityHandler_OALC($self, $func = null)
	if @NumParams == 1 then return $self.__OALC

	local $cb = dllcallbackregister($func, $__return_OnAccessibilityLocationChange, $__params_OnAccessibilityLocationChange)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OnAccessibilityLocationChange', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc