#cs
	file: api/geolocation.au3
	author: wuuyi123
#ce

#include-once

; CefGeolocationCallback
; ==================================================

global $tag_CefGeolocationCallback = ( _
	$tag_CefBase 		& _
	'ptr;'				& _
	'char __OLU[100];'	_
)

global $__CefGeolocationCallback__OLU = Cef_CallbackRegister(__CefGeolocationCallback__OLU, 'none', 'ptr;ptr')

; ==================================================

func CefGeolocationCallback_Create($ptr)
	local $struct = CefStruct_Create($tag_CefGeolocationCallback, 'CefGeolocationCallback', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'OnLocationUpdate', '__CefGeolocationCallback_OLU')

	return $struct
endfunc

func __CefGeolocationCallback_OLU($self, $func = null)
	if @numparams == 1 then return $self.__OLU

	$self.__OLU = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefGeolocationCallback_OnLocationUpdate', 'ptr', $self.__ptr, 'ptr', $__CefGeolocationCallback__OLU)
endfunc

; ==================================================

func __CefGeolocationCallback__OLU($self, $position)
	$self = CefGeolocationCallback_Create($self)
	$position = CefGeoposition_Create($position)

	call($self.__OLU, $self, $position)
endfunc

; static ==================================================

func CefGetGeolocation($callback)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefGetGeolocation', 'ptr', $callback)
	return @error ? 0 : $ret[0]
endfunc