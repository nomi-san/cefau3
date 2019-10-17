#cs
	file: api/frame.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefFrame
; ==================================================

func CefFrame_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefFrame')

		.AddMethod('IsValid',		'__CefFrame_IsValid')
		.AddMethod('Undo', 			'__CefFrame_Undo')
		.AddMethod('Redo',			'__CefFrame_Redo')
		.AddMethod('Cut',			'__CefFrame_Cut')
		.AddMethod('Copy',			'__CefFrame_Copy')
		.AddMethod('Paste',			'__CefFrame_Paste')
		.AddMethod('Delete',		'__CefFrame_Delete')
		.AddMethod('SelectAll',		'__CefFrame_SelectAll')
		.AddMethod('ViewSource',	'__CefFrame_ViewSource')
		.AddMethod('GetSource',		'__CefFrame_GetSource')
		.AddMethod('GetText',		'__CefFrame_GetText')
		.AddMethod('LoadRequest',	'__CefFrame_LoadRequest')
		.AddMethod('LoadURL',		'__CefFrame_LoadUrl')
		.AddMethod('LoadString',	'__CefFrame_LoadString')
		.AddMethod('ExecuteJS', 	'__CefFrame_ExecuteJavaScript')
		.AddMethod('IsMain',		'__CefFrame_IsMain')
		.AddMethod('IsFocused',		'__CefFrame_IsFocused')
		.AddMethod('GetName',		'__CefFrame_GetName')
		.AddMethod('GetIdentifier', '__CefFrame_GetIdentifier')
		.AddMethod('GetParent',		'__CefFrame_GetParent')
		.AddMethod('GetURL',		'__CefFrame_GetUrl')
		.AddMethod('GetBrowser',	'__CefFrame_GetBrowser')
		.AddMethod('GetV8Context', 	'__CefFrame_GetV8Context')
		.AddMethod('VisitDOM',		'__CefFrame_VisitDOM')

		global const $__CefFrame = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Init', 'idispatch', $__CefFrame)

endfunc

; ==================================================

func CefFrame_Create($ptr)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefFrame_Create', 'ptr', $ptr)[0]
endfunc

; ==================================================

func __CefFrame_IsValid($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefFrame_IsValid', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_Undo($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Undo', 'ptr', $self.__ptr)
endfunc

func __CefFrame_Redo($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Redo', 'ptr', $self.__ptr)
endfunc

func __CefFrame_Cut($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Cut', 'ptr', $self.__ptr)
endfunc

func __CefFrame_Copy($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Copy', 'ptr', $self.__ptr)
endfunc

func __CefFrame_Paste($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Paste', 'ptr', $self.__ptr)
endfunc

func __CefFrame_Delete($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Delete', 'ptr', $self.__ptr)
endfunc

func __CefFrame_SelectAll($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_SelectAll', 'ptr', $self.__ptr)
endfunc

func __CefFrame_ViewSource($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ViewSource', 'ptr', $self.__ptr)
endfunc

func __CefFrame_GetSource($self, $visitor = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetSource', 'ptr', $self.__ptr, 'ptr', $visitor)
endfunc

func __CefFrame_GetText($self, $visitor = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetText', 'ptr', $self.__ptr, 'ptr', $visitor)
endfunc

func __CefFrame_LoadRequest($self, $request = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadRequest', 'ptr', $self.__ptr, 'ptr', $request)
endfunc

func __CefFrame_LoadUrl($self, $url)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadUrl', 'ptr', $self.__ptr, 'wstr', $url)
endfunc

func __CefFrame_LoadString($self, $string_val = null, $url = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadString', 'ptr', $self.__ptr, 'wstr', $string_val, 'wstr', $url)
endfunc

func __CefFrame_ExecuteJavaScript($self, $code = null, $script_url = '', $start_line = 0)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ExecuteJavaScript', 'ptr', $self.__ptr, 'wstr', $code, 'wstr', $script_url, 'int', $start_line)
endfunc

func __CefFrame_IsMain($self)
	local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsMain', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_IsFocused($self)
	local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsFocused', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetName($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetName', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetIdentifier($self)
	local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_GetIdentifier', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetParent($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetParent', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetUrl', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetBrowser($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetBrowser', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetV8Context($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetV8Context', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefFrame_VisitDOM($self, $visitor = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_VisitDOM', 'ptr', $self.__ptr, 'ptr', $visitor)
endfunc