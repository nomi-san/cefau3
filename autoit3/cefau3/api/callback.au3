#cs
	file: api/callback.au3
	author: wuuyi123
#ce

; CefCallback
; ==================================================

global $__CefCallback = null

; ==================================================

func CefCallback_Create($ptr)
	if ($__CefCallback == null) then
		$__CefCallback = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefCallback, '__ptr')
		_AutoItObject_AddProperty($__CefCallback, '__type', 1, 'CefCallback')

		_AutoItObject_AddMethod($__CefCallback, 'Continue', '__CefCallback_Continue')
		_AutoItObject_AddMethod($__CefCallback, 'Cancel', '__CefCallback_Cancel')
	endif

	local $self = _AutoItObject_Create($__CefCallback)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefCallback_Continue($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCallback_Continue', 'ptr', $self.__ptr)
endfunc

func __CefCallback_Cancel($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefCallback_Cancel', 'ptr', $self.__ptr)
endfunc

; CefCompletionCallback
; ==================================================

global $__CefCompletionCallback = null

; ==================================================

func CefCompletionCallback_Create($ptr = null)
	if ($__CefCompletionCallback == null) then
		$__CefCompletionCallback = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefCompletionCallback, '__ptr')
		_AutoItObject_AddProperty($__CefCompletionCallback, '__type', 1, 'CefCompletionCallback')

		_AutoItObject_AddMethod($__CefCompletionCallback, 'Continue', 	'CefCompletionCallback_Continue')
		_AutoItObject_AddMethod($__CefCompletionCallback, 'Cancel', 'CefCompletionCallback_Cancel')
	endif

	local $self = _AutoItObject_Create($__CefCompletionCallback)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefCompletionCallback_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefAccessibilityHandler_OATC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefAccessibilityHandler_Get_OATC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_Set_OATC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefAccessibilityHandler_OATC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefAccessibilityHandler__OATC : null)
endfunc


CEFAU3API void CefCompletionCallback_OnComplete(struct _cef_completion_callback_t* self, void *p)
{
	self->on_complete = p;
}