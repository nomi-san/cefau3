#cs
	file: api/render_process_handler.au3
	author: wuuyi123
#ce

global $tag_CefRenderProcessHandler = ( _
	$tag_CefBase & _
	'ptr OnRenderThreadCreated;' & _
	'ptr OnWebKitInitialized;' & _
	'ptr OnBrowserCreated;' & _
	'ptr OnBrowserDestroyed;' & _
	'ptr GetLoadHandler;' & _
	'ptr OnBeforeNavigation;' & _
	'ptr OnContextCreated;' & _
	'ptr OnContextReleased;' & _
	'ptr OnUncaughtException;' & _
	'ptr OnFocusedNodeChanged;' & _
	'ptr OnProcessMessageReceived;' _
)

global $__params_OnRenderThreadCreated = 'ptr;ptr', _
	$__return_OnRenderThreadCreated = 'none'

global $__params_OnWebKitInitialized = 'ptr', _
	$__return_OnWebKitInitialized = 'none'

global $__params_OnBrowserCreated = 'ptr;ptr', _
	$__return_OnBrowserCreated = 'none'

global $__params_OnBrowserDestroyed = 'ptr;ptr', _
	$__return_OnBrowserDestroyed = 'none'

global $__params_GetLoadHandler = 'ptr', _
	$__return_GetLoadHandler = 'ptr'

global $__params_OnBeforeNavigation = 'ptr;ptr;ptr;ptr;int;int', _
	$__return_OnBeforeNavigation = 'int'

global $__params_OnContextCreated = 'ptr;ptr;ptr;ptr', _
	$__return_OnContextCreated = 'none'

global $__params_OnContextReleased = 'ptr;ptr;ptr;ptr', _
	$__return_OnContextReleased = 'none'

global $__params_OnUncaughtException = 'ptr;ptr;ptr;ptr;ptr;ptr', _
	$__return_OnUncaughtException = 'none'

global $__params_OnFocusedNodeChanged = 'ptr;ptr;ptr;ptr', _
	$__return_OnFocusedNodeChanged = 'none'

global $__params_OnProcessMessageReceived = 'ptr;ptr;int;ptr', _
	$__return_OnProcessMessageReceived = 'int'

func CefRenderProcessHandler_Create()
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefRenderProcessHandler_Create')
	return @error ? 0 : $ret[0]
endfunc

func CefRenderProcessHandler_OnRenderThreadCreated($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnRenderThreadCreated, $__params_OnRenderThreadCreated)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnRenderThreadCreated', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnWebKitInitialized($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnWebKitInitialized, $__params_OnWebKitInitialized)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnWebKitInitialized', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnBrowserCreated($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnBrowserCreated, $__params_OnBrowserCreated)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBrowserCreated', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnBrowserDestroyed($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnBrowserDestroyed, $__params_OnBrowserDestroyed)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBrowserDestroyed', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_GetLoadHandler($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_GetLoadHandler, $__params_GetLoadHandler)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_GetLoadHandler', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnBeforeNavigation($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnBeforeNavigation, $__params_OnBeforeNavigation)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnBeforeNavigation', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnContextCreated($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnContextCreated, $__params_OnContextCreated)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnContextCreated', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnContextReleased($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnContextReleased, $__params_OnContextReleased)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnContextReleased', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnUncaughtException($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnUncaughtException, $__params_OnUncaughtException)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnUncaughtException', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnFocusedNodeChanged($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnFocusedNodeChanged, $__params_OnFocusedNodeChanged)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnFocusedNodeChanged', 'ptr', $self, 'ptr', $ptr)
endfunc

func CefRenderProcessHandler_OnProcessMessageReceived($self, $func = null)
	local $ptr = null
	if ($func) then
		local $cb = dllcallbackregister($func, $__return_OnProcessMessageReceived, $__params_OnProcessMessageReceived)
		if not @error then $ptr = dllcallbackgetptr($cb)
	endif
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRenderProcessHandler_OnProcessMessageReceived', 'ptr', $self, 'ptr', $ptr)
endfunc