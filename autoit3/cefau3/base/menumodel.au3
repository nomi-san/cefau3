#include-once

Func CefMenuModel_AddCheckItem($CefMenuModel, $idCMD, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddCheckItem', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $String)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_AddItem($CefMenuModel, $idCMD, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddItem', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $String)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_AddRadioItem($CefMenuModel, $idCMD, $String, $idGroup)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddRadioItem', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $String, 'int', $idGroup)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_AddSeparator($CefMenuModel, $idCMD, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddSeparator', 'ptr', $CefMenuModel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_AddSubMenu($CefMenuModel, $idCMD, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddSubMenu', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $String)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_Clear($CefMenuModel)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_Clear', 'ptr', $CefMenuModel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsChecked($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddCheckItem', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsCheckedAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_AddCheckItem', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsEnabled($CefMenuModel, $idCMD, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_IsEnabled', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $String)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsEnabledAt($CefMenuModel, $Index, $String)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_IsEnabledAt', 'ptr', $CefMenuModel, 'int', $Index, 'wstr', $String)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsSubMenu($CefMenuModel)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_IsSubMenu', 'ptr', $CefMenuModel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsVisible($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_IsVisible', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_IsVisibleAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_IsVisibleAt', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetCommandIdAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefMenuModel_IsEnabledAt', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetCount($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefMenuModel_GetCount', 'ptr', $CefMenuModel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetGroupId($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefMenuModel_GetGroupId', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetGroupIdAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefMenuModel_GetGroupIdAt', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetIndexOf($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'int', 'CefMenuModel_GetIndexOf', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetLabel($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefMenuModel_GetLabel', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetLabelAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'wstr', 'CefMenuModel_GetLabelAt', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetSubMenu($CefMenuModel, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefMenuModel_GetSubMenu', 'ptr', $CefMenuModel, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_GetSubMenuAt($CefMenuModel, $Index)
	Local $aRet = DllCall($__handle__Cefau3, 'ptr', 'CefMenuModel_GetSubMenuAt', 'ptr', $CefMenuModel, 'int', $Index)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetChecked($CefMenuModel, $idCMD, $Check)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetChecked', 'ptr', $CefMenuModel, 'int', $idCMD, 'bool', $Check)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetCheckedAt($CefMenuModel, $Index, $Check = True)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetCheckedAt', 'ptr', $CefMenuModel, 'int', $Index, 'bool', $Check)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetCommandIdAt($CefMenuModel, $Index, $idCMD)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetCommandIdAt', 'ptr', $CefMenuModel, 'int', $Index, 'int', $idCMD)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetEnabled($CefMenuModel, $idCMD, $Enable)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetEnabled', 'ptr', $CefMenuModel, 'int', $idCMD, 'bool', $Enable)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetEnabledAt($CefMenuModel, $Index, $Enable = True)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetEnabledAt', 'ptr', $CefMenuModel, 'int', $Index, 'bool', $Enable)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetGroupId($CefMenuModel, $idCMD, $idGroup)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetGroupId', 'ptr', $CefMenuModel, 'int', $idCMD, 'int', $idGroup)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetGroupIdAt($CefMenuModel, $Index, $idGroup)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetGroupIdAt', 'ptr', $CefMenuModel, 'int', $Index, 'int', $idGroup)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetLabel($CefMenuModel, $idCMD, $sLabel)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetLabel', 'ptr', $CefMenuModel, 'int', $idCMD, 'wstr', $sLabel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetLabelAt($CefMenuModel, $Index, $sLabel)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetLabelAt', 'ptr', $CefMenuModel, 'int', $Index, 'wstr', $sLabel)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetVisible($CefMenuModel, $Index, $Visible = True)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetVisible', 'ptr', $CefMenuModel, 'int', $Index, 'bool', $Visible)
	If @error Then Return 0
	Return $aRet[0]
EndFunc

Func CefMenuModel_SetVisibleAt($CefMenuModel, $Index, $Visible = True)
	Local $aRet = DllCall($__handle__Cefau3, 'bool', 'CefMenuModel_SetVisibleAt', 'ptr', $CefMenuModel, 'int', $Index, 'bool', $Visible)
	If @error Then Return 0
	Return $aRet[0]
EndFunc