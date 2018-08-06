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
	|	|---autoitx3.dll	# autoitx3
	|	|---libcef.dll		# libcef
	|	|---cefau3.dll		# cefau3
	|
	|---include/...			# your autoit header
	|---cefau3/...			# cefau3 udf
	|	|---base/...
	|	|---cefau3.au3
	|
	|---main.au3			# main script

#ce -----------------------------------------------------------------

#include-once

Global Const $__dll__name = 'cefau3.dll'
Global $__handle__Cefau3 = Null
Global $__OnTooltip__param	 				= 'ptr;ptr;wstr',						$__OnTooltip__ret 					= 'bool'
Global $__OnDragEnter__param 				= 'ptr;ptr;ptr;int', 					$__OnDragEnter__ret 				= 'bool'
Global $__OnConsoleMessage__param			= 'ptr;ptr;wstr;wstr', 					$__OnConsoleMessage__ret 			= 'bool'
Global $__OnAfterCreated__param 			= 'ptr;ptr', 							$__OnAfterCreated__ret				= 'none'
Global $__OnBeforeClose__param 				= 'ptr;ptr', 							$__OnBeforeClose__ret				= 'none'
Global $__OnTitleChange__param 				= 'ptr;ptr;wstr', 						$__OnTitleChange__ret				= 'none'
Global $__OnDraggableRegionsChanged__param	= 'ptr;ptr', 							$__OnDraggableRegionsChanged__ret 	= 'none'
Global $__OnLoadError__param 				= 'ptr;ptr;ptr;int;wstr;wstr', 			$__OnLoadError__ret 				= 'none'
Global $__OnLoadEnd__param 					= 'ptr;ptr;ptr;int', 					$__OnLoadEnd__ret 					= 'none'
Global $__OnLoadStart__param				= 'ptr;ptr;ptr;int',	 				$__OnLoadStart__ret 				= 'none'
Global $__OnLoadingStateChange__param		= 'ptr;ptr;bool;bool;bool',				$__OnLoadingStateChange__ret 		= 'none'
Global $__OnStatusMessage__param			= 'ptr;ptr;wstr', 						$__OnStatusMessage__ret 			= 'none'
Global $__OnFullscreenModeChange__param		= 'ptr;ptr;bool',						$__OnFullscreenModeChange__ret		= 'none'
Global $__OnFaviconURLChange__param			= 'ptr;ptr;wstr',						$__OnFaviconURLChange__ret			= 'none'
Global $__OnAddressChange__param			= 'ptr;ptr;ptr;wstr', 					$__OnAddressChange__ret				= 'none'
Global $__OnBeforeContextMenu__param		= 'ptr;ptr;ptr;ptr;ptr', 				$__OnBeforeContextMenu__ret			= 'none'
Global $__OnKeyEvent__param					= 'ptr;ptr;byte;int;int;int;ptr',		$__OnKeyEvent__ret					= 'bool'
Global $__OnPreKeyEvent__param				= 'ptr;ptr;byte;int;int;int;ptr;bool',	$__OnPreKeyEvent__ret				= 'bool'

; Constants.
#include "base/constants.au3"

; Event.
#include "base/event.au3"

; Include function for call class pointer in C++.
#include "base/browser.au3"
#include "base/browserhost.au3"
#include "base/contextmenuparam.au3"
#include "base/dragdata.au3"
#include "base/frame.au3"
#include "base/menumodel.au3"

; Startup, load library from dll.
Func Cef_Start($CefLibraryDir = @ScriptDir & '\cef')
	DllCall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', $CefLibraryDir)
	Local $hRet = DllOpen($__dll__name)
	DllCall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', @ScriptDir)
	If @error Or ($hRet == -1) Then Return 0
	$__handle__Cefau3 = $hRet
	Return 1
EndFunc

; Enable hight DPI support, for win 7 or later.
Func Cef_EnableHighDPI()
	DllCall($__handle__Cefau3, 'none', 'Cef_EnableHighDPI')
EndFunc

; Initialaze to create Cef handler, return pointer of class.
Func Cef_Init($hInstance = Null)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_Init', 'handle', $hInstance)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Create Cef window as child, if position & size is zero, Cef will full size of client window.
Func Cef_Create(Byref $Cef, $hParent, $sURL, $iLeft = 0, $iTop = 0, $iWidth = 0, $iHeight = 0)
	; Byref $Cef to fix some bug.
	If Not $__handle__Cefau3 Then Return 0
	If Not $Cef Then Return 0
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_Create', 'ptr', $Cef, 'hwnd', $hParent, 'wstr', $sURL, 'int', $iLeft, 'int', $iTop, 'int', $iWidth, 'int', $iHeight)
	If @error Then Return 0
	$Cef = $aRet[0]
	Return 1
