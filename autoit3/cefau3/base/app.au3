#cs
	file: base/app.au3
	author: wuuyi123
#ce

; CefApp
; ==================================================

global $tag_CefApp = ( _
	$tag_CefBase & 'ptr;ptr;ptr;ptr;ptr;' & _
	'char __OBCLP[100];' 	& _
	'char __ORCS[100];' 	& _
	'char __GRBH[100];' 	& _
	'char __GBPH[100]; '	& _
	'char __GRPH[100];' 	_
)

global $__Cef__OnBeforeCommandLineProcessing	= Cef_CallbackRegister(__Cef__OnBeforeCommandLineProcessing, 'none', 'ptr;ptr;ptr')
global $__Cef__OnRegisterCustomSchemes			= Cef_CallbackRegister(__Cef__OnRegisterCustomSchemes, 'none', 'ptr;ptr')
global $__Cef__GetResourceBundleHandler			= Cef_CallbackRegister(__Cef__GetResourceBundleHandler, 'ptr', 'ptr')
global $__Cef__GetBrowserProcessHandler			= Cef_CallbackRegister(__Cef__GetBrowserProcessHandler, 'ptr', 'ptr')
global $__Cef__GetRenderProcessHandler			= Cef_CallbackRegister(__Cef__GetRenderProcessHandler, 'ptr', 'ptr')

; ==================================================

func CefApp_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefApp, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefApp)
	$struct.size = $struct.__size__

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefApp')

	_AutoItObject_AddMethod($struct, 'OnBeforeCommandLineProcessing', '__CefApp_OBCLP')
	_AutoItObject_AddMethod($struct, 'OnRegisterCustomSchemes', '__CefApp_ORCS')
	_AutoItObject_AddMethod($struct, 'GetResourceBundleHandler', '__CefApp_GRBH')
	_AutoItObject_AddMethod($struct, 'GetBrowserProcessHandler', '__CefApp_GBPH')
	_AutoItObject_AddMethod($struct, 'GetRenderProcessHandler', '__CefApp_GRPH')

	return $struct
endfunc

func __CefApp_OBCLP($self, $func = null)
	if @numparams == 1 then return $self.__OBCLP

	$self.__OBCLP = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnBeforeCommandLineProcessing', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnBeforeCommandLineProcessing)
endfunc

func __CefApp_ORCS($self, $func = null)
	if @numparams == 1 then return $self.__ORCS

	$self.__ORCS = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnRegisterCustomSchemes', 'ptr', $self.__pointer__, 'ptr', $__Cef__OnRegisterCustomSchemes)
endfunc

func __CefApp_GRBH($self, $func = null)
	if @numparams == 1 then return $self.__GRBH

	$self.__GRBH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetResourceBundleHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetResourceBundleHandler)
endfunc

func __CefApp_GBPH($self, $func = null)
	if @numparams == 1 then return $self.__GBPH

	$self.__GBPH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetBrowserProcessHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetBrowserProcessHandler)
endfunc

func __CefApp_GRPH($self, $func = null)
	if @numparams == 1 then return $self.__GRPH

	$self.__GRPH = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetRenderProcessHandler', 'ptr', $self.__pointer__, 'ptr', $__Cef__GetRenderProcessHandler)
endfunc

; ==================================================

func __Cef__OnBeforeCommandLineProcessing($ptr, $ptr2, $ptr3)
	local $self = CefApp_Create($ptr)

	call($self.__OBCLP)
endfunc

func __Cef__OnRegisterCustomSchemes($ptr, $ptr2)
	local $self = CefApp_Create($ptr)

	call($self.__ORCS)
endfunc

func __Cef__GetResourceBundleHandler($ptr)
	local $self = CefApp_Create($ptr)

	return call($self.__GRBH, $self)
endfunc

func __Cef__GetBrowserProcessHandler($ptr)
	local $self = CefApp_Create($ptr)

	return call($self.__GBPH, $self)
endfunc

func __Cef__GetRenderProcessHandler($ptr)
	local $self = CefApp_Create($ptr)

	return call($self.__GRPH, $self)
endfunc


; ==================================================
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

; ////////////////////////////

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