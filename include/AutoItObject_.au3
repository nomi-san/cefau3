#include-once
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

; #CURRENT# =====================================================================================================================
;_AutoItObject_AddDestructor
;_AutoItObject_AddEnum
;_AutoItObject_AddMethod
;_AutoItObject_AddProperty
;_AutoItObject_Class
;_AutoItObject_CLSIDFromString
;_AutoItObject_CoCreateInstance
;_AutoItObject_Create
;_AutoItObject_DllOpen
;_AutoItObject_DllStructCreate
;_AutoItObject_IDispatchToPtr
;_AutoItObject_IUnknownAddRef
;_AutoItObject_IUnknownRelease
;_AutoItObject_ObjCreate
;_AutoItObject_ObjCreateEx
;_AutoItObject_ObjectFromDtag
;_AutoItObject_PtrToIDispatch
;_AutoItObject_RegisterObject
;_AutoItObject_RemoveMember
;_AutoItObject_Shutdown
;_AutoItObject_Startup
;_AutoItObject_UnregisterObject
;_AutoItObject_VariantClear
;_AutoItObject_VariantCopy
;_AutoItObject_VariantFree
;_AutoItObject_VariantInit
;_AutoItObject_VariantRead
;_AutoItObject_VariantSet
;_AutoItObject_WrapperAddMethod
;_AutoItObject_WrapperCreate
; ===============================================================================================================================

; #DATATYPES# =====================================================================================================================
; none - no value (only valid for return type, equivalent to void in C)
; byte - an unsigned 8 bit integer
; boolean - an unsigned 8 bit integer
; short - a 16 bit integer
; word, ushort - an unsigned 16 bit integer
; int, long - a 32 bit integer
; bool - a 32 bit integer
; dword, ulong, uint - an unsigned 32 bit integer
; hresult - an unsigned 32 bit integer
; int64 - a 64 bit integer
; uint64 - an unsigned 64 bit integer
; ptr - a general pointer (void *)
; hwnd - a window handle (pointer wide)
; handle - an handle (pointer wide)
; float - a single precision floating point number
; double - a double precision floating point number
; int_ptr, long_ptr, lresult, lparam - an integer big enough to hold a pointer when running on x86 or x64 versions of AutoIt
; uint_ptr, ulong_ptr, dword_ptr, wparam - an unsigned integer big enough to hold a pointer when running on x86 or x64 versions of AutoIt
; str - an ANSI string (a minimum of 65536 chars is allocated)
; wstr - a UNICODE wide character string (a minimum of 65536 chars is allocated)
; bstr - a composite data type that consists of a length prefix, a data string and a terminator
; variant - a tagged union that can be used to represent any other data type
; idispatch, object - a composite data type that represents object with IDispatch interface
; ===============================================================================================================================

;--------------------------------------------------------------------------------------------------------------------------------------
#Region Variable definitions

Global Const $gh_AU3Obj_kernel32dll = DllOpen("kernel32.dll")
Global Const $gh_AU3Obj_oleautdll = DllOpen("oleaut32.dll")
Global Const $gh_AU3Obj_ole32dll = DllOpen("ole32.dll")

Global Const $__Au3Obj_X64 = @AutoItX64

Global Const $__Au3Obj_VT_EMPTY = 0
Global Const $__Au3Obj_VT_NULL = 1
Global Const $__Au3Obj_VT_I2 = 2
Global Const $__Au3Obj_VT_I4 = 3
Global Const $__Au3Obj_VT_R4 = 4
Global Const $__Au3Obj_VT_R8 = 5
Global Const $__Au3Obj_VT_CY = 6
Global Const $__Au3Obj_VT_DATE = 7
Global Const $__Au3Obj_VT_BSTR = 8
Global Const $__Au3Obj_VT_DISPATCH = 9
Global Const $__Au3Obj_VT_ERROR = 10
Global Const $__Au3Obj_VT_BOOL = 11
Global Const $__Au3Obj_VT_VARIANT = 12
Global Const $__Au3Obj_VT_UNKNOWN = 13
Global Const $__Au3Obj_VT_DECIMAL = 14
Global Const $__Au3Obj_VT_I1 = 16
Global Const $__Au3Obj_VT_UI1 = 17
Global Const $__Au3Obj_VT_UI2 = 18
Global Const $__Au3Obj_VT_UI4 = 19
Global Const $__Au3Obj_VT_I8 = 20
Global Const $__Au3Obj_VT_UI8 = 21
Global Const $__Au3Obj_VT_INT = 22
Global Const $__Au3Obj_VT_UINT = 23
Global Const $__Au3Obj_VT_VOID = 24
Global Const $__Au3Obj_VT_HRESULT = 25
Global Const $__Au3Obj_VT_PTR = 26
Global Const $__Au3Obj_VT_SAFEARRAY = 27
Global Const $__Au3Obj_VT_CARRAY = 28
Global Const $__Au3Obj_VT_USERDEFINED = 29
Global Const $__Au3Obj_VT_LPSTR = 30
Global Const $__Au3Obj_VT_LPWSTR = 31
Global Const $__Au3Obj_VT_RECORD = 36
Global Const $__Au3Obj_VT_INT_PTR = 37
Global Const $__Au3Obj_VT_UINT_PTR = 38
Global Const $__Au3Obj_VT_FILETIME = 64
Global Const $__Au3Obj_VT_BLOB = 65
Global Const $__Au3Obj_VT_STREAM = 66
Global Const $__Au3Obj_VT_STORAGE = 67
Global Const $__Au3Obj_VT_STREAMED_OBJECT = 68
Global Const $__Au3Obj_VT_STORED_OBJECT = 69
Global Const $__Au3Obj_VT_BLOB_OBJECT = 70
Global Const $__Au3Obj_VT_CF = 71
Global Const $__Au3Obj_VT_CLSID = 72
Global Const $__Au3Obj_VT_VERSIONED_STREAM = 73
Global Const $__Au3Obj_VT_BSTR_BLOB = 0xfff
Global Const $__Au3Obj_VT_VECTOR = 0x1000
Global Const $__Au3Obj_VT_ARRAY = 0x2000
Global Const $__Au3Obj_VT_BYREF = 0x4000
Global Const $__Au3Obj_VT_RESERVED = 0x8000
Global Const $__Au3Obj_VT_ILLEGAL = 0xffff
Global Const $__Au3Obj_VT_ILLEGALMASKED = 0xfff
Global Const $__Au3Obj_VT_TYPEMASK = 0xfff

