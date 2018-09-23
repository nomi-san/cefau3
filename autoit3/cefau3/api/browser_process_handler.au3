#cs
	file: api/browser_process_handler.au3
	author: wuuyi123
#ce

; CefBrowserProcessHandler
; ==================================================

global $tag_CefBrowserProcessHandler = ( _
    $tag_CefBase & _
    'ptr __OCI;' & _ ;on_context_initialized
    'ptr __OBCPL;' & _ ;on_before_child_process_launch
    'ptr __ORPTC;' & _ ;on_render_process_thread_created
    'ptr __GPH;' & _ ;get_print_handler
    'ptr __OSMPW;' _ ;on_schedule_message_pump_work
)

global $__params_OnContextInitialized = 'ptr', _
	$__return_OnContextInitialized = 'none'

global $__params_OnBeforeChildProcessLaunch = 'ptr;ptr', _
	$__return_OnBeforeChildProcessLaunch = 'none'

global $__params_OnRenderProcessThreadCreated = 'ptr;ptr', _
	$__return_OnRenderProcessThreadCreated = 'none'

global $__params_GetPrintHandler = 'ptr', _
	$__return_GetPrintHandler = 'ptr'

global $__params_OnScheduleMessagePumpWork = 'ptr;int64', _
	$__return_OnScheduleMessagePumpWork = 'none'

func CefBrowserProcessHandler_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefBrowserProcessHandler, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefBrowserProcessHandler)
	$struct.size = $struct.__size__;

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefBrowserProcessHandler')

	_AutoItObject_AddMethod($struct, 'OnContextInitialized', '__CefBrowserProcessHandler_OCI')
	_AutoItObject_AddMethod($struct, 'OnBeforeChildProcessLaunch', '__CefBrowserProcessHandler_OBCPL')
	_AutoItObject_AddMethod($struct, 'OnRenderProcessThreadCreated', '__CefBrowserProcessHandler_ORPTC')
	_AutoItObject_AddMethod($struct, 'GetPrintHandler', '__CefBrowserProcessHandler_GPH')
	_AutoItObject_AddMethod($struct, 'OnScheduleNessagePumpWork', '__CefBrowserProcessHandler_OSMPW')

	return $struct
endfunc

func __CefBrowserProcessHandler_OCI($self, $func = null)
	if @NumParams == 1 then return $self.__OCI

	local $cb = dllcallbackregister($func, $__return_OnContextInitialized, $__params_OnContextInitialized)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnContextInitialized', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefBrowserProcessHandler_OBCPL($self, $func = null)
	if @NumParams == 1 then return $self.__OBCPL

	local $cb = dllcallbackregister($func, $__return_OnBeforeChildProcessLaunch, $__params_OnBeforeChildProcessLaunch)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnBeforeChildProcessLaunch', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefBrowserProcessHandler_ORPTC($self, $func = null)
	if @NumParams == 1 then return $self.__ORPTC

	local $cb = dllcallbackregister($func, $__return_OnRenderProcessThreadCreated, $__params_OnRenderProcessThreadCreated)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnRenderProcessThreadCreated', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefBrowserProcessHandler_GPH($self, $func = null)
	if @NumParams == 1 then return $self.__GPH

	local $cb = dllcallbackregister($func, $__return_GetPrintHandler, $__params_GetPrintHandler)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_GetPrintHandler', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc

func __CefBrowserProcessHandler_OSMPW($self, $func = null)
	if @NumParams == 1 then return $self.__OSMPW

	local $cb = dllcallbackregister($func, $__return_OnScheduleMessagePumpWork, $__params_OnScheduleMessagePumpWork)
	if @error then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnScheduleMessagePumpWork', 'ptr', $self.__pointer__, 'ptr', dllcallbackgetptr($cb))
endfunc