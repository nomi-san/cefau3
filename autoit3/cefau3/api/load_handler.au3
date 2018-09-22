#cs
	file: api/load_handler.au3
	author: wuuyi123
#ce

global $__params_OnLoadingStateChange = 'ptr;ptr;int;int;int', _
	$__return_OnLoadingStateChange = 'none'

global $__params_OnLoadStart = 'ptr;ptr;ptr;int', _
	$__return_OnLoadStart = 'none'

global $__params_OnLoadEnd = 'ptr;ptr;ptr;int', _
	$__return_OnLoadEnd = 'none'

global $__params_OnLoadError = 'ptr;ptr;ptr;int;ptr;ptr', _
	$__return_OnLoadError = 'none'

func CefLoadHandler_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefLoadHandler_Create')
	return @error ? null : $ret[0]
endfunc

func CefLoadHandler_OnLoadingStateChange($self, $func)
    local $cb = ($func) ? dllcallbackregister($func, $__return_OnLoadingStateChange, $__params_OnLoadingStateChange) : null
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadingStateChange', 'ptr', $self, 'ptr', ($cb) ? dllcallbackgetptr($cb) : null)
endfunc

func CefLoadHandler_OnLoadStart($self, $func)
    local $cb = ($func) ? dllcallbackregister($func, $__return_OnLoadStart, $__params_OnLoadStart) : null
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadStart', 'ptr', $self, 'ptr', ($cb) ? dllcallbackgetptr($cb) : null)
endfunc

func CefLoadHandler_OnLoadEnd($self, $func)
    local $cb = ($func) ? dllcallbackregister($func, $__return_OnLoadEnd, $__params_OnLoadEnd) : null
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadEnd', 'ptr', $self, 'ptr', ($cb) ? dllcallbackgetptr($cb) : null)
endfunc

func CefLoadHandler_OnLoadError($self, $func)
    local $cb = ($func) ? dllcallbackregister($func, $__return_OnLoadError, $__params_OnLoadError) : null
    if @error then return
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefLoadHandler_OnLoadError', 'ptr', $self, 'ptr', ($cb) ? dllcallbackgetptr($cb) : null)
endfunc

