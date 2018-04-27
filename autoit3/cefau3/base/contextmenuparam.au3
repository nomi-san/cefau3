#include-once

Func CefContextMenuParam_GetFrameUrl($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetFrameUrl', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetLinkUrl($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetLinkUrl', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetXCoord($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefContextMenuParam_GetXCoord', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetYCoord($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefContextMenuParam_GetYCoord', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetTitleText($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetTitleText', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetPageUrl($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetPageUrl', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetSourceUrl($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetSourceUrl', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetUnfilteredLinkUrl($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetUnfilteredLinkUrl', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetSelectionText($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetSelectionText', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetMisspelledWord($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetMisspelledWord', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_GetFrameCharset($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefContextMenuParam_GetFrameCharset', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_HasImageContents($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefContextMenuParam_HasImageContents', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_IsCustomMenu($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefContextMenuParam_IsCustomMenu', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_IsEditable($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefContextMenuParam_IsEditable', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_IsSpellCheckEnabled($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefContextMenuParam_IsSpellCheckEnabled', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefContextMenuParam_IsPepperMenu($CefContextMenuParams)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefContextMenuParam_IsPepperMenu', 'ptr', $CefContextMenuParams)
	If @error Then Return 0
	Return $aRet[0]
EndFunc