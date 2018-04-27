#cs -------------------------------------------------------------------

Name:.............: Cefau3 - Chromium Embedded Frame Work for AutoIt3
AutoIt version:...: v3.3.14.5
Author:...........: wuuyi123
Page:.............: https://github.com/wy3/cefau3

program/
	|---app/...
	|	|---css/...			# style
	|	|---js/...			# javascript
	|	|---app.js			# app
	|	|---index.html		# index
	|
	|---cef/...				# resources
	|	|---locales/...
	|	|---libcef.dll		# libcef
	|	|---cefau3.dll		# cefau3
	|
	|---include/...			# autoit header
	|---main.au3			# main script

#ce -----------------------------------------------------------------

#include-once

Global Const $__dll__name = 'cefau3.dll'
Global $__handle__Cefau3 = Null
Global $__OnTooltip__param	 				= 'ptr;ptr;wstr',				$__OnTooltip__ret 					= 'bool'
Global $__OnDragEnter__param 				= 'ptr;ptr;ptr;int', 			$__OnDragEnter__ret 				= 'bool'
Global $__OnConsoleMessage__param			= 'ptr;ptr;wstr;wstr', 			$__OnConsoleMessage__ret 			= 'bool'
Global $__OnAfterCreated__param 			= 'ptr;ptr', 					$__OnAfterCreated__ret				= 'none'
Global $__OnBeforeClose__param 				= 'ptr;ptr', 					$__OnBeforeClose__ret				= 'none'
Global $__OnTitleChange__param 				= 'ptr;ptr;wstr', 				$__OnTitleChange__ret				= 'none'
Global $__OnDraggableRegionsChanged__param	= 'ptr;ptr', 					$__OnDraggableRegionsChanged__ret 	= 'none'
Global $__OnLoadError__param 				= 'ptr;ptr;ptr;int;wstr;wstr', 	$__OnLoadError__ret 				= 'none'
Global $__OnLoadEnd__param 					= 'ptr;ptr;ptr;int', 			$__OnLoadEnd__ret 					= 'none'
Global $__OnLoadStart__param				= 'ptr;ptr;ptr;int',	 		$__OnLoadStart__ret 				= 'none'
Global $__OnLoadingStateChange__param		= 'ptr;ptr;bool;bool;bool',		$__OnLoadingStateChange__ret 		= 'none'
Global $__OnStatusMessage__param			= 'ptr;ptr;wstr', 				$__OnStatusMessage__ret 			= 'none'
Global $__OnFullscreenModeChange__param		= 'ptr;ptr;bool',				$__OnFullscreenModeChange__ret		= 'none'
Global $__OnFaviconURLChange__param			= 'ptr;ptr;wstr',				$__OnFaviconURLChange__ret			= 'none'
Global $__OnAddressChange__param			= 'ptr;ptr;ptr;wstr', 			$__OnAddressChange__ret				= 'none'
Global $__OnBeforeContextMenu__param		= 'ptr;ptr;ptr;ptr;ptr', 		$__OnBeforeContextMenu__ret			= 'none'
Global $__OnKeyEvent__param,												$__OnKeyEvent__ret					= 'none'
Global $__OnPreKeyEvent__param,					 							$__OnPreKeyEvent__ret				= 'none'

; Include function for call class pointer.
#include "base/browser.au3"
#include "base/browserhost.au3"
#include "base/contextmenuparam.au3"
#include "base/dragdata.au3"
#include "base/frame.au3"
#include "base/menumodel.au3"
#include "base/v8context.au3"
#include "base/v8value.au3"

Func Cef_Start($CefLibraryDir = @ScriptDir & '\cef')
	DllCall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', $CefLibraryDir)
	Local $hRet = DllOpen($__dll__name)
	DllCall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', @ScriptDir)
	If @error Or ($hRet == -1) Then Return 0
	$__handle__Cefau3 = $hRet
	Return 1
EndFunc

Func Cef_EnableHighDPI()
	DllCall($__handle__Cefau3, 'none', 'Cef_EnableHighDPI')
EndFunc

Func Cef_Init($hInstance = Null)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_Init', 'handle', $hInstance)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func Cef_Create(Byref $Cef, $hParent, $sURL, $iLeft = 0, $iTop = 0, $iWidth = 0, $iHeight = 0)
	; Byref $Cef to fix some bug.
	If Not $__handle__Cefau3 Then Return 0
	If Not $Cef Then Return 0
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_Create', 'ptr', $Cef, 'hwnd', $hParent, 'wstr', $sURL, 'int', $iLeft, 'int', $iTop, 'int', $iWidth, 'int', $iHeight)
	If @error Then Return 0
	$Cef = $aRet[0]
	Return 1
EndFunc

Func Cef_CreatePopup(Byref $Cef, $hParent, $sURL, $sName)
	If Not $__handle__Cefau3 Then Return 0
	If Not $Cef Then Return 0
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_CreatePopup', 'ptr', $Cef, 'hwnd', $hParent, 'wstr', $sURL, 'wstr', $sName)
	If @error Then Return 0
	$Cef = $aRet[0]
	Return 1
