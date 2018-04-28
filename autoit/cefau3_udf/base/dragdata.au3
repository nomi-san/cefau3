#include-once

Func CefDragData_AddFile($CefDragData, $sPath, $sDisplayName)
	Local $aRet = DllCall($__handle__Cefau3, 'none', 'CefDragData_AddFile', 'ptr', $CefDragData, 'wstr', $sPath, 'wstr', $sDisplayName)
	If @error Then Return 0
	Return 1
EndFunc

Func CefDragData_GetFileName($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetFileName', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetFragmentBaseURL($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetFragmentBaseURL', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetFragmentHtml($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetFragmentHtml', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetFragmentText($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetFragmentText', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetLinkMetadata($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetLinkMetadata', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetLinkTitle($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetLinkTitle', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefDragData_GetLinkURL($CefDragData)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefDragData_GetLinkURL', 'ptr', $CefDragData)
	If @error Then Return 0
	Return $aRet[0]
EndFunc