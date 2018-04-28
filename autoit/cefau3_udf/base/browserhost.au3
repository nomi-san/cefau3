#include-once

;		 _                           _
;		| |_ __ ___ _ _ _ ___ ___ __| |_ ___ ___ __
;		| _ | _| _ | | | |_ -| -_| _|   | _ |_ -|_ |
;		|___|_||___|_____|___|___|_||_|_|___|___||_|
;

; Start download a file with URL.
Func CefBrowserHost_StartDownload($CefBrowserHost, $sURL)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_StartDownload', 'ptr', $CefBrowserHost, 'wstr', $sURL)
	If @error Then Return 0
	Return 1
EndFunc

; Close dev tools.
Func CefBrowserHost_CloseDevTools($CefBrowserHost)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_CloseDevTools', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return 1
EndFunc

; Close browser, force close if needed.
Func CefBrowserHost_CloseBrowser($CefBrowserHost, $bForce)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_CloseBrowser', 'ptr', $CefBrowserHost, 'bool', $bForce)
	If @error Then Return 0
	Return 1
EndFunc

; Add a word to dictionary to fix grammar.
Func CefBrowserHost_AddWordToDictionary($CefBrowserHost, $sWord)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_AddWordToDictionary', 'ptr', $CefBrowserHost, 'wstr', $sWord)
	If @error Then Return 0
	Return 1
EndFunc

; Find text.
Func CefBrowserHost_Find($CefBrowserHost, $ID, $sText, $bForward = True, $bMatchcase = False, $bNext = True)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_Find', 'ptr', $CefBrowserHost, 'int', $ID, 'wstr', $sText, 'bool', $bForward, 'bool', $bMatchcase,'bool', $bNext)
	If @error Then Return 0
	Return 1
EndFunc

; Get browser => CefBrowser.
Func CefBrowserHost_GetBrowser($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefBrowserHost_GetBrowser', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get opener window handle => HWND.
Func CefBrowserHost_GetOpenerWindowHandle($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'hwnd', 'CefBrowserHost_GetOpenerWindowHandle', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get window handle, it's CEF window => HWND.
Func CefBrowserHost_GetWindowHandle($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'hwnd', 'CefBrowserHost_GetWindowHandle', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get window frame rate => int.
Func CefBrowserHost_GetWindowlessFrameRate($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefBrowserHost_GetWindowlessFrameRate', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get zoom level => double.
Func CefBrowserHost_GetZoomLevel($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'double', 'CefBrowserHost_GetZoomLevel', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; If exist dev tools => bool.
Func CefBrowserHost_HasDevTools($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowserHost_HasDevTools', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; If exist view control => bool.
Func CefBrowserHost_HasView($CefBrowserHost)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowserHost_HasView', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Print.
Func CefBrowserHost_Print($CefBrowserHost)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_Print', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return 1
EndFunc

; Stop finding.
Func CefBrowserHost_StopFinding($CefBrowserHost, $bClearSelection)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_StopFinding', 'ptr', $CefBrowserHost, 'bool', $bClearSelection)
	If @error Then Return 0
	Return 1
EndFunc

; Try close browser.
Func CefBrowserHost_TryCloseBrowser($CefBrowserHost, $bClearSelection)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_TryCloseBrowser', 'ptr', $CefBrowserHost)
	If @error Then Return 0
	Return 1
EndFunc

; Set zoom level.
Func CefBrowserHost_SetZoomLevel($CefBrowserHost, $ZoomLevel)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_SetZoomLevel', 'ptr', $CefBrowserHost, 'double', $ZoomLevel)
	If @error Then Return 0
	Return 1
EndFunc

; Show dev tools.
Func CefBrowserHost_ShowDevTools($CefBrowserHost, $hParent, $sWinName, $iLeft, $iTop, $iPointer_X, $iPointer_Y)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_ShowDevTools', 'ptr', $CefBrowserHost, 'hwnd', $hParent, _
			'wstr', $sWinName, 'int', $iLeft, 'int', $iTop, 'int', $iPointer_X, 'int', $iPointer_Y)
	If @error Then Return 0
	Return 1
EndFunc

; Set windowless frame rate.
Func CefBrowserHost_SetWindowlessFrameRate($CefBrowserHost, $iFramerate)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_SetWindowlessFrameRate', 'ptr', $CefBrowserHost, 'int', $iFramerate)
	If @error Then Return 0
	Return 1
EndFunc

; Set focus.
Func CefBrowserHost_SetFocus($CefBrowserHost, $bFocus)
	DllCall($__handle__Cefau3, 'none', 'CefBrowserHost_SetFocus', 'ptr', $CefBrowserHost, 'bool', $bFocus)
	If @error Then Return 0
	Return 1
EndFunc