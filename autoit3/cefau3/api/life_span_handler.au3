#cs
	file: api/life_span_handler.au3
	author: wuuyi123
#ce

#include-once

; CefLifeSpanHandler
; ==================================================

global $__CefLifeSpanHandler__OBP 	= Cef_CallbackRegister(__CefLifeSpanHandler__OBP, 	'int', 	'ptr;ptr;ptr;ptr;ptr;int;ptr;ptr;ptr;ptr;ptr')
global $__CefLifeSpanHandler__OAC 	= Cef_CallbackRegister(__CefLifeSpanHandler__OAC, 	'none', 'ptr;ptr')
global $__CefLifeSpanHandler__DC 	= Cef_CallbackRegister(__CefLifeSpanHandler__DC, 	'int', 	'ptr;ptr')
global $__CefLifeSpanHandler__OBC 	= Cef_CallbackRegister(__CefLifeSpanHandler__OBC, 	'none', 'ptr;ptr')

; ==================================================

func CefLifeSpanHandler_Create($ptr = null)
	local $self = CefObject_Create('CefLifeSpanHandler', $ptr)

	CefObject_AddMethod($self, 'OnBeforePopup', 	'__CefLifeSpanHandler_OBP')
	CefObject_AddMethod($self, 'OnAfterCreated',	'__CefLifeSpanHandler_OAC')
	CefObject_AddMethod($self, 'DoClose', 			'__CefLifeSpanHandler_DC')
	CefObject_AddMethod($self, 'OnBeforeClose', 	'__CefLifeSpanHandler_OBC')

	return $self
endfunc

func __CefLifeSpanHandler_OBP($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBP', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OBP', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforePopup', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLifeSpanHandler__OBP : null)
endfunc

func __CefLifeSpanHandler_OAC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OAC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OAC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnAfterCreated', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLifeSpanHandler__OAC : null)
endfunc

func __CefLifeSpanHandler_DC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_DC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_DC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_DoClose', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLifeSpanHandler__DC : null)
endfunc

func __CefLifeSpanHandler_OBC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_Set_OBC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLifeSpanHandler_OnBeforeClose', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefLifeSpanHandler__OBC : null)
endfunc

; ==================================================

func __CefLifeSpanHandler__OBP($self, $browser, $frame, $target_url, $target_frame_name, $target_disposition, $windowInfo, $client, $settings, $no_javascript_access)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBP', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)

	return call($self, $browser, $frame, $target_url, $target_frame_name, $target_disposition, $windowInfo, $client, $settings, $no_javascript_access)
endfunc

func __CefLifeSpanHandler__OAC($self, $browser)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OAC', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)

	return call($self, $browser)
endfunc

func __CefLifeSpanHandler__DC($self, $browser)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_DC', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)

	return call($self, $browser)
endfunc

func __CefLifeSpanHandler__OBC($self, $browser)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefLifeSpanHandler_Get_OBC', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)

	return call($self, $browser)
endfunc