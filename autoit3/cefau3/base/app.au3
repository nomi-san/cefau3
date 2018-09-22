#cs
	file: base/app.au3
	author: wuuyi123
#ce

global $tag_CefApp = $tag_CefBase 	& _
	'ptr __OBCLP;' 					& _
	'ptr __ORCS;' 					& _
	'ptr __GRBH;' 					& _
	'ptr __GBPH; '					& _
	'ptr __GRPH;'

global $__params_OnBeforeCommandLineProcessing = 'ptr;ptr;ptr', _
	$__return_OnBeforeCommandLineProcessing = 'none'

global $__params_OnRegisterCustomSchemes = 'ptr;ptr', _
	$__return_OnRegisterCustomSchemes = 'none'

global $__params_GetResourceBundleHandler = 'ptr', _
	$__return_GetResourceBundleHandler = 'ptr'

global $__params_GetBrowserProcessHandler = 'ptr', _
	$__return_GetBrowserProcessHandler = 'ptr'

global $__params_GetRenderProcessHandler = 'ptr', _
	$__return_GetRenderProcessHandler = 'ptr'

func CefApp_Create()
;~ 	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefApp_Create')
;~ 	return @error ? 0 : $ret[0]
	local $struct = _AutoItObject_DllStructCreate($tag_CefApp)
	$struct.size = Cef_StructSize(1);

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddMethod($struct, 'OnBeforeCommandLineProcessing', '__CefApp_OBCLP')
	_AutoItObject_AddMethod($struct, 'OnRegisterCustomSchemes', '__CefApp_ORCS')
	_AutoItObject_AddMethod($struct, 'GetResourceBundleHandler', '__CefApp_GRBH')
	_AutoItObject_AddMethod($struct, 'GetBrowserProcessHandler', '__CefApp_GBPH')
	_AutoItObject_AddMethod($struct, 'GetRenderProcessHandler', '__CefApp_GRPH')

	return $struct
endfunc

func __CefApp_OBCLP($self, $func = null)
	if @numparams == 1 then return $self.__OBCLP

	local $cb = dllcallbackregister($func, $__return_OnBeforeCommandLineProcessing, $__params_OnBeforeCommandLineProcessing)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnBeforeCommandLineProcessing', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefApp_ORCS($self, $func = null)
	if @numparams == 1 then return $self.__ORCS

	local $cb = dllcallbackregister($func, $__return_OnRegisterCustomSchemes, $__params_OnRegisterCustomSchemes)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnRegisterCustomSchemes', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefApp_GRBH($self, $func = null)
	if @numparams == 1 then return $self.__GRBH

	local $cb = dllcallbackregister($func, $__return_GetResourceBundleHandler, $__params_GetResourceBundleHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetResourceBundleHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefApp_GBPH($self, $func = null)
	if @numparams == 1 then return $self.__GBPH

	local $cb = dllcallbackregister($func, $__return_GetBrowserProcessHandler, $__params_GetBrowserProcessHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetBrowserProcessHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefApp_GRPH($self, $func = null)
	if @numparams == 1 then return $self.__GRPH

	local $cb = dllcallbackregister($func, $__return_GetRenderProcessHandler, $__params_GetRenderProcessHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetRenderProcessHandler', 'ptr', $self.ptr, 'ptr', dllcallbackgetptr($cb))
endfunc

; static function /////////////////////////////////////////////

func CefExecuteProcess($CefMainArgs, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefExecuteProcess', _
		'ptr', $CefMainArgs, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefInitialize($CefMainArgs, $CefSettings, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefInitialize', _
		'ptr', $CefMainArgs, _
		'ptr', $CefSettings, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefShutdown()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefShutdown')
endfunc

func CefDoMessageLoopWork()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDoMessageLoopWork')
endfunc

func CefRunMessageLoop()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRunMessageLoop')
endfunc

func CefQuitMessageLoop()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefQuitMessageLoop')
endfunc

func CefSetOSModalLoop($osModalLoop)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefSetOSModalLoop', _
		'int', $osModalLoop _
	)
endfunc

func CefEnableHighDPISupport()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefEnableHighDPISupport')
endfunc

; ////////////////////////////////////////////

func __Cef_ExecuteProcess($self, $CefMainArgs, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefExecuteProcess', _
		'ptr', $CefMainArgs, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func __Cef_Initialize($self, $CefMainArgs, $CefSettings, $CefApp)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefInitialize', _
		'ptr', $CefMainArgs, _
		'ptr', $CefSettings, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func __Cef_Shutdown($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefShutdown')
endfunc

func __Cef_DoMessageLoopWork($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDoMessageLoopWork')
endfunc

func __Cef_RunMessageLoop($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRunMessageLoop')
endfunc

func __Cef_QuitMessageLoop($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefQuitMessageLoop')
endfunc

func Cef_SetOSModalLoop($self, $osModalLoop)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefSetOSModalLoop', _
		'int', $osModalLoop _
	)
endfunc

func __Cef_EnableHighDPISupport($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefEnableHighDPISupport')
endfunc