#cs
	file: api/geolocation_handler.au3
	author: wuuyi123
#ce

#include-once

; CefGeolocationHandler
; ==================================================

global $tag_CefGeolocationHandler = ( _
	$tag_CefBase 	& _
	'ptr[2];'		& _
	'char __ORGP[100];'	& _
	'char __OCGP[100];'	_
)

global $__CefGeolocationHandler__ORGP = Cef_CallbackRegister(__CefGeolocationHandler__ORGP, 'int', 	'ptr;ptr;ptr;int;ptr')
global $__CefGeolocationHandler__OCGP = Cef_CallbackRegister(__CefGeolocationHandler__OCGP, 'none', 'ptr;ptr;int')

; ==================================================

func CefGeolocationHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefGeolocationHandler, 'CefGeolocationHandler_Create', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'OnRequestGeolocationPermission', 	'__CefGeolocationHandler_ORGP')
	CefStruct_AddMethod($struct, 'OnCancelGeolocationPermission', 	'__CefGeolocationHandler_OCGP')

	return $struct
endfunc

func __CefGeolocationHandler_ORGP($self, $func = null)
	if @NumParams == 1 then return $self.__ORGP

	$self.__ORGP = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefGeolocationHandler_OnRequestGeolocationPermission', 'ptr', $self.__pointer__, 'ptr', $__CefGeolocationHandler__ORGP)
endfunc

func __CefGeolocationHandler_OCGP($self, $func = null)
	if @NumParams == 1 then return $self.__OCGP

	$self.__OCGP = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefGeolocationHandler_OnCancelGeolocationPermission', 'ptr', $self.__pointer__, 'ptr', $__CefGeolocationHandler__OCGP)
endfunc

; ==================================================

func __CefGeolocationHandler__ORGP($self, $browser, $requesting_url, $request_id, $callback)
	$self 		= CefGeolocationHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	;$request_id

	;$callback

	return call($self.__ORGP, $self, $browser, $requesting_url, $request_id, $callback)
endfunc

func __CefGeolocationHandler__OCGP($self, $browser, $request_id)
	$self 		= CefGeolocationHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	call($self.__OCGP, $self, $browser, $request_id)
endfunc