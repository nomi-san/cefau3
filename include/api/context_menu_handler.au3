#cs
	file: api/context_menu_handler.au3
	author: wuuyi123
#ce

; CefRunContextMenuCallback
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefRunContextMenuCallback')

	.AddMethod('Continue', 	'__CefRunContextMenuCallback_Continue')
	.AddMethod('Cancel', '__CefRunContextMenuCallback_Cancel')

	global $__CefRunContextMenuCallback = .Object

endwith

; ==================================================

func CefRunContextMenuCallback_Create($ptr)
	local $self = _AutoItObject_Create($__CefRunContextMenuCallback)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefRunContextMenuCallback_Continue($self, $command_id = 0, $event_flags = 0)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRunContextMenuCallback_Continue', 'ptr', $self.__ptr, 'int', $command_id, 'int', $event_flags)
endfunc

func __CefRunContextMenuCallback_Cancel($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRunContextMenuCallback_Cancel', 'ptr', $self.__ptr)
endfunc

; CefContextMenuHandler
; ==================================================

global $__CefContextMenuHandler = null

$__CefContextMenuHandler = _AutoItObject_Create()

_AutoItObject_AddProperty($__CefContextMenuHandler, '__ptr')
_AutoItObject_AddProperty($__CefContextMenuHandler, '__type', 1, 'CefContextMenuHandler')

_AutoItObject_AddMethod($__CefContextMenuHandler, 'OnBeforeContextMenu', 	'__CefContextMenuHandler_OBCM')
_AutoItObject_AddMethod($__CefContextMenuHandler, 'RunContextMenu', '__CefContextMenuHandler_RCM')
_AutoItObject_AddMethod($__CefContextMenuHandler, 'OnContextMenuCommand', '__CefContextMenuHandler_OCMC')
_AutoItObject_AddMethod($__CefContextMenuHandler, 'OnContextMenuDismissed', '__CefContextMenuHandler_OCMD')

global const $__CefContextMenuHandler__OBCM = Cef_CallbackRegister(__CefContextMenuHandler__OBCM, 'none', 'ptr;ptr;ptr;ptr;ptr')
global const $__CefContextMenuHandler__RCM = Cef_CallbackRegister(__CefContextMenuHandler__RCM, 'int', 'ptr;ptr;ptr;ptr;ptr;ptr')
global const $__CefContextMenuHandler__OCMC = Cef_CallbackRegister(__CefContextMenuHandler__OCMC, 'int', 'ptr;ptr;ptr;ptr;int;int')
global const $__CefContextMenuHandler__OCMD = Cef_CallbackRegister(__CefContextMenuHandler__OCMD, 'none', 'ptr;ptr;ptr')

; ==================================================

func CefContextMenuHandler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefContextMenuHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefContextMenuHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefContextMenuHandler_OBCM($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OBCM', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_Set_OBCM', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_OBCM', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefContextMenuHandler__OBCM : null)
endfunc

func __CefContextMenuHandler_RCM($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_RCM', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_Set_RCM', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_RCM', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefContextMenuHandler__RCM : null)
endfunc

func __CefContextMenuHandler_OCMC($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OCMC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_Set_OCMC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_OCMC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefContextMenuHandler__OCMC : null)
endfunc

func __CefContextMenuHandler_OCMD($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OCMD', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_Set_OCMD', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefContextMenuHandler_OCMD', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefContextMenuHandler__OCMD : null)
endfunc

; ==================================================

func __CefContextMenuHandler__OBCM($self, $browser, $frame, $params, $model)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OBCM', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$frame = CefFrame_Create($frame)
	;$params
	;$model

	call($self, $browser, $frame, $params, $model)
endfunc

func __CefContextMenuHandler__RCM($self, $browser, $frame, $params, $model, $callback)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_RCM', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$frame = CefFrame_Create($frame)
	;$params
	;$model
	$callback = CefRunContextMenuCallback_Create($callback)

	return call($self, $browser, $frame, $params, $model, $callback)
endfunc

func __CefContextMenuHandler__OCMC($self, $browser, $frame, $params, $command_id, $event_flags)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OCMC', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$frame = CefFrame_Create($frame)
	;$params
	;$command_id -> int
	;$event_flags -> int

	return call($self, $params, $command_id, $event_flags)
endfunc

func __CefContextMenuHandler__OCMD($self, $browser, $frame)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefContextMenuHandler_Get_OCMD', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$frame = CefFrame_Create($frame)

	call($self, $browser, $frame)
endfunc

; CefContextMenuParams
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefContextMenuParams')

	.AddMethod('GetXCoord', 				'__CefContextMenuParams_GetXCoord')
	.AddMethod('GetYCoord', 				'__CefContextMenuParams_GetYCoord')
	.AddMethod('GetTypeFlags', 				'__CefContextMenuParams_GetTypeFlags')
	.AddMethod('GetLinkUrl', 				'__CefContextMenuParams_GetLinkUrl')
	.AddMethod('GetUnfilteredLinkUrl', 		'__CefContextMenuParams_GetUnfilteredLinkUrl')
	.AddMethod('GetSourceUrl', 				'__CefContextMenuParams_GetSourceUrl')
	.AddMethod('HasImageContents', 			'__CefContextMenuParams_HasImageContents')
	.AddMethod('GetTitleText',				'__CefContextMenuParams_GetTitleText')
	.AddMethod('GetPageUrl', 				'__CefContextMenuParams_GetPageUrl')
	.AddMethod('GetFrameUrl', 				'__CefContextMenuParams_GetFrameUrl')
	.AddMethod('GetFrameCharset', 			'__CefContextMenuParams_GetFrameCharset')
	.AddMethod('GetMediaType', 				'__CefContextMenuParams_GetMediaType')
	.AddMethod('GetMediaStateFlags', 		'__CefContextMenuParams_GetMediaStateFlags')
	.AddMethod('GetSelectionText', 			'__CefContextMenuParams_GetSelectionText')
	.AddMethod('GetMisspelledWord', 		'__CefContextMenuParams_GetMisspelledWord')
	.AddMethod('GetDictionarySuggestions', 	'__CefContextMenuParams_GetDictionarySuggestions')
	.AddMethod('IsEditable', 				'__CefContextMenuParams_IsEditable')
	.AddMethod('IsSpellCheckEnabled', 		'__CefContextMenuParams_IsSpellCheckEnabled')
	.AddMethod('GetEditStateFlags', 		'__CefContextMenuParams_GetEditStateFlags')
	.AddMethod('IsCustomMenu', 				'__CefContextMenuParams_IsCustomMenu')
	.AddMethod('IsPepperMenu', 				'__CefContextMenuParams_IsPepperMenu')

	global $__CefContextMenuParams = .Object

endwith

; ==================================================

func CefContextMenuParams_Create($ptr)
	local $self = _AutoItObject_Create($__CefContextMenuParams)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefContextMenuParams_GetXCoord($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetXCoord', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetYCoord($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetYCoord', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetTypeFlags($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetTypeFlags', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetLinkUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetLinkUrl', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetUnfilteredLinkUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetUnfilteredLinkUrl', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetSourceUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetSourceUrl', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_HasImageContents($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_HasImageContents', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetTitleText($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetTitleText', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetPageUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetPageUrl', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetFrameUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetFrameUrl', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetFrameCharset($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetFrameCharset', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetMediaType($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetMediaType', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetMediaStateFlags($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetMediaStateFlags', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetSelectionText($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetSelectionText', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetMisspelledWord($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefContextMenuParams_GetMisspelledWord', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetDictionarySuggestions($self, $suggestions)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetDictionarySuggestions', $self.__ptr, 'ptr', $suggestions)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_IsEditable($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_IsEditable', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_IsSpellCheckEnabled($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_IsSpellCheckEnabled', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_GetEditStateFlags($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_GetEditStateFlags', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_IsCustomMenu($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_IsCustomMenu', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefContextMenuParams_IsPepperMenu($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefContextMenuParams_IsPepperMenu', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc