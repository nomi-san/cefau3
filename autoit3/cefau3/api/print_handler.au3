#cs
	file: api/print_handler.au3
	author: wuuyi123
#ce

#include-once

; CefPrintDialogCallback
; ==================================================

global $tag_CefPrintDialogCallback = ( _
	$tag_CefBase 	& _
	'ptr[2];' 		_
)

func CefPrintDialogCallback_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPrintDialogCallback, 'CefPrintDialogCallback', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'Continue', 	'__CefPrintDialogCallback_Continue')
	CefStruct_AddMethod($struct, 'Cancel', 		'__CefPrintDialogCallback_Cancel')

	return $struct
endfunc

func __CefPrintDialogCallback_Continue($self, $settings)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintDialogCallback_Continue', 'ptr', $self, 'ptr', $settings)
endfunc

func __CefPrintDialogCallback_Cancel($self, $settings)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintDialogCallback_Cancel', 'ptr', $self, 'ptr', $settings)
endfunc

; CefPrintJobCallback
; ==================================================

global $tag_CefPrintJobCallback = ( _
	$tag_CefBase 	& _
	'ptr;' 			_
)

func CefPrintJobCallback_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPrintJobCallback, 'CefPrintJobCallback', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'Continue', 	'__CefPrintJobCallback_Continue')

	return $struct
endfunc

func __CefPrintJobCallback_Continue($self, $settings)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintJobCallback_Continue', 'ptr', $self, 'ptr', $settings)
endfunc

; CefPrintHandler
; ==================================================

global $__CefPrintHandler = null

global $__CefPrintHandler__OPSt = Cef_CallbackRegister(__CefPrintHandler__OPSt, 'none', 'ptr;ptr')
global $__CefPrintHandler__OPSe = Cef_CallbackRegister(__CefPrintHandler__OPSe, 'none', 'ptr;ptr;ptr;int')
global $__CefPrintHandler__OPD 	= Cef_CallbackRegister(__CefPrintHandler__OPD, 	'int', 	'ptr;ptr;int;ptr')
global $__CefPrintHandler__OPJ 	= Cef_CallbackRegister(__CefPrintHandler__OPJ, 	'int', 	'ptr;ptr;ptr;ptr;ptr')
global $__CefPrintHandler__OPR 	= Cef_CallbackRegister(__CefPrintHandler__OPR, 	'none', 'ptr;ptr')
global $__CefPrintHandler__GPPS = Cef_CallbackRegister(__CefPrintHandler__GPPS, 'int', 	'ptr;int')

; ==================================================

func CefPrintHandler_Create($ptr = null)
	if ($__CefPrintHandler == null) then
		$__CefPrintHandler = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefPrintHandler, '__ptr')
		_AutoItObject_AddProperty($__CefPrintHandler, '__type', 1, 'CefPrintHandler')

		_AutoItObject_AddMethod($__CefPrintHandler, 'OnPrintStart', 		'__CefPrintHandler_OPSt')
		_AutoItObject_AddMethod($__CefPrintHandler, 'OnPrintSettings',	'__CefPrintHandler_OPSe')
		_AutoItObject_AddMethod($__CefPrintHandler, 'OnPrintDialog', 	'__CefPrintHandler_OPD')
		_AutoItObject_AddMethod($__CefPrintHandler, 'OnPrintJob', 		'__CefPrintHandler_OPJ')
		_AutoItObject_AddMethod($__CefPrintHandler, 'OnPrintReset', 		'__CefPrintHandler_OPR')
		_AutoItObject_AddMethod($__CefPrintHandler, 'GetPDFPaperSize', 	'__CefPrintHandler_GPPS')
	endif

	local $self = _AutoItObject_Create($__CefPrintHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefPrintHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefPrintHandler_OPSt($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPSt', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_OPSt', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerOPSt', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__OPSt : null)
endfunc

func __CefPrintHandler_OPSe($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPSe', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_OPSe', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerOPSe', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__OPSe : null)
endfunc

func __CefPrintHandler_OPD($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPD', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_OPD', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerOPD', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__OPD : null)
endfunc

func __CefPrintHandler_OPJ($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPJ', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_OPJ', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerOPJ', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__OPJ : null)
endfunc

func __CefPrintHandler_OPR($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPR', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_OPR', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerOPR', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__OPR : null)
endfunc

func __CefPrintHandler_GPPS($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_GPPS', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerSet_GPPS', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandlerGPPS', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefPrintHandler__GPPS : null)
endfunc

; ==================================================

func __CefPrintHandler__OPSt($self, $browser)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPSt', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	return call($self, $browser)
endfunc

func __CefPrintHandler__OPSe($self, $browser, $settings, $get_defaults)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPSe', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)
	;$settings 	= CefPrintSettings_Create($settings)

	return call($self,  $browser, $settings, $get_defaults)
endfunc

func __CefPrintHandler__OPD($self, $browser, $has_selection, $callback)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPD', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	$callback 	= CefPrintDialogCallback_Create($callback)

	return call($self, $browser, $has_selection, $callback)
endfunc

func __CefPrintHandler__OPJ($self, $browser, $document_name, $pdf_file_path, $callback)
	$self 			= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPJ', 'ptr', $self.__ptr)[0]
	$browser 		= CefBrowser_Create($browser)
	$document_name 	= CefString_Read($document_name)
	$pdf_file_path 	= CefString_Read($pdf_file_path)
	$callback 		= CefPrintJobCallback_Create($callback)

	return call($self, $browser, $document_name, $pdf_file_path, $callback)
endfunc

func __CefPrintHandler__OPR($self, $browser)
	$self 		= dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_OPR', 'ptr', $self.__ptr)[0]
	$browser 	= CefBrowser_Create($browser)

	call($self, $browser)
endfunc

func __CefPrintHandler__GPPS($self, $device_units_per_inch)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefPrintHandlerGet_GPPS', 'ptr', $self.__ptr)[0]

	return call($self, $device_units_per_inch)
endfunc