Global Const $__Au3Obj_tagVARIANT = "word vt;word r1;word r2;word r3;ptr data; ptr"

Global Const $__Au3Obj_VARIANT_SIZE = DllStructGetSize(DllStructCreate($__Au3Obj_tagVARIANT, 1))
Global Const $__Au3Obj_PTR_SIZE = DllStructGetSize(DllStructCreate('ptr', 1))
Global Const $__Au3Obj_tagSAFEARRAYBOUND = "ulong cElements; long lLbound;"

Global $ghAutoItObjectDLL = -1, $giAutoItObjectDLLRef = 0

;===============================================================================
#interface "IUnknown"
Global Const $sIID_IUnknown = "{00000000-0000-0000-C000-000000000046}"
; Definition
Global $dtagIUnknown = "QueryInterface hresult(ptr;ptr*);" & _
		"AddRef dword();" & _
		"Release dword();"
; List
Global $ltagIUnknown = "QueryInterface;" & _
		"AddRef;" & _
		"Release;"
;===============================================================================
;===============================================================================
#interface "IDispatch"
Global Const $sIID_IDispatch = "{00020400-0000-0000-C000-000000000046}"
; Definition
Global $dtagIDispatch = $dtagIUnknown & _
		"GetTypeInfoCount hresult(dword*);" & _
		"GetTypeInfo hresult(dword;dword;ptr*);" & _
		"GetIDsOfNames hresult(ptr;ptr;dword;dword;ptr);" & _
		"Invoke hresult(dword;ptr;dword;word;ptr;ptr;ptr;ptr);"
; List
Global $ltagIDispatch = $ltagIUnknown & _
		"GetTypeInfoCount;" & _
		"GetTypeInfo;" & _
		"GetIDsOfNames;" & _
		"Invoke;"
;===============================================================================

#EndRegion Variable definitions
;--------------------------------------------------------------------------------------------------------------------------------------


;--------------------------------------------------------------------------------------------------------------------------------------
#Region Misc

DllCall($gh_AU3Obj_ole32dll, 'long', 'OleInitialize', 'ptr', 0)
OnAutoItExitRegister("__Au3Obj_OleUninitialize")

Func __Au3Obj_OleUninitialize()
	; Author: Prog@ndy
	DllCall($gh_AU3Obj_ole32dll, 'long', 'OleUninitialize')
	_AutoItObject_Shutdown(True)
EndFunc   ;==>__Au3Obj_OleUninitialize

Func __Au3Obj_IUnknown_AddRef($vObj)
	Local $sType = "ptr"
	If IsObj($vObj) Then $sType = "idispatch"
	Local $tVARIANT = DllStructCreate($__Au3Obj_tagVARIANT)
	; Actual call
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "DispCallFunc", _
			$sType, $vObj, _
			"dword", $__Au3Obj_PTR_SIZE, _ ; offset (4 for x86, 8 for x64)
			"dword", 4, _ ; CC_STDCALL
			"dword", $__Au3Obj_VT_UINT, _
			"dword", 0, _ ; number of function parameters
			"ptr", 0, _ ; parameters related
			"ptr", 0, _ ; parameters related
			"ptr", DllStructGetPtr($tVARIANT))
	If @error Or $aCall[0] Then Return SetError(1, 0, 0)
	; Collect returned
	Return DllStructGetData(DllStructCreate("dword", DllStructGetPtr($tVARIANT, "data")), 1)
EndFunc   ;==>__Au3Obj_IUnknown_AddRef

Func __Au3Obj_IUnknown_Release($vObj)
	Local $sType = "ptr"
	If IsObj($vObj) Then $sType = "idispatch"
	Local $tVARIANT = DllStructCreate($__Au3Obj_tagVARIANT)
	; Actual call
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "DispCallFunc", _
			$sType, $vObj, _
			"dword", 2 * $__Au3Obj_PTR_SIZE, _ ; offset (8 for x86, 16 for x64)
			"dword", 4, _ ; CC_STDCALL
			"dword", $__Au3Obj_VT_UINT, _
			"dword", 0, _ ; number of function parameters
			"ptr", 0, _ ; parameters related
			"ptr", 0, _ ; parameters related
			"ptr", DllStructGetPtr($tVARIANT))
	If @error Or $aCall[0] Then Return SetError(1, 0, 0)
	; Collect returned
	Return DllStructGetData(DllStructCreate("dword", DllStructGetPtr($tVARIANT, "data")), 1)
