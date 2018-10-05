#cs
	file: base/app.au3
	author: wuuyi123
#ce

#include-once

; CefApp
; ==================================================

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
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_OBCLP', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_OBCLP', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_OBCLP', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefApp__OBCLP : null)
endfunc

func __CefApp_ORCS($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_ORCS', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_ORCS', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_ORCS', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefApp__ORCS : null)
endfunc

func __CefApp_GRBH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRBH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GRBH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GRBH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefApp__GRBH : null)
endfunc

func __CefApp_GBPH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GBPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GBPH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GBPH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefApp__GBPH : null)
endfunc

func __CefApp_GRPH($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GRPH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_GRPH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefApp__GRPH : null)
endfunc

; ==================================================

func __CefApp__OBCLP($self, $process_type, $command_line)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_OBCLP', 'ptr', $self)[0]
	$process_type = CefString_Create($process_type)
	;$command_line = CefCommandLine_Create($command_line)

	call($self.__OBCLP, $self, $process_type, $command_line)
endfunc

func __CefApp__ORCS($self, $registrar)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_ORCS', 'ptr', $self)[0]
	;$registrar = CefSchemeRegistrar_Create($registrar)

	call($self, $registrar)
endfunc

func __CefApp__GRBH($self, $registrar)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRBH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefApp__GBPH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GBPH', 'ptr', $self)[0]

	return call($self)
endfunc

func __CefApp__GRPH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRPH', 'ptr', $self)[0]

	return call($self)
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