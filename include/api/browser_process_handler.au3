#cs
	file: api/browser_process_handler.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; CefBrowserProcessHandler
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefBrowserProcessHandler')

	.AddMethod('OnContextInitialized', 		'__CefBrowserProcessHandler_OCI')
	.AddMethod('OnBeforeChildProcessLaunch', '__CefBrowserProcessHandler_OBCPL')
	.AddMethod('OnRenderProcessThreadCreated', '__CefBrowserProcessHandler_ORPTC')
	.AddMethod('GetPrintHandler', 			'__CefBrowserProcessHandler_GPH')
	.AddMethod('OnScheduleNessagePumpWork', '__CefBrowserProcessHandler_OSMPW')

	global $__CefBrowserProcessHandler = .Object

endwith

global const $__CefBrowserProcessHandler__OCI 	= Cef_CallbackRegister(__CefBrowserProcessHandler__OCI, 	'none', 'ptr')
global const $__CefBrowserProcessHandler__OBCPL = Cef_CallbackRegister(__CefBrowserProcessHandler__OBCPL, 	'none', 'ptr;ptr')
global const $__CefBrowserProcessHandler__ORPTC = Cef_CallbackRegister(__CefBrowserProcessHandler__ORPTC, 	'none', 'ptr;ptr')
global const $__CefBrowserProcessHandler__GPH 	= Cef_CallbackRegister(__CefBrowserProcessHandler__GPH, 	'ptr', 	'ptr')
global const $__CefBrowserProcessHandler__OSMPW = Cef_CallbackRegister(__CefBrowserProcessHandler__OSMPW, 	'none', 'ptr;int64')

; ==================================================

func CefBrowserProcessHandler_Create($ptr = null)
	local $self = _AutoItObject_Create($__CefBrowserProcessHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserProcessHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefBrowserProcessHandler_OCI($self, $func = null)
if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_OCI', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_Set_OCI', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OCI', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefBrowserProcessHandler__OCI : null)
endfunc

func __CefBrowserProcessHandler_OBCPL($self, $func = null)
if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_OBCPL', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_Set_OBCPL', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OBCPL', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefBrowserProcessHandler__OBCPL : null)
endfunc

func __CefBrowserProcessHandler_ORPTC($self, $func = null)
if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_ORPTC', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_Set_ORPTC', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_ORPTC', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefBrowserProcessHandler__ORPTC : null)
endfunc

func __CefBrowserProcessHandler_GPH($self, $func = null)
if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_GPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_Set_GPH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_GPH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefBrowserProcessHandler__GPH : null)
endfunc

func __CefBrowserProcessHandler_OSMPW($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_GPH', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_Set_GPH', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_GPH', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefBrowserProcessHandler__GPH : null)
endfunc

; ==================================================

func __CefBrowserProcessHandler__OCI($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_OCI', 'ptr', $self)[0]

	call($self, $self)
endfunc

func __CefBrowserProcessHandler__OBCPL($self, $command_line)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_OBCPL', 'ptr', $self)[0]
	;$command_line = CefCommandLine_Create($command_line)

	call($self, $self, $command_line)
endfunc

func __CefBrowserProcessHandler__ORPTC($self, $extra_info)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_ORPTC', 'ptr', $self)[0]
	;$extra_info = CefListValue_Create($extra_info)

	call($self, $self, $extra_info)
endfunc

func __CefBrowserProcessHandler__GPH($self)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_GPH', 'ptr', $self)[0]

	return call($self, $self)
endfunc

func __CefBrowserProcessHandler__OSMPW($self, $delay_ms)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefBrowserProcessHandler_Get_OSMPW', 'ptr', $self)[0]

	call($self, $self, $delay_ms)
endfunc