EndFunc   ;==>__Au3Obj_IUnknown_Release

Func __Au3Obj_GetMethods($tagInterface)
	Local $sMethods = StringReplace(StringRegExpReplace($tagInterface, "\h*(\w+)\h*(\w+\*?)\h*(\((.*?)\))\h*(;|;*\z)", "$1\|$2;$4" & @LF), ";" & @LF, @LF)
	If $sMethods = $tagInterface Then $sMethods = StringReplace(StringRegExpReplace($tagInterface, "\h*(\w+)\h*(;|;*\z)", "$1\|" & @LF), ";" & @LF, @LF)
	Return StringTrimRight($sMethods, 1)
EndFunc   ;==>__Au3Obj_GetMethods

Func __Au3Obj_ObjStructGetElements($sTag, ByRef $sAlign)
	Local $sAlignment = StringRegExpReplace($sTag, "\h*(align\h+\d+)\h*;.*", "$1")
	If $sAlignment <> $sTag Then
		$sAlign = $sAlignment
		$sTag = StringRegExpReplace($sTag, "\h*(align\h+\d+)\h*;", "")
	EndIf
	; Return StringRegExp($sTag, "\h*\w+\h*(\w+)\h*", 3) ; DO NOT REMOVE THIS LINE
	Return StringTrimRight(StringRegExpReplace($sTag, "\h*\w+\h*(\w+)\h*(\[\d+\])*\h*(;|;*\z)\h*", "$1;"), 1)
EndFunc   ;==>__Au3Obj_ObjStructGetElements

#EndRegion Misc
;--------------------------------------------------------------------------------------------------------------------------------------


;--------------------------------------------------------------------------------------------------------------------------------------
#Region SafeArray
Func __Au3Obj_SafeArrayCreate($vType, $cDims, $rgsabound)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "ptr", "SafeArrayCreate", "dword", $vType, "uint", $cDims, 'ptr', $rgsabound)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayCreate

Func __Au3Obj_SafeArrayDestroy($pSafeArray)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SafeArrayDestroy", "ptr", $pSafeArray)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayDestroy

Func __Au3Obj_SafeArrayAccessData($pSafeArray, ByRef $pArrayData)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SafeArrayAccessData", "ptr", $pSafeArray, 'ptr*', 0)
	If @error Then Return SetError(1, 0, 1)
	$pArrayData = $aCall[2]
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayAccessData

Func __Au3Obj_SafeArrayUnaccessData($pSafeArray)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SafeArrayUnaccessData", "ptr", $pSafeArray)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayUnaccessData

Func __Au3Obj_SafeArrayGetUBound($pSafeArray, $iDim, ByRef $iBound)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SafeArrayGetUBound", "ptr", $pSafeArray, 'uint', $iDim, 'long*', 0)
	If @error Then Return SetError(1, 0, 1)
	$iBound = $aCall[3]
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayGetUBound

Func __Au3Obj_SafeArrayGetLBound($pSafeArray, $iDim, ByRef $iBound)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SafeArrayGetLBound", "ptr", $pSafeArray, 'uint', $iDim, 'long*', 0)
	If @error Then Return SetError(1, 0, 1)
	$iBound = $aCall[3]
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SafeArrayGetLBound

Func __Au3Obj_SafeArrayGetDim($pSafeArray)
	Local $aResult = DllCall($gh_AU3Obj_oleautdll, "uint", "SafeArrayGetDim", "ptr", $pSafeArray)
	If @error Then Return SetError(1, 0, 0)
	Return $aResult[0]
EndFunc   ;==>__Au3Obj_SafeArrayGetDim

Func __Au3Obj_CreateSafeArrayVariant(ByRef Const $aArray)
	; Author: Prog@ndy
	Local $iDim = UBound($aArray, 0), $pData, $pSafeArray, $bound, $subBound, $tBound
	Switch $iDim
		Case 1
			$bound = UBound($aArray) - 1
			$tBound = DllStructCreate($__Au3Obj_tagSAFEARRAYBOUND)
			DllStructSetData($tBound, 1, $bound + 1)
			$pSafeArray = __Au3Obj_SafeArrayCreate($__Au3Obj_VT_VARIANT, 1, DllStructGetPtr($tBound))
			If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
				For $i = 0 To $bound
					_AutoItObject_VariantInit($pData + $i * $__Au3Obj_VARIANT_SIZE)
					_AutoItObject_VariantSet($pData + $i * $__Au3Obj_VARIANT_SIZE, $aArray[$i])
				Next
				__Au3Obj_SafeArrayUnaccessData($pSafeArray)
			EndIf
			Return $pSafeArray
		Case 2
			$bound = UBound($aArray, 1) - 1
			$subBound = UBound($aArray, 2) - 1
			$tBound = DllStructCreate($__Au3Obj_tagSAFEARRAYBOUND & $__Au3Obj_tagSAFEARRAYBOUND)
			DllStructSetData($tBound, 3, $bound + 1)
			DllStructSetData($tBound, 1, $subBound + 1)
			$pSafeArray = __Au3Obj_SafeArrayCreate($__Au3Obj_VT_VARIANT, 2, DllStructGetPtr($tBound))
			If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
				For $i = 0 To $bound
					For $j = 0 To $subBound
						_AutoItObject_VariantInit($pData + ($j + $i * ($subBound + 1)) * $__Au3Obj_VARIANT_SIZE)
						_AutoItObject_VariantSet($pData + ($j + $i * ($subBound + 1)) * $__Au3Obj_VARIANT_SIZE, $aArray[$i][$j])
					Next
				Next
				__Au3Obj_SafeArrayUnaccessData($pSafeArray)
			EndIf
			Return $pSafeArray
		Case Else
			Return 0
	EndSwitch
