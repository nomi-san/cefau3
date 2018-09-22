#cs
	file: api/life_span_handler.au3
	author: wuuyi123
#ce

global $tag_CefLifeSpanHandler = $tag_CefBase & _
	'ptr __OBP;' & _
	'ptr __OAC;' & _
	'ptr __DC;' & _
	'ptr __OBC;'

global $__params_OnBeforePopup = 'ptr;ptr;ptr;ptr;ptr;int;ptr;ptr;ptr;ptr;ptr', _
	$__return_OnBeforePopup = 'int'

global $__params_OnAfterCreated = 'ptr;ptr', _
	$__return_OnAfterCreated = 'none'

global $__params_DoClose = 'ptr;ptr', _
	$__return_DoClose = 'int'

global $__params_OnBeforeClose = 'ptr;ptr', _
	$__return_OnBeforeClose = 'none'

Func CefLifeSpanHandler_Create()
;~ 	Local $ret = DllCall($__Cefau3Dll__, 'ptr:cdecl', 'CefLifeSpanHandler_Create')
;~ 	Return @error ? 0 : $ret[0]
	local $struct = _AutoItObject_DllStructCreate($tag_CefLifeSpanHandler)
	$struct.size = Cef_StructSize(15);

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddMethod($struct, 'OnBeforePopup', '__CefLifeSpanHandler_OBP')
	_AutoItObject_AddMethod($struct, 'OnAfterCreated', '__CefLifeSpanHandler_OAC')
	_AutoItObject_AddMethod($struct, 'DoClose', '__CefLifeSpanHandler_DC')
	_AutoItObject_AddMethod($struct, 'OnBeforeClose', '__CefLifeSpanHandler_OBC')

	return $struct
EndFunc

func __CefLifeSpanHandler_OBP($self, $func = null)
	if @NumParams == 1 then return $self.__OBP

	local $cb = dllcallbackregister($func, $__return_OnBeforePopup, $__params_OnBeforePopup)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforePopup', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLifeSpanHandler_OAC($self, $func = null)
	if @NumParams == 1 then return $self.__OAC

	local $cb = dllcallbackregister($func, $__return_OnAfterCreated, $__params_OnAfterCreated)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnAfterCreated', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLifeSpanHandler_DC($self, $func = null)
	if @NumParams == 1 then return $self.__DC

    local $cb = dllcallbackregister($func, $__return_DoClose, $__params_DoClose)
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_DoClose', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefLifeSpanHandler_OBC($self, $func = null)
	if @NumParams == 1 then return $self.__OBC

    local $cb = dllcallbackregister($func, $__return_OnBeforeClose, $__params_OnBeforeClose)
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforeClose', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc