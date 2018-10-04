#cs
	file: api/frame.au3
	author: wuuyi123
#ce

#include-once

; CefFrame
; ==================================================

global $tag_CefFrane = ( _
    $tag_CefBase & _
    'ptr[24];' _
)

func CefFrame_Create($ptr = null)
    local $struct = CefStruct_Create($tag_CefFrane, 'CefFrame', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'IsValid', '__CefFrame_IsValid')
	CefStruct_AddMethod($struct, 'Undo', '__CefFrame_Undo')
	CefStruct_AddMethod($struct, 'Redo', '__CefFrame_Redo')
	CefStruct_AddMethod($struct, 'Cut', '__CefFrame_Cut')
	CefStruct_AddMethod($struct, 'Copy', '__CefFrame_Copy')
	CefStruct_AddMethod($struct, 'Paste', '__CefFrame_Paste')
	CefStruct_AddMethod($struct, 'Delete', '__CefFrame_Delete')
	CefStruct_AddMethod($struct, 'SelectAll', '__CefFrame_SelectAll')
	CefStruct_AddMethod($struct, 'ViewSource', '__CefFrame_ViewSource')
	CefStruct_AddMethod($struct, 'GetSource', '__CefFrame_GetSource')
	CefStruct_AddMethod($struct, 'GetText', '__CefFrame_GetText')
	CefStruct_AddMethod($struct, 'LoadRequest', '__CefFrame_LoadRequest')
	CefStruct_AddMethod($struct, 'LoadUrl', '__CefFrame_LoadUrl')
	CefStruct_AddMethod($struct, 'LoadString', '__CefFrame_LoadString')
	CefStruct_AddMethod($struct, 'ExecuteJavaScript', '__CefFrame_ExecuteJavaScript')
	CefStruct_AddMethod($struct, 'IsMain', '__CefFrame_IsMain')
	CefStruct_AddMethod($struct, 'IsFocused', '__CefFrame_IsFocused')
	CefStruct_AddMethod($struct, 'GetName', '__CefFrame_GetName')
	CefStruct_AddMethod($struct, 'GetIdentifier', '__CefFrame_GetIdentifier')
	CefStruct_AddMethod($struct, 'GetParent', '__CefFrame_GetParent')
	CefStruct_AddMethod($struct, 'GetUrl', '__CefFrame_GetUrl')
	CefStruct_AddMethod($struct, 'GetBrowser', '__CefFrame_GetBrowser')
	CefStruct_AddMethod($struct, 'GetV8Context', '__CefFrame_GetV8Context')
	CefStruct_AddMethod($struct, 'VisitDOM', '__CefFrame_VisitDOM')

	return $struct
endfunc

func __CefFrame_IsValid($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefFrame_IsValid', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_Undo($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Undo', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_Redo($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Redo', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_Cut($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Cut', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_Copy($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Copy', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_Paste($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Paste', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_Delete($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Delete', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_SelectAll($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_SelectAll', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_ViewSource($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ViewSource', 'ptr', $self.__pointer__)
endfunc

func __CefFrame_GetSource($self, $visitor = null)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetSource', 'ptr', $self.__pointer__, 'ptr', $visitor)
endfunc

func __CefFrame_GetText($self, $visitor = null)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetText', 'ptr', $self.__pointer__, 'ptr', $visitor)
endfunc

func __CefFrame_LoadRequest($self, $request = null)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadRequest', 'ptr', $self.__pointer__, 'ptr', $request)
endfunc

func __CefFrame_LoadUrl($self, $url)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadUrl', 'ptr', $self.__pointer__, 'wstr', $url)
endfunc

func __CefFrame_LoadString($self, $string_val = null, $url = null)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadString', 'ptr', $self.__pointer__, 'wstr', $string_val, 'wstr', $url)
endfunc

func __CefFrame_ExecuteJavaScript($self, $code = null, $script_url = null, $start_line = 0)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ExecuteJavaScript', 'ptr', $self.__pointer__, 'wstr', $code, 'wstr', $script_url, 'int', $start_line)
endfunc

func __CefFrame_IsMain($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsMain', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_IsFocused($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsFocused', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetName($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetName', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetIdentifier($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_GetIdentifier', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetParent($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetParent', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetUrl($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetUrl', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetBrowser', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_GetV8Context($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetV8Context', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefFrame_VisitDOM($self, $visitor = null)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_VisitDOM', 'ptr', $self.__pointer__, 'ptr', $visitor)
endfunc