EndFunc   ;==>__Au3Obj_CreateSafeArrayVariant

Func __Au3Obj_ReadSafeArrayVariant($pSafeArray)
	; Author: Prog@ndy
	Local $iDim = __Au3Obj_SafeArrayGetDim($pSafeArray), $pData, $lbound, $bound, $subBound
	Switch $iDim
		Case 1
			__Au3Obj_SafeArrayGetLBound($pSafeArray, 1, $lbound)
			__Au3Obj_SafeArrayGetUBound($pSafeArray, 1, $bound)
			$bound -= $lbound
			Local $array[$bound + 1]
			If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
				For $i = 0 To $bound
					$array[$i] = _AutoItObject_VariantRead($pData + $i * $__Au3Obj_VARIANT_SIZE)
				Next
				__Au3Obj_SafeArrayUnaccessData($pSafeArray)
			EndIf
			Return $array
		Case 2
			__Au3Obj_SafeArrayGetLBound($pSafeArray, 2, $lbound)
			__Au3Obj_SafeArrayGetUBound($pSafeArray, 2, $bound)
			$bound -= $lbound
			__Au3Obj_SafeArrayGetLBound($pSafeArray, 1, $lbound)
			__Au3Obj_SafeArrayGetUBound($pSafeArray, 1, $subBound)
			$subBound -= $lbound
			Local $array[$bound + 1][$subBound + 1]
			If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
				For $i = 0 To $bound
					For $j = 0 To $subBound
						$array[$i][$j] = _AutoItObject_VariantRead($pData + ($j + $i * ($subBound + 1)) * $__Au3Obj_VARIANT_SIZE)
					Next
				Next
				__Au3Obj_SafeArrayUnaccessData($pSafeArray)
			EndIf
			Return $array
		Case Else
			Return 0
	EndSwitch
EndFunc   ;==>__Au3Obj_ReadSafeArrayVariant

#EndRegion SafeArray
;--------------------------------------------------------------------------------------------------------------------------------------


;--------------------------------------------------------------------------------------------------------------------------------------
#Region Memory

Func __Au3Obj_CoTaskMemAlloc($iSize)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_ole32dll, "ptr", "CoTaskMemAlloc", "uint_ptr", $iSize)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_CoTaskMemAlloc

Func __Au3Obj_CoTaskMemFree($pCoMem)
	; Author: Prog@ndy
	DllCall($gh_AU3Obj_ole32dll, "none", "CoTaskMemFree", "ptr", $pCoMem)
	If @error Then Return SetError(1, 0, 0)
EndFunc   ;==>__Au3Obj_CoTaskMemFree

Func __Au3Obj_CoTaskMemRealloc($pCoMem, $iSize)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_ole32dll, "ptr", "CoTaskMemRealloc", 'ptr', $pCoMem, "uint_ptr", $iSize)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_CoTaskMemRealloc

Func __Au3Obj_GlobalAlloc($iSize, $iFlag)
	Local $aCall = DllCall($gh_AU3Obj_kernel32dll, "ptr", "GlobalAlloc", "dword", $iFlag, "dword_ptr", $iSize)
	If @error Or Not $aCall[0] Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_GlobalAlloc

Func __Au3Obj_GlobalFree($pPointer)
	Local $aCall = DllCall($gh_AU3Obj_kernel32dll, "ptr", "GlobalFree", "ptr", $pPointer)
	If @error Or $aCall[0] Then Return SetError(1, 0, 0)
	Return 1
EndFunc   ;==>__Au3Obj_GlobalFree

#EndRegion Memory
;--------------------------------------------------------------------------------------------------------------------------------------

;--------------------------------------------------------------------------------------------------------------------------------------
#Region SysString

Func __Au3Obj_SysAllocString($str)
	; Author: monoceres
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "ptr", "SysAllocString", "wstr", $str)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SysAllocString
Func __Au3Obj_SysCopyString($pBSTR)
	; Author: Prog@ndy
	If Not $pBSTR Then Return SetError(2, 0, 0)
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "ptr", "SysAllocStringLen", "ptr", $pBSTR, "uint", __Au3Obj_SysStringLen($pBSTR))
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SysCopyString

Func __Au3Obj_SysReAllocString(ByRef $pBSTR, $str)
	; Author: Prog@ndy
	If Not $pBSTR Then Return SetError(2, 0, 0)
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "int", "SysReAllocString", 'ptr*', $pBSTR, "wstr", $str)
	If @error Then Return SetError(1, 0, 0)
	$pBSTR = $aCall[1]
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SysReAllocString

Func __Au3Obj_SysFreeString($pBSTR)
	; Author: Prog@ndy
	If Not $pBSTR Then Return SetError(2, 0, 0)
	DllCall($gh_AU3Obj_oleautdll, "none", "SysFreeString", "ptr", $pBSTR)
	If @error Then Return SetError(1, 0, 0)
EndFunc   ;==>__Au3Obj_SysFreeString

Func __Au3Obj_SysStringLen($pBSTR)
	; Author: Prog@ndy
	If Not $pBSTR Then Return SetError(2, 0, 0)
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "uint", "SysStringLen", "ptr", $pBSTR)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>__Au3Obj_SysStringLen

