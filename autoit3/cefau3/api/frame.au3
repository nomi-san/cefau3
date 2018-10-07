#cs
	file: api/frame.au3
	author: wuuyi123
#ce

#include-once

; CefFrame
; ==================================================

global $__CefFrame = null

; ==================================================

func CefFrame_Create($ptr = null)
	if ($__CefFrame == null) then
		$__CefFrame = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefFrame, '__ptr')
		_AutoItObject_AddProperty($__CefFrame, '__type', 1, 'CefFrame')

		_AutoItObject_AddMethod($__CefFrame, 'IsValid',			 '__CefFrame_IsValid')
		_AutoItObject_AddMethod($__CefFrame, 'Undo',				 '__CefFrame_Undo')
		_AutoItObject_AddMethod($__CefFrame, 'Redo',				 '__CefFrame_Redo')
		_AutoItObject_AddMethod($__CefFrame, 'Cut',				 '__CefFrame_Cut')
		_AutoItObject_AddMethod($__CefFrame, 'Copy',				 '__CefFrame_Copy')
		_AutoItObject_AddMethod($__CefFrame, 'Paste',				 '__CefFrame_Paste')
		_AutoItObject_AddMethod($__CefFrame, 'Delete',			 '__CefFrame_Delete')
		_AutoItObject_AddMethod($__CefFrame, 'SelectAll',			 '__CefFrame_SelectAll')
		_AutoItObject_AddMethod($__CefFrame, 'ViewSource',		 '__CefFrame_ViewSource')
		_AutoItObject_AddMethod($__CefFrame, 'GetSource',			 '__CefFrame_GetSource')
		_AutoItObject_AddMethod($__CefFrame, 'GetText',			 '__CefFrame_GetText')
		_AutoItObject_AddMethod($__CefFrame, 'LoadRequest',		 '__CefFrame_LoadRequest')
		_AutoItObject_AddMethod($__CefFrame, 'LoadURL',			 '__CefFrame_LoadUrl')
		_AutoItObject_AddMethod($__CefFrame, 'LoadString',		 '__CefFrame_LoadString')
		_AutoItObject_AddMethod($__CefFrame, 'ExecuteJavaScript',	 '__CefFrame_ExecuteJavaScript')
		_AutoItObject_AddMethod($__CefFrame, 'IsMain',			 '__CefFrame_IsMain')
		_AutoItObject_AddMethod($__CefFrame, 'IsFocused',			 '__CefFrame_IsFocused')
		_AutoItObject_AddMethod($__CefFrame, 'GetName',			 '__CefFrame_GetName')
		_AutoItObject_AddMethod($__CefFrame, 'GetIdentifier',		 '__CefFrame_GetIdentifier')
		_AutoItObject_AddMethod($__CefFrame, 'GetParent',			 '__CefFrame_GetParent')
		_AutoItObject_AddMethod($__CefFrame, 'GetURL',			 '__CefFrame_GetUrl')
		_AutoItObject_AddMethod($__CefFrame, 'GetBrowser',		 '__CefFrame_GetBrowser')
		_AutoItObject_AddMethod($__CefFrame, 'GetV8Context',		 '__CefFrame_GetV8Context')
		_AutoItObject_AddMethod($__CefFrame, 'VisitDOM',			 '__CefFrame_VisitDOM')
	endif

	local $self = _AutoItObject_Create($__CefFrame)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

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

func __CefFrame_ExecuteJavaScript($self, $code = null, $script_url = null, $start_line = 0)
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