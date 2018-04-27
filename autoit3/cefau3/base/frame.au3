
#include-once

Func CefFrame_Copy($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Copy', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_Cut($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Cut', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_Paste($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Paste', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_Delete($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Delete', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_SelectAll($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_SelectAll', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_GetBrowser($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefFrame_GetBrowser', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_GetName($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefFrame_GetName', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_GetIdentifier($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'long', 'CefFrame_GetIdentifier', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_GetParent($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefFrame_GetParent', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_ExecuteJavaScript($CefFrame, $sURL, $sCode)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_ExecuteJavaScript', 'ptr', $CefFrame, 'wstr', $sURL, 'wstr', $sCode)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_GetText($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefFrame_GetText', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_ViewSource($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_ViewSource', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_GetV8Context($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefFrame_GetV8Context', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefFrame_Undo($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Undo', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_Redo($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Redo', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

Func CefFrame_LoadURL($CefFrame, $sURL)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_LoadURL', 'ptr', $CefFrame, 'wstr', $sURL)
	If @error Then Return 0
	Return 1
EndFunc