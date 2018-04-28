#include-once

; Send copy.
Func CefFrame_Copy($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Copy', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send cut.
Func CefFrame_Cut($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Cut', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send paste.
Func CefFrame_Paste($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Paste', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send delete.
Func CefFrame_Delete($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Delete', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send select all.
Func CefFrame_SelectAll($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_SelectAll', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send get CefBrowser pointer.
Func CefFrame_GetBrowser($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefFrame_GetBrowser', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get name.
Func CefFrame_GetName($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefFrame_GetName', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get ID.
Func CefFrame_GetIdentifier($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'long', 'CefFrame_GetIdentifier', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Get parent frame => CefFrame.
Func CefFrame_GetParent($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefFrame_GetParent', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; Execute JavaScript.
Func CefFrame_ExecuteJavaScript($CefFrame, $sURL, $sCode)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_ExecuteJavaScript', 'ptr', $CefFrame, 'wstr', $sURL, 'wstr', $sCode)
	If @error Then Return 0
	Return 1
EndFunc

; Get text.
Func CefFrame_GetText($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefFrame_GetText', 'ptr', $CefFrame)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

; View source code.
Func CefFrame_ViewSource($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_ViewSource', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send undo.
Func CefFrame_Undo($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Undo', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Send redo.
Func CefFrame_Redo($CefFrame)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_Redo', 'ptr', $CefFrame)
	If @error Then Return 0
	Return 1
EndFunc

; Load URL.
Func CefFrame_LoadURL($CefFrame, $sURL)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefFrame_LoadURL', 'ptr', $CefFrame, 'wstr', $sURL)
	If @error Then Return 0
	Return 1
EndFunc