#include-once

Func CefBrowser_CanGoBack($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowser_CanGoBack', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_CanGoForward($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowser_CanGoForward', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_StopLoad($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefBrowser_StopLoad', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return 1
EndFunc

Func CefBrowser_GoForward($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefBrowser_GoForward', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return 1
EndFunc

Func CefBrowser_GoBack($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefBrowser_GoBack', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return 0
EndFunc

Func CefBrowser_IsLoading($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowser_IsLoading', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_IsPopup($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowser_IsPopup', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_HasDocument($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefBrowser_HasDocument', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_Reload($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefBrowser_Reload', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return 0
EndFunc

Func CefBrowser_GetIdentifier($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefBrowser_GetIdentifier', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_ReloadIgnoreCache($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefBrowser_ReloadIgnoreCache', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return 1
EndFunc

Func CefBrowser_GetFrameCount($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefBrowser_GetFrameCount', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_GetHost($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefBrowser_GetHost', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefBrowser_GetMainFrame($CefBrowser)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefBrowser_GetMainFrame', 'ptr', $CefBrowser)
	If @error Then Return 0
	Return $aRet[0]
EndFunc