Func __Au3Obj_SysReadString($pBSTR, $iLen = -1)
	; Author: Prog@ndy
	If Not $pBSTR Then Return SetError(2, 0, '')
	If $iLen < 1 Then $iLen = __Au3Obj_SysStringLen($pBSTR)
	If $iLen < 1 Then Return SetError(1, 0, '')
	Return DllStructGetData(DllStructCreate("wchar[" & $iLen & "]", $pBSTR), 1)
EndFunc   ;==>__Au3Obj_SysReadString

Func __Au3Obj_PtrStringLen($pStr)
	; Author: Prog@ndy
	Local $aResult = DllCall($gh_AU3Obj_kernel32dll, 'int', 'lstrlenW', 'ptr', $pStr)
	If @error Then Return SetError(1, 0, 0)
	Return $aResult[0]
EndFunc   ;==>__Au3Obj_PtrStringLen

Func __Au3Obj_PtrStringRead($pStr, $iLen = -1)
	; Author: Prog@ndy
	If $iLen < 1 Then $iLen = __Au3Obj_PtrStringLen($pStr)
	If $iLen < 1 Then Return SetError(1, 0, '')
	Return DllStructGetData(DllStructCreate("wchar[" & $iLen & "]", $pStr), 1)
EndFunc   ;==>__Au3Obj_PtrStringRead

#EndRegion SysString
;--------------------------------------------------------------------------------------------------------------------------------------

;--------------------------------------------------------------------------------------------------------------------------------------
#Region Proxy Functions

Func __Au3Obj_FunctionProxy($FuncName, $oSelf) ; allows binary code to call autoit functions
	Local $arg = $oSelf.__params__ ; fetch params
	If IsArray($arg) Then
		Local $ret = Call($FuncName, $arg) ; Call
		If @error = 0xDEAD And @extended = 0xBEEF Then Return 0
		$oSelf.__error__ = @error ; set error
		$oSelf.__result__ = $ret ; set result
		Return 1
	EndIf
	; return error when params-array could not be created
EndFunc   ;==>__Au3Obj_FunctionProxy

Func __Au3Obj_EnumFunctionProxy($iAction, $FuncName, $oSelf, $pVarCurrent, $pVarResult)
	Local $Current, $ret
	Switch $iAction
		Case 0 ; Next
			$Current = $oSelf.__bridge__(Number($pVarCurrent))
			;$ret = Execute($FuncName & "($oSelf, $Current)")
			$ret = call($FuncName, $oSelf, $Current)
			If @error Then Return False
			$oSelf.__bridge__(Number($pVarCurrent)) = $Current
			$oSelf.__bridge__(Number($pVarResult)) = $ret
			Return 1
		Case 1 ;Skip
			Return False
		Case 2 ; Reset
			$Current = $oSelf.__bridge__(Number($pVarCurrent))
			;$ret = Execute($FuncName & "($oSelf, $Current)")
			$ret = call($FuncName, $oSelf, $Current)
			If @error Or Not $ret Then Return False
			$oSelf.__bridge__(Number($pVarCurrent)) = $Current
			Return True
	EndSwitch
EndFunc   ;==>__Au3Obj_EnumFunctionProxy

#EndRegion Proxy Functions
;--------------------------------------------------------------------------------------------------------------------------------------

;--------------------------------------------------------------------------------------------------------------------------------------
#Region DllStructCreate Wrapper

Func __Au3Obj_ObjStructMethod(ByRef $oSelf, $vParam1 = 0, $vParam2 = 0)
	Local $sMethod = $oSelf.__name__
	Local $tStructure = DllStructCreate($oSelf.__tag__, $oSelf.__pointer__)
	Local $vOut
	Switch @NumParams
		Case 1
			$vOut = DllStructGetData($tStructure, $sMethod)
		Case 2
			If $oSelf.__propcall__ Then
				$vOut = DllStructSetData($tStructure, $sMethod, $vParam1)
			Else
				$vOut = DllStructGetData($tStructure, $sMethod, $vParam1)
			EndIf
		Case 3
			$vOut = DllStructSetData($tStructure, $sMethod, $vParam2, $vParam1)
	EndSwitch
	If IsPtr($vOut) Then Return Number($vOut)
	Return $vOut
EndFunc   ;==>__Au3Obj_ObjStructMethod

Func __Au3Obj_ObjStructDestructor(ByRef $oSelf)
	If $oSelf.__new__ Then __Au3Obj_GlobalFree($oSelf.__pointer__)
EndFunc   ;==>__Au3Obj_ObjStructDestructor

Func __Au3Obj_ObjStructPointer(ByRef $oSelf, $vParam = Default)
	If $oSelf.__propcall__ Then Return SetError(1, 0, 0)
	If @NumParams = 1 Or IsKeyword($vParam) Then Return $oSelf.__pointer__
	Return Number(DllStructGetPtr(DllStructCreate($oSelf.__tag__, $oSelf.__pointer__), $vParam))
EndFunc   ;==>__Au3Obj_ObjStructPointer

#EndRegion DllStructCreate Wrapper
;--------------------------------------------------------------------------------------------------------------------------------------


;--------------------------------------------------------------------------------------------------------------------------------------
#Region Public UDFs

Global Enum $ELTYPE_NOTHING, $ELTYPE_METHOD, $ELTYPE_PROPERTY
Global Enum $ELSCOPE_PUBLIC, $ELSCOPE_READONLY, $ELSCOPE_PRIVATE

Func _AutoItObject_AddDestructor(ByRef $oObject, $sAutoItFunc)
	Return _AutoItObject_AddMethod($oObject, "~", $sAutoItFunc, True)
EndFunc   ;==>_AutoItObject_AddDestructor

Func _AutoItObject_AddMethod(ByRef $oObject, $sName, $sAutoItFunc, $fPrivate = False)
	; Author: Prog@ndy
	If Not IsObj($oObject) Then Return SetError(2, 0, 0)
	Local $iFlags = 0
	If $fPrivate Then $iFlags = $ELSCOPE_PRIVATE
	DllCall($ghAutoItObjectDLL, "none", "AddMethod", "idispatch", $oObject, "wstr", $sName, "wstr", $sAutoItFunc, 'dword', $iFlags)
	If @error Then Return SetError(1, @error, 0)
	Return True
EndFunc   ;==>_AutoItObject_AddMethod

Func _AutoItObject_AddProperty(ByRef $oObject, $sName, $iFlags = $ELSCOPE_PUBLIC, $vData = "")
	; Author: Prog@ndy
	Local Static $tStruct = DllStructCreate($__Au3Obj_tagVARIANT)
	If Not IsObj($oObject) Then Return SetError(2, 0, 0)
	Local $pData = 0
	If @NumParams = 4 Then
		$pData = DllStructGetPtr($tStruct)
		_AutoItObject_VariantInit($pData)
		$oObject.__bridge__(Number($pData)) = $vData
	EndIf
	DllCall($ghAutoItObjectDLL, "none", "AddProperty", "idispatch", $oObject, "wstr", $sName, 'dword', $iFlags, 'ptr', $pData)
	Local $error = @error
	If $pData Then _AutoItObject_VariantClear($pData)
	If $error Then Return SetError(1, $error, 0)
	Return True
EndFunc   ;==>_AutoItObject_AddProperty

Func _AutoItObject_Class()
	Local $aCall = DllCall($ghAutoItObjectDLL, "idispatch", "CreateAutoItObjectClass")
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_Class

Func _AutoItObject_Create($oParent = 0)
	; Author: Prog@ndy
	Local $aResult
	Switch IsObj($oParent)
		Case True
			$aResult = DllCall($ghAutoItObjectDLL, "idispatch", "CloneAutoItObject", 'idispatch', $oParent)
		Case Else
			$aResult = DllCall($ghAutoItObjectDLL, "idispatch", "CreateAutoItObject")
	EndSwitch
	If @error Then Return SetError(1, @error, 0)
	Return $aResult[0]
EndFunc   ;==>_AutoItObject_Create

Func _AutoItObject_DllStructCreate($sTag, $vParam = 0)
	Local $fNew = False
	Local $tSubStructure = DllStructCreate($sTag)
	If @error Then Return SetError(@error, 0, 0)
	Local $iSize = DllStructGetSize($tSubStructure)
	Local $pPointer = $vParam
	Select
		Case @NumParams = 1
			; Will allocate fixed 128 extra bytes due to possible misalignment and other issues
			$pPointer = __Au3Obj_GlobalAlloc($iSize + 128, 64) ; GPTR
			If @error Then Return SetError(3, 0, 0)
			$fNew = True
		Case IsDllStruct($vParam)
			$pPointer = __Au3Obj_GlobalAlloc($iSize, 64) ; GPTR
			If @error Then Return SetError(3, 0, 0)
			$fNew = True
			DllStructSetData(DllStructCreate("byte[" & $iSize & "]", $pPointer), 1, DllStructGetData(DllStructCreate("byte[" & $iSize & "]", DllStructGetPtr($vParam)), 1))
		Case @NumParams = 2 And $vParam = 0
			Return SetError(3, 0, 0)
	EndSelect
	Local $sAlignment
	Local $sNamesString = __Au3Obj_ObjStructGetElements($sTag, $sAlignment)
	Local $aElements = StringSplit($sNamesString, ";", 2)
	Local $oObj = _AutoItObject_Class()
	For $i = 0 To UBound($aElements) - 1
		$oObj.AddMethod($aElements[$i], "__Au3Obj_ObjStructMethod")
	Next
	$oObj.AddProperty("__tag__", $ELSCOPE_READONLY, $sTag)
	$oObj.AddProperty("__size__", $ELSCOPE_READONLY, $iSize)
	$oObj.AddProperty("__alignment__", $ELSCOPE_READONLY, $sAlignment)
	$oObj.AddProperty("__count__", $ELSCOPE_READONLY, UBound($aElements))
	$oObj.AddProperty("__elements__", $ELSCOPE_READONLY, $sNamesString)
	$oObj.AddProperty("__new__", $ELSCOPE_PRIVATE, $fNew)
	$oObj.AddProperty("__pointer__", $ELSCOPE_READONLY, Number($pPointer))
	$oObj.AddMethod("__default__", "__Au3Obj_ObjStructPointer")
	$oObj.AddDestructor("__Au3Obj_ObjStructDestructor")
	Return $oObj.Object
EndFunc   ;==>_AutoItObject_DllStructCreate

Func _AutoItObject_IDispatchToPtr($oIDispatch)
	Local $aCall = DllCall($ghAutoItObjectDLL, "ptr", "ReturnThis", "idispatch", $oIDispatch)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_IDispatchToPtr

Func _AutoItObject_IUnknownAddRef(Const $vUnknown)
	; Author: Prog@ndy
	Local $sType = "ptr"
	If IsObj($vUnknown) Then $sType = "idispatch"
	Local $aCall = DllCall($ghAutoItObjectDLL, "dword", "IUnknownAddRef", $sType, $vUnknown)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_IUnknownAddRef

Func _AutoItObject_IUnknownRelease(Const $vUnknown)
	Local $sType = "ptr"
	If IsObj($vUnknown) Then $sType = "idispatch"
	Local $aCall = DllCall($ghAutoItObjectDLL, "dword", "IUnknownRelease", $sType, $vUnknown)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_IUnknownRelease

Func _AutoItObject_PtrToIDispatch($pIDispatch)
	Local $aCall = DllCall($ghAutoItObjectDLL, "idispatch", "ReturnThis", "ptr", $pIDispatch)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_PtrToIDispatch

Func _AutoItObject_RemoveMember(ByRef $oObject, $sMember)
	; Author: Prog@ndy
	If Not IsObj($oObject) Then Return SetError(2, 0, 0)
	If $sMember = '__default__' Then Return SetError(3, 0, 0)
	DllCall($ghAutoItObjectDLL, "none", "RemoveMember", "idispatch", $oObject, "wstr", $sMember)
	If @error Then Return SetError(1, @error, 0)
	Return True
EndFunc   ;==>_AutoItObject_RemoveMember

Func _AutoItObject_Shutdown($fFinal = False)
	; Author: Prog@ndy
	If $giAutoItObjectDLLRef <= 0 Then Return 0
	$giAutoItObjectDLLRef -= 1
	If $fFinal Then $giAutoItObjectDLLRef = 0
	If $giAutoItObjectDLLRef = 0 Then DllCall($ghAutoItObjectDLL, "ptr", "Initialize", "ptr", 0, "ptr", 0)
	Return $giAutoItObjectDLLRef
EndFunc   ;==>_AutoItObject_Shutdown

Func _AutoItObject_Startup($sDll = "AutoitObject.dll")
	Local Static $__Au3Obj_FunctionProxy = DllCallbackGetPtr(DllCallbackRegister("__Au3Obj_FunctionProxy", "int", "wstr;idispatch"))
	Local Static $__Au3Obj_EnumFunctionProxy = DllCallbackGetPtr(DllCallbackRegister("__Au3Obj_EnumFunctionProxy", "int", "dword;wstr;idispatch;ptr;ptr"))
	If $ghAutoItObjectDLL = -1 Then
		If $__Au3Obj_X64 Then $sDll = "AutoItObject_X64.dll"
		$ghAutoItObjectDLL = DllOpen($sDll)
		If $ghAutoItObjectDLL = -1 Then Return SetError(1, 0, False)
	EndIf
	If $giAutoItObjectDLLRef <= 0 Then
		$giAutoItObjectDLLRef = 0
		DllCall($ghAutoItObjectDLL, "none", "Initialize", "ptr", $__Au3Obj_FunctionProxy, "ptr", $__Au3Obj_EnumFunctionProxy)
		If @error Then
			DllClose($ghAutoItObjectDLL)
			$ghAutoItObjectDLL = -1
			Return SetError(2, 0, False)
		EndIf
	EndIf
	$giAutoItObjectDLLRef += 1
	Return True
EndFunc   ;==>_AutoItObject_Startup

Func _AutoItObject_VariantClear($pvarg)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "VariantClear", "ptr", $pvarg)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_VariantClear

Func _AutoItObject_VariantCopy($pvargDest, $pvargSrc)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "VariantCopy", "ptr", $pvargDest, 'ptr', $pvargSrc)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_VariantCopy

Func _AutoItObject_VariantFree($pvarg)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "VariantClear", "ptr", $pvarg)
	If @error Then Return SetError(1, 0, 1)
	If $aCall[0] = 0 Then __Au3Obj_CoTaskMemFree($pvarg)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_VariantFree

Func _AutoItObject_VariantInit($pvarg)
	; Author: Prog@ndy
	Local $aCall = DllCall($gh_AU3Obj_oleautdll, "long", "VariantInit", "ptr", $pvarg)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc   ;==>_AutoItObject_VariantInit

Func _AutoItObject_VariantRead($pVariant)
	; Author: monoceres, Prog@ndy
	Local $var = DllStructCreate($__Au3Obj_tagVARIANT, $pVariant), $data
	; Translate the vt id to a autoit dllcall type
	Local $VT = DllStructGetData($var, "vt"), $type
	Switch $VT
		Case $__Au3Obj_VT_I1, $__Au3Obj_VT_UI1
			$type = "byte"
		Case $__Au3Obj_VT_I2
			$type = "short"
		Case $__Au3Obj_VT_I4
			$type = "int"
		Case $__Au3Obj_VT_I8
			$type = "int64"
		Case $__Au3Obj_VT_R4
			$type = "float"
		Case $__Au3Obj_VT_R8
			$type = "double"
		Case $__Au3Obj_VT_UI2
			$type = 'word'
		Case $__Au3Obj_VT_UI4
			$type = 'uint'
		Case $__Au3Obj_VT_UI8
			$type = 'uint64'
		Case $__Au3Obj_VT_BSTR
			Return __Au3Obj_SysReadString(DllStructGetData($var, "data"))
		Case $__Au3Obj_VT_BOOL
			$type = 'short'
		Case BitOR($__Au3Obj_VT_ARRAY, $__Au3Obj_VT_UI1)
			Local $pSafeArray = DllStructGetData($var, "data")
			Local $bound, $pData, $lbound
			If 0 = __Au3Obj_SafeArrayGetUBound($pSafeArray, 1, $bound) Then
				__Au3Obj_SafeArrayGetLBound($pSafeArray, 1, $lbound)
				$bound += 1 - $lbound
				If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
					Local $tData = DllStructCreate("byte[" & $bound & "]", $pData)
					$data = DllStructGetData($tData, 1)
					__Au3Obj_SafeArrayUnaccessData($pSafeArray)
				EndIf
			EndIf
			Return $data
		Case BitOR($__Au3Obj_VT_ARRAY, $__Au3Obj_VT_VARIANT)
			Return __Au3Obj_ReadSafeArrayVariant(DllStructGetData($var, "data"))
		Case $__Au3Obj_VT_DISPATCH
			Return _AutoItObject_PtrToIDispatch(DllStructGetData($var, "data"))
		Case $__Au3Obj_VT_PTR
			Return DllStructGetData($var, "data")
		Case $__Au3Obj_VT_ERROR
			Return Default
		Case Else
			Return SetError(1, 0, '')
	EndSwitch

	$data = DllStructCreate($type, DllStructGetPtr($var, "data"))

	Switch $VT
		Case $__Au3Obj_VT_BOOL
			Return DllStructGetData($data, 1) <> 0
	EndSwitch
	Return DllStructGetData($data, 1)

EndFunc   ;==>_AutoItObject_VariantRead

Func _AutoItObject_VariantSet($pVar, $vVal, $iSpecialType = 0)
	; Author: monoceres, Prog@ndy
	If Not $pVar Then
		$pVar = __Au3Obj_CoTaskMemAlloc($__Au3Obj_VARIANT_SIZE)
		_AutoItObject_VariantInit($pVar)
	Else
		_AutoItObject_VariantClear($pVar)
	EndIf
	Local $tVar = DllStructCreate($__Au3Obj_tagVARIANT, $pVar)
	Local $iType = $__Au3Obj_VT_EMPTY, $vDataType = ''

	Switch VarGetType($vVal)
		Case "Int32"
			$iType = $__Au3Obj_VT_I4
			$vDataType = 'int'
		Case "Int64"
			$iType = $__Au3Obj_VT_I8
			$vDataType = 'int64'
		Case "String", 'Text'
			$iType = $__Au3Obj_VT_BSTR
			$vDataType = 'ptr'
			$vVal = __Au3Obj_SysAllocString($vVal)
		Case "UserFunction"
			$iType = $__Au3Obj_VT_BSTR
			$vDataType = 'ptr'
			$vVal = __Au3Obj_SysAllocString(FuncName($vVal))
		Case "Double"
			$vDataType = 'double'
			$iType = $__Au3Obj_VT_R8
		Case "Float"
			$vDataType = 'float'
			$iType = $__Au3Obj_VT_R4
		Case "Bool"
			$vDataType = 'short'
			$iType = $__Au3Obj_VT_BOOL
			If $vVal Then
				$vVal = 0xffff
			Else
				$vVal = 0
			EndIf
		Case 'Ptr'
			If $__Au3Obj_X64 Then
				$iType = $__Au3Obj_VT_UI8
			Else
				$iType = $__Au3Obj_VT_UI4
			EndIf
			$vDataType = 'ptr'
		Case 'Object'
			_AutoItObject_IUnknownAddRef($vVal)
			$vDataType = 'ptr'
			$iType = $__Au3Obj_VT_DISPATCH
		Case "Binary"
			; ARRAY OF BYTES !
			Local $tSafeArrayBound = DllStructCreate($__Au3Obj_tagSAFEARRAYBOUND)
			DllStructSetData($tSafeArrayBound, 1, BinaryLen($vVal))
			Local $pSafeArray = __Au3Obj_SafeArrayCreate($__Au3Obj_VT_UI1, 1, DllStructGetPtr($tSafeArrayBound))
			Local $pData
			If 0 = __Au3Obj_SafeArrayAccessData($pSafeArray, $pData) Then
				Local $tData = DllStructCreate("byte[" & BinaryLen($vVal) & "]", $pData)
				DllStructSetData($tData, 1, $vVal)
				__Au3Obj_SafeArrayUnaccessData($pSafeArray)
				$vVal = $pSafeArray
				$vDataType = 'ptr'
				$iType = BitOR($__Au3Obj_VT_ARRAY, $__Au3Obj_VT_UI1)
			EndIf
		Case "Array"
			$vDataType = 'ptr'
			$vVal = __Au3Obj_CreateSafeArrayVariant($vVal)
			$iType = BitOR($__Au3Obj_VT_ARRAY, $__Au3Obj_VT_VARIANT)
		Case Else ;"Keyword" ; all keywords and unknown Vartypes will be handled as "default"
			$iType = $__Au3Obj_VT_ERROR
			$vDataType = 'int'
	EndSwitch
	If $vDataType Then
		DllStructSetData(DllStructCreate($vDataType, DllStructGetPtr($tVar, 'data')), 1, $vVal)

		If @NumParams = 3 Then $iType = $iSpecialType
		DllStructSetData($tVar, 'vt', $iType)
	EndIf
	Return $pVar
EndFunc   ;==>_AutoItObject_VariantSet