#cs
	file: types/ptr.au3
	author: wuuyi123
#ce

#include-once

; CefInt
; ==================================================

global $tag_CefInt = 'int val;'

func CefInt_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefInt, 'CefInt', $ptr)

	return $struct
endfunc

; CefLong
; ==================================================

global $tag_CefLong = 'long val;'

func CefLong_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefLong, 'CefLong', $ptr)

	return $struct
endfunc

; CefDouble
; ==================================================

global $tag_CefDouble = 'double val;'

func CefDouble_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefDouble, 'CefDouble', $ptr)

	return $struct
endfunc