EndFunc

Func Cef_GetHandle($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'hwnd', 'Cef_GetHandle', 'ptr', $Cef)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func Cef_GetMainInstance()
	Local $aRet = DllCall($__handle__Cefau3, 'handle', 'Cef_GetMainInstance')
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func Cef_ExitMessageLoop($iExitCode = 0)
	DllCall($__handle__Cefau3, 'none', 'Cef_ExitMessageLoop', 'int', $iExitCode)
EndFunc

Func Cef_GoBack($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_GoBack', 'ptr', $Cef)
EndFunc

Func Cef_GoForward($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_GoForward', 'ptr', $Cef)
EndFunc

Func Cef_CanGoBack($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_CanGoBack', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

Func Cef_CanGoForward($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_CanGoForward', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

Func Cef_Reload($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Reload', 'ptr', $Cef)
EndFunc

Func Cef_StopLoad($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_StopLoad', 'ptr', $Cef)
EndFunc

Func Cef_LoadURL($Cef, $sURL)
	DllCall($__handle__Cefau3, 'none', 'Cef_LoadURL', 'ptr', $Cef, 'wstr', $sURL)
EndFunc

Func Cef_GetURL($Cef, $sURL)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'Cef_LoadURL', 'ptr', $Cef)
	Return @error ? '' : $aRet[0]
EndFunc

Func Cef_FullSize($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_FullSize', 'ptr', $Cef)
EndFunc

Func Cef_ExecuteJs($Cef, $sCode)
	DllCall($__handle__Cefau3, 'none', 'Cef_ExecuteJs', 'ptr', $Cef, 'wstr', $sCode)
EndFunc

Func Cef_Cut($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Cut', 'ptr', $Cef)
EndFunc

Func Cef_Copy($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Copy', 'ptr', $Cef)
EndFunc

Func Cef_Paste($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Paste', 'ptr', $Cef)
EndFunc

Func Cef_Delete($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Delete', 'ptr', $Cef)
EndFunc

Func Cef_Undo($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Undo', 'ptr', $Cef)
EndFunc

Func Cef_Redo($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Redo', 'ptr', $Cef)
EndFunc

Func Cef_SelectAll($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_SelectAll', 'ptr', $Cef)
EndFunc

Func Cef_ViewSource($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_ViewSource', 'ptr', $Cef)
EndFunc

Func Cef_GetName($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'Cef_GetName', 'ptr', $Cef)
	Return @error ? '' : $aRet[0]
EndFunc

Func Cef_IsFocused($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_IsFocused', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

Func Cef_IsMain($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_IsMain', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

Func Cef_IsValid($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_IsValid', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc


; Add Event Function
;///////////////////////////////////////////////////////////////////////////////////////////////////

Func Cef_OnTitleChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnTitleChange__ret, $__OnTitleChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnTitleChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnAfterCreated($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnAfterCreated__ret, $__OnAfterCreated__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnAfterCreated', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnBeforeClose($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnBeforeClose__ret, $__OnBeforeClose__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnBeforeClose', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnBeforeContextMenu($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnBeforeContextMenu__ret, $__OnBeforeContextMenu__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnBeforeContextMenu', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnPreKeyEvent($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnPreKeyEvent__ret, $__OnPreKeyEvent__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnPreKeyEvent', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnKeyEvent($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnKeyEvent__ret, $__OnKeyEvent__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnKeyEvent', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnAddressChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnAddressChange__ret, $__OnAddressChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnAddressChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnFaviconURLChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnFaviconURLChange__ret, $__OnFaviconURLChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnFaviconURLChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnFullscreenModeChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnFullscreenModeChange__ret, $__OnFullscreenModeChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnFullscreenModeChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnTooltip($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnTooltip__ret, $__OnTooltip__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnTooltip', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnStatusMessage($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnStatusMessage__ret, $__OnStatusMessage__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnStatusMessage', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnConsoleMessage($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnConsoleMessage__ret, $__OnConsoleMessage__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnConsoleMessage', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnLoadingStateChange($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadingStateChange__ret, $__OnLoadingStateChange__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadingStateChange', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnLoadStart($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadStart__ret, $__OnLoadStart__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadStart', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnLoadEnd($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadEnd__ret, $__OnLoadEnd__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadEnd', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnLoadError($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnLoadError__ret, $__OnLoadError__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnLoadError', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnDragEnter($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnDragEnter__ret, $__OnDragEnter__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnDragEnter', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

Func Cef_OnDraggableRegionsChanged($Cef, $sFunction)
	Local $hClb = DllCallbackRegister($sFunction, $__OnDraggableRegionsChanged__ret, $__OnDraggableRegionsChanged__param)
	If @error Then Return 0
	DllCall($__handle__Cefau3, 'none', 'Cef_OnDraggableRegionsChanged', 'ptr', $Cef, 'ptr', DllCallbackGetPtr($hClb))
	Return 1
EndFunc

