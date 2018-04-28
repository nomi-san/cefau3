#include-once

; Please see example below, not change function parameters or return value!
;//////////////////////////////////////////////////////////////////////////


#cs
Cef_OnTitleChange($Cef, "_OnTitleChange")

Func _OnTitleChange($Cef, $CefBrowser, $sTitle)

	; $Cef for Cef_...($Cef, ...)
	; $CefBrowser for CefBrowser_...($CefBrowser, ...) see "browser.au3"
	; do something
	; this function no return value, use "Return" for end function

EndFunc
#ce -------------------------------------
Func Cef_OnTitleChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnTitleChange__ret, $__OnTitleChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnTitleChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc


#cs
Cef_OnAfterCreated($Cef, "_OnAfterCreated")

Func _OnAfterCreated($Cef, $CefBrowser)

	; do something

EndFunc
#ce -------------------------------------
Func Cef_OnAfterCreated($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnAfterCreated__ret, $__OnAfterCreated__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnAfterCreated', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnBeforeClose($Cef, "_OnBeforeClose")

Func _OnBeforeClose($Cef, $CefBrowser)

	; do something

EndFunc

#ce ------------------------------------
Func Cef_OnBeforeClose($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnBeforeClose__ret, $__OnBeforeClose__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnBeforeClose', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnBeforeContextMenu($Cef, "_OnBeforeContextMenu")

Func _OnBeforeContextMenu($Cef, $CefBrowser, $CefFrame, $CefContextMenuParam, $CefMenuModel)

	; do something

EndFunc

#ce -------------------------------------------
Func Cef_OnBeforeContextMenu($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnBeforeContextMenu__ret, $__OnBeforeContextMenu__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnBeforeContextMenu', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnPreKeyEvent($Cef, "_OnPreKeyEvent")

Func _OnPreKeyEvent($Cef, $CefBrowser, $sCharacter, $isSystemKey, $iNativeCode, $iWindowCode, $lpMSG, $isKeyShortcut)

	; do something
	;Return false

EndFunc

#ce ------------------------------------------------
Func Cef_OnPreKeyEvent($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnPreKeyEvent__ret, $__OnPreKeyEvent__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'bool', 'Cef_OnPreKeyEvent', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnKeyEvent($Cef, "_OnKeyEvent")

Func _OnKeyEvent($Cef, $CefBrowser, $sCharacter, $isSystemKey, $iNativeCode, $iWindowCode, $lpMSG)

	; do something
	;Return false

EndFunc

#ce ------------------------------------------------
Func Cef_OnKeyEvent($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnKeyEvent__ret, $__OnKeyEvent__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'bool', 'Cef_OnKeyEvent', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnAddressChange($Cef, "_OnAddressChange")

Func _OnAddressChange($Cef, $CefBrowser, $CefFrame, $sURL)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnAddressChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnAddressChange__ret, $__OnAddressChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnAddressChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnFaviconURLChange($Cef, "_OnFaviconURLChange")

Func _OnFaviconURLChange($Cef, $CefBrowser, $sIconURL)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnFaviconURLChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnFaviconURLChange__ret, $__OnFaviconURLChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnFaviconURLChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnFullscreenModeChange($Cef, "_OnFullscreenModeChange")

Func _OnFullscreenModeChange($Cef, $CefBrowser, $bFullScreen)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnFullscreenModeChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnFullscreenModeChange__ret, $__OnFullscreenModeChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnFullscreenModeChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnTooltip($Cef, "_OnTooltip")

Func _OnTooltip($Cef, $CefBrowser, $sTooltipText)

	; do something
	; Return false to allow the browser to display the tooltip

EndFunc

#ce ------------------------------------------------
Func Cef_OnTooltip($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnTooltip__ret, $__OnTooltip__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnTooltip', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnStatusMessage($Cef, "_OnStatusMessage")

Func _OnStatusMessage($Cef, $CefBrowser, $sStatusValue)

	; do something
	; Return true to stop the message from being output to the console

EndFunc

#ce ------------------------------------------------
Func Cef_OnStatusMessage($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnStatusMessage__ret, $__OnStatusMessage__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnStatusMessage', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnConsoleMessage($Cef, "_OnConsoleMessage")

Func _OnConsoleMessage($Cef, $CefBrowser, $sMessage, $sSource)

	; do something
	; Return true to stop the message from being output to the console

EndFunc

#ce ------------------------------------------------
Func Cef_OnConsoleMessage($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnConsoleMessage__ret, $__OnConsoleMessage__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnConsoleMessage', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnLoadingStateChange($Cef, "_OnLoadingStateChange")

Func _OnLoadingStateChange($Cef, $CefBrowser, $isLoading, $canGoBack, $canGoForward)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnLoadingStateChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadingStateChange__ret, $__OnLoadingStateChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadingStateChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnLoadStart($Cef, "_OnLoadStart")

Func _OnLoadStart($Cef, $CefBrowser, $CefDragData, $CefFrame, $iTransitionType)

	; $iTransitionType, see "constants.au3"
	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnLoadStart($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadStart__ret, $__OnLoadStart__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadStart', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnLoadEnd($Cef, "_OnLoadEnd")

Func _OnLoadEnd($Cef, $CefBrowser, $CefDragData, $CefFrame, $iHttpStatusCode)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnLoadEnd($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadEnd__ret, $__OnLoadEnd__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadEnd', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnLoadError($Cef, "_OnLoadError")

Func _OnLoadError($Cef, $CefBrowser, $CefFrame, $iErrorCode, $sErrorText, $sFailed_UEL)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnLoadError($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadError__ret, $__OnLoadError__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadError', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnDragEnter($Cef, "_OnDragEnter")

Func _OnDragEnter($Cef, $CefBrowser, $CefDragData, $iDragOperation)

	; $iDragOperation, see "constants.au3"
	; do something

	; Return true for cancel drag event

EndFunc

#ce ------------------------------------------------
Func Cef_OnDragEnter($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnDragEnter__ret, $__OnDragEnter__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnDragEnter', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

#cs

Cef_OnDraggableRegionsChanged($Cef, "_OnDraggableRegionsChanged")

Func _OnDraggableRegionsChanged($Cef, $CefBrowser)

	; do something

EndFunc

#ce ------------------------------------------------
Func Cef_OnDraggableRegionsChanged($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnDraggableRegionsChanged__ret, $__OnDraggableRegionsChanged__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnDraggableRegionsChanged', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc
