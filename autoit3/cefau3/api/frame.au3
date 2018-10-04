#cs
	file: api/frame.au3
	author: wuuyi123
#ce

#include-once

; CefFrame
; ==================================================

func CefFrame_Create($ptr = null)
	local $self = CefObject_Create('CefFrame', $ptr)

	CefObject_AddMethod($self, 'IsValid',			 '__CefFrame_IsValid')
	CefObject_AddMethod($self, 'Undo',				 '__CefFrame_Undo')
	CefObject_AddMethod($self, 'Redo',				 '__CefFrame_Redo')
	CefObject_AddMethod($self, 'Cut',				 '__CefFrame_Cut')
	CefObject_AddMethod($self, 'Copy',				 '__CefFrame_Copy')
	CefObject_AddMethod($self, 'Paste',				 '__CefFrame_Paste')
	CefObject_AddMethod($self, 'Delete',			 '__CefFrame_Delete')
	CefObject_AddMethod($self, 'SelectAll',			 '__CefFrame_SelectAll')
	CefObject_AddMethod($self, 'ViewSource',		 '__CefFrame_ViewSource')
	CefObject_AddMethod($self, 'GetSource',			 '__CefFrame_GetSource')
	CefObject_AddMethod($self, 'GetText',			 '__CefFrame_GetText')
	CefObject_AddMethod($self, 'LoadRequest',		 '__CefFrame_LoadRequest')
	CefObject_AddMethod($self, 'LoadUrl',			 '__CefFrame_LoadUrl')
	CefObject_AddMethod($self, 'LoadString',		 '__CefFrame_LoadString')
	CefObject_AddMethod($self, 'ExecuteJavaScript',	 '__CefFrame_ExecuteJavaScript')
	CefObject_AddMethod($self, 'IsMain',			 '__CefFrame_IsMain')
	CefObject_AddMethod($self, 'IsFocused',			 '__CefFrame_IsFocused')
	CefObject_AddMethod($self, 'GetName',			 '__CefFrame_GetName')
	CefObject_AddMethod($self, 'GetIdentifier',		 '__CefFrame_GetIdentifier')
	CefObject_AddMethod($self, 'GetParent',			 '__CefFrame_GetParent')
	CefObject_AddMethod($self, 'GetUrl',			 '__CefFrame_GetUrl')
	CefObject_AddMethod($self, 'GetBrowser',		 '__CefFrame_GetBrowser')
	CefObject_AddMethod($self, 'GetV8Context',		 '__CefFrame_GetV8Context')
	CefObject_AddMethod($self, 'VisitDOM',			 '__CefFrame_VisitDOM')

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