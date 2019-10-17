#cs
	file: base/app.au3
	author: wuuyi123
#ce

#include-once

; CefApp
; ==================================================

func CefApp_Init()

	with Au3Obj_Class()

		.AddProperty('__ptr')
		.AddProperty('__type', 1, 'CefApp')

		.AddMethod('OnBeforeCommandLineProcessing', '__CefApp_OBCLP')
		.AddMethod('OnRegisterCustomSchemes', 		'__CefApp_ORCS')
		.AddMethod('GetResourceBundleHandler', 		'__CefApp_GRBH')
		.AddMethod('GetBrowserProcessHandler', 		'__CefApp_GBPH')
		.AddMethod('GetRenderProcessHandler', 		'__CefApp_GRPH')

		global const $__CefApp = .Object

	endwith

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Init', _
		'idispatch', $__CefApp, _
		'ptr', $__CefApp__OBCLP, _
		'ptr', $__CefApp__ORCS, _
		'ptr', $__CefApp__GRBH, _
		'ptr', $__CefApp__GBPH, _
		'ptr', $__CefApp__GRPH _
	)

endfunc

global $__CefApp__OBCLP	= Cef_CallbackRegister(__CefApp__OBCLP, 'none', 'str;ptr;ptr')
global $__CefApp__ORCS	= Cef_CallbackRegister(__CefApp__ORCS, 	'none', 'str;ptr')
global $__CefApp__GRBH	= Cef_CallbackRegister(__CefApp__GRBH, 	'ptr', 	'str')
global $__CefApp__GBPH	= Cef_CallbackRegister(__CefApp__GBPH, 	'ptr', 	'str')
global $__CefApp__GRPH	= Cef_CallbackRegister(__CefApp__GRPH, 	'ptr', 	'str')

; ==================================================

func CefApp_Create($ptr = null)
	return dllcall($__Cefau3Dll__, 'idispatch:cdecl', 'CefApp_Create', 'ptr', $ptr)[0]
endfunc

func __CefApp_OBCLP($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_OBCLP', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_OBCLP', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefApp_ORCS($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_ORCS', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_ORCS', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefApp_GRBH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRBH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GRBH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefApp_GBPH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GBPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GBPH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

func __CefApp_GRPH($self, $func = null)
	if @numparams == 1 then _
		return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefApp_Get_GRPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefApp_Set_GRPH', 'ptr', $self.__ptr, 'str', funcname($func))
endfunc

; ==================================================

func __CefApp__OBCLP($self, $process_type, $command_line)
	call($self, $process_type, $command_line)
endfunc

func __CefApp__ORCS($self, $registrar)
	call($self, $registrar)
endfunc

func __CefApp__GRBH($self)
	return call($self)
endfunc

func __CefApp__GBPH($self)
	return call($self)
endfunc

func __CefApp__GRPH($self)
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
	#forceref $self
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefExecuteProcess', _
		'ptr', $CefMainArgs, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func __Cef_Initialize($self, $CefMainArgs, $CefSettings, $CefApp)
	#forceref $self
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefInitialize', _
		'ptr', $CefMainArgs, _
		'ptr', $CefSettings, _
		'ptr', $CefApp _
	)
	return @error ? 0 : $ret[0]
endfunc

func __Cef_Shutdown($self)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefShutdown')
endfunc

func __Cef_DoMessageLoopWork($self)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDoMessageLoopWork')
endfunc

func __Cef_RunMessageLoop($self)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefRunMessageLoop')
endfunc

func __Cef_QuitMessageLoop($self)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefQuitMessageLoop')
endfunc

func Cef_SetOSModalLoop($self, $osModalLoop)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefSetOSModalLoop', _
		'int', $osModalLoop _
	)
endfunc

func __Cef_EnableHighDPISupport($self)
	#forceref $self
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefEnableHighDPISupport')
endfunc