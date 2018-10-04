#cs
	file: base/app.au3
	author: wuuyi123
#ce

#include-once

; CefApp
; ==================================================

global $tag_CefApp = ( _
	$tag_CefBase 			& _
	'ptr[5];' 				& _
	'char __OBCLP[100];' 	& _
	'char __ORCS[100];' 	& _
	'char __GRBH[100];' 	& _
	'char __GBPH[100]; '	& _
	'char __GRPH[100];' 	_
)

global $__CefApp__OBCLP	= Cef_CallbackRegister(__CefApp__OBCLP, 'none', 'ptr;ptr;ptr')
global $__CefApp__ORCS	= Cef_CallbackRegister(__CefApp__ORCS, 	'none', 'ptr;ptr')
global $__CefApp__GRBH	= Cef_CallbackRegister(__CefApp__GRBH, 	'ptr', 	'ptr')
global $__CefApp__GBPH	= Cef_CallbackRegister(__CefApp__GBPH, 	'ptr', 	'ptr')
global $__CefApp__GRPH	= Cef_CallbackRegister(__CefApp__GRPH, 	'ptr', 	'ptr')

; ==================================================

func CefApp_Create($ptr = null)
	local $self = CefObject_Create('CefApp', $ptr)

	CefObject_AddMethod($self, 'OnBeforeCommandLineProcessing', '__CefApp_OBCLP')
	CefObject_AddMethod($self, 'OnRegisterCustomSchemes', 		'__CefApp_ORCS')
	CefObject_AddMethod($self, 'GetResourceBundleHandler', 		'__CefApp_GRBH')
	CefObject_AddMethod($self, 'GetBrowserProcessHandler', 		'__CefApp_GBPH')
	CefObject_AddMethod($self, 'GetRenderProcessHandler', 		'__CefApp_GRPH')

	return $self
endfunc

func __CefApp_OBCLP($self, $func = null)
	if @numparams == 1 then return $self.__OBCLP

	$self.__OBCLP = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnBeforeCommandLineProcessing', 'ptr', $self.__ptr, 'ptr', $__CefApp__OBCLP)
endfunc

func __CefApp_ORCS($self, $func = null)
	if @numparams == 1 then return $self.__ORCS

	$self.__ORCS = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OnRegisterCustomSchemes', 'ptr', $self.__ptr, 'ptr', $__CefApp__ORCS)
endfunc

func __CefApp_GRBH($self, $func = null)
	if @numparams == 1 then return $self.__GRBH

	$self.__GRBH = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetResourceBundleHandler', 'ptr', $self.__ptr, 'ptr', $__CefApp__GRBH)
endfunc

func __CefApp_GBPH($self, $func = null)
	if @numparams == 1 then return $self.__GBPH

	$self.__GBPH = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetBrowserProcessHandler', 'ptr', $self.__ptr, 'ptr', $__CefApp__GBPH)
endfunc

func __CefApp_GRPH($self, $func = null)
	if @numparams == 1 then return $self.__GRPH

	$self.__GRPH = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GetRenderProcessHandler', 'ptr', $self.__ptr, 'ptr', $__CefApp__GRPH)
endfunc

; ==================================================

func __CefApp__OBCLP($self, $process_type, $command_line)
	$self 		= CefApp_Create($self)
	$process_type = CefString_Read($process_type)
	;$command_line = CefCommandLine_Create($command_line)

	call($self.__OBCLP, $self, $process_type, $command_line)
endfunc

func __CefApp__ORCS($self, $registrar)
	$self = CefApp_Create($self)
	;$registrar = CefSchemeRegistrar_Create($registrar)

	call($self.__ORCS, $self, $registrar)
endfunc

func __CefApp__GRBH($self, $registrar)
	$self = CefApp_Create($self)

	return call($self.__GRBH, $self)
endfunc

func __CefApp__GBPH($self)
	$self = CefApp_Create($self)

	return call($self.__GBPH, $self)
endfunc

func __CefApp__GRPH($self)
	$self = CefApp_Create($self)

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