EndFunc

; Create Cef window as popup.
Func Cef_CreatePopup(Byref $Cef, $hParent, $sURL, $sName, $iLeft, $iTop, $iWidth, $iHeight)
	If Not $__handle__Cefau3 Then Return 0
	If Not $Cef Then Return 0
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'Cef_CreatePopup', 'ptr', $Cef, 'hwnd', $hParent, 'wstr', $sURL, 'wstr', $sName, $iLeft, 'int', $iTop, 'int', $iWidth, 'int', $iHeight)
	If @error Then Return 0
	$Cef = $aRet[0]
	Return 1
EndFunc

; Get handle of Cef window.
Func Cef_GetHandle($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'hwnd', 'Cef_GetHandle', 'ptr', $Cef)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get main instance from dll module.
Func Cef_GetMainInstance()
	Local $aRet = DllCall($__handle__Cefau3, 'handle', 'Cef_GetMainInstance')
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Exit message loop, some problem, it not work.
Func Cef_ExitMessageLoop($iExitCode = 0)
	DllCall($__handle__Cefau3, 'none', 'Cef_ExitMessageLoop', 'int', $iExitCode)
EndFunc

; Go back.
Func Cef_GoBack($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_GoBack', 'ptr', $Cef)
EndFunc

; Go forward.
Func Cef_GoForward($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_GoForward', 'ptr', $Cef)
EndFunc

; Can go back.
Func Cef_CanGoBack($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_CanGoBack', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

; Can go forward.
Func Cef_CanGoForward($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_CanGoForward', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

; Reload web page.
Func Cef_Reload($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Reload', 'ptr', $Cef)
EndFunc

; Stop load
Func Cef_StopLoad($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_StopLoad', 'ptr', $Cef)
EndFunc

; Load a URL.
Func Cef_LoadURL($Cef, $sURL)
	DllCall($__handle__Cefau3, 'none', 'Cef_LoadURL', 'ptr', $Cef, 'wstr', $sURL)
EndFunc

; Get current URL.
Func Cef_GetURL($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'Cef_GetURL', 'ptr', $Cef)
	Return @error ? '' : $aRet[0]
EndFunc

; Set full size with current parent window client.
Func Cef_FullSize($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_FullSize', 'ptr', $Cef)
EndFunc

; Execute JavaScript code in main frame.
Func Cef_ExecuteJs($Cef, $sCode)
	DllCall($__handle__Cefau3, 'none', 'Cef_ExecuteJs', 'ptr', $Cef, 'wstr', $sCode)
EndFunc

; Send cut.
Func Cef_Cut($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Cut', 'ptr', $Cef)
EndFunc

; Send copy.
Func Cef_Copy($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Copy', 'ptr', $Cef)
EndFunc

; Send paste.
Func Cef_Paste($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Paste', 'ptr', $Cef)
EndFunc

; Send delete.
Func Cef_Delete($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Delete', 'ptr', $Cef)
EndFunc

; Send undo.
Func Cef_Undo($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Undo', 'ptr', $Cef)
EndFunc

; Send redo.
Func Cef_Redo($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_Redo', 'ptr', $Cef)
EndFunc

; Send select all.
Func Cef_SelectAll($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_SelectAll', 'ptr', $Cef)
EndFunc

; View source code in current web page.
Func Cef_ViewSource($Cef)
	DllCall($__handle__Cefau3, 'none', 'Cef_ViewSource', 'ptr', $Cef)
EndFunc

; Get name.
Func Cef_GetName($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'Cef_GetName', 'ptr', $Cef)
	Return @error ? '' : $aRet[0]
EndFunc

; Is focus window.
Func Cef_IsFocused($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_IsFocused', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

; Is main framw window.
Func Cef_IsMain($Cef)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'Cef_IsMain', 'ptr', $Cef)
	Return @error ? 0 : $aRet[0]
EndFunc

#Region ; Require thread for multi-window (optional). If bug, please add Cef_RequireUI() in your function.

Func Cef_RequireUI()
	DllCall($__handle__Cefau3, 'none', 'Cef_RequireUI')
EndFunc

Func Cef_RequireFILE()
	DllCall($__handle__Cefau3, 'none', 'Cef_RequireFILE')
EndFunc

Func Cef_RequireIO()
	DllCall($__handle__Cefau3, 'none', 'Cef_RequireIO')
EndFunc

#EndRegion
