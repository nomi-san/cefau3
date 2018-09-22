#cs
	file: api/frame.au3
	author: wuuyi123
#ce

func CefFrame_IsValid($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefFrame_IsValid', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_Undo($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Undo', 'ptr', $self)
endfunc

func CefFrame_Redo($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Redo', 'ptr', $self)
endfunc

func CefFrame_Cut($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Cut', 'ptr', $self)
endfunc

func CefFrame_Copy($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Copy', 'ptr', $self)
endfunc

func CefFrame_Paste($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Paste', 'ptr', $self)
endfunc

func CefFrame_Delete($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_Delete', 'ptr', $self)
endfunc

func  CefFrame_SelectAll($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_SelectAll', 'ptr', $self)
endfunc

func  CefFrame_ViewSource($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ViewSource', 'ptr', $self)
endfunc

func CefFrame_GetSource($self, $visitor)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetSource', 'ptr', $self, 'ptr', $visitor)
endfunc

func CefFrame_GetText($self, $visitor)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_GetText', 'ptr', $self, 'ptr', $visitor)
endfunc

func CefFrame_LoadRequest($self, $request)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadRequest', 'ptr', $self, 'ptr', $request)
endfunc

func CefFrame_LoadUrl($self, $url)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadUrl', 'ptr', $self, 'wstr', $url)
endfunc

func CefFrame_LoadString($self, $string_val, $url)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_LoadString', 'ptr', $self, 'wstr', $string_val, 'wstr', $url)
endfunc

func CefFrame_ExecuteJavaScript($self, $code, $script_url, $start_line)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_ExecuteJavaScript', 'ptr', $self, 'wstr', $code, 'wstr', $script_url, 'int', $start_line)
endfunc

func CefFrame_IsMain($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsMain', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_IsFocused($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_IsFocused', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetName($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetName', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetIdentifier($self)
    local $ret = dllcall($__Cefau3Dll__, 'long:cdecl', 'CefFrame_GetIdentifier', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetParent($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetParent', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetUrl($self)
    local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefFrame_GetUrl', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetBrowser', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_GetV8Context($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefFrame_GetV8Context', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefFrame_VisitDOM($self, $visitor)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefFrame_VisitDOM', 'ptr', $self, 'ptr', $visitor)
endfunc