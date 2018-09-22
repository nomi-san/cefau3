#cs
	file: api/display_handler.au3
	author: wuuyi123
#ce

Global $tag_CefDiaplayHandler = ( _
	$tag_CefBase & _
	'ptr OnAddressChange;' & _
	'ptr OnTitleChange;' & _
	'ptr OnFaviconUrlChange;' & _
	'ptr OnFullscreenModeChange;' & _
	'ptr OnTooltip;' & _
	'ptr OnStatusMessage;' & _
	'ptr OnConsoleMessage;' _
)

Global $__params_OnAddressChange = 'ptr;ptr;ptr;ptr', _
	$__return_OnAddressChange = 'none'

Global $__params_OnTitleChange = 'ptr;ptr;ptr', _
	$__return_OnTitleChange = 'none'

Global $__params_OnFaviconUrlChange = 'ptr;ptr;ptr', _
	$__return_OnFaviconUrlChange = 'none'

Global $__params_OnFullscreenModeChange = 'ptr;ptr;int', _
	$__return_OnFullscreenModeChange = 'none'

Global $__params_OnTooltip = 'ptr;ptr;ptr', _
	$__return_OnTooltip = 'int'

Global $__params_OnStatusMessage = 'ptr;ptr;ptr', _
	$__return_OnStatusMessage = 'none'

Global $__params_OnConsoleMessage = 'ptr;ptr;ptr;ptr;int', _
	$__return_OnConsoleMessage = 'int'

Func CefDisplayHandler_Create()
	Local $ret = DllCall($__Cefau3Dll__, 'ptr:cdecl', 'CefDisplayHandler_Create')
	Return @error ? 0 : $ret[0]
EndFunc

Func CefDisplayHandler_OnAddressChange($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnAddressChange, $__params_OnAddressChange)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnAddressChange', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc

Func CefDisplayHandler_OnTitleChange($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnTitleChange, $__params_OnTitleChange)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnTitleChange', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc

Func CefDisplayHandler_OnFaviconUrlChange($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnFaviconUrlChange, $__params_OnFaviconUrlChange)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnFaviconUrlChange', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc

Func CefDisplayHandler_OnFullscreenModeChange($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnFullscreenModeChange, $__params_OnFullscreenModeChange)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnFullscreenModeChange', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc

Func CefDisplayHandler_OnTooltip($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnTooltip, $__params_OnTooltip)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnTooltip', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc

Func CefDisplayHandler_OnStatusMessage($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnStatusMessage, $__params_OnStatusMessage)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnStatusMessage', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc


Func CefDisplayHandler_OnConsoleMessage($self, $func)
	Local $cb = DllCallbackRegister($func, $__return_OnConsoleMessage, $__params_OnConsoleMessage)
	If @error Then Return
	DllCall($__Cefau3Dll__, 'none:cdecl', 'CefDisplayHandler_OnConsoleMessage', 'ptr', $self, 'ptr', DllCallbackGetPtr($cb))
EndFunc