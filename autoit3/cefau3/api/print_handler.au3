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

global $tag_CefPrintHandler = ( _
	$tag_CefBase 		& _
	'ptr[6];'			& _
	'char __OPSt[100]'	& _
	'char __OPSe[100]'	& _
	'char __OPD[100]'	& _
	'char __OPJ[100]'	& _
	'char __OPR[100]'	& _
	'char __GPPS[100]'	_
)

global $__CefPrintHandler__OPSt = Cef_CallbackRegister(__CefPrintHandler__OPSt, 'none', 'ptr;ptr')
global $__CefPrintHandler__OPSe = Cef_CallbackRegister(__CefPrintHandler__OPSe, 'none', 'ptr;ptr;ptr;int')
global $__CefPrintHandler__OPD 	= Cef_CallbackRegister(__CefPrintHandler__OPD, 	'int', 	'ptr;ptr;int;ptr')
global $__CefPrintHandler__OPJ 	= Cef_CallbackRegister(__CefPrintHandler__OPJ, 	'int', 	'ptr;ptr;ptr;ptr;ptr')
global $__CefPrintHandler__OPR 	= Cef_CallbackRegister(__CefPrintHandler__OPR, 	'none', 'ptr;ptr')
global $__CefPrintHandler__GPPS = Cef_CallbackRegister(__CefPrintHandler__GPPS, 'int', 	'ptr;int')

; ==================================================

func CefPrintHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPrintHandler, 'CefPrintHandler_Create', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'OnPrintStart', 	'__CefPrintHandler_OPSt')
	CefStruct_AddMethod($struct, 'OnPrintSettings', '__CefPrintHandler_OPSe')
	CefStruct_AddMethod($struct, 'OnPrintDialog', 	'__CefPrintHandler_OPD')
	CefStruct_AddMethod($struct, 'OnPrintJob', 		'__CefPrintHandler_OPJ')
	CefStruct_AddMethod($struct, 'OnPrintReset', 	'__CefPrintHandler_OPR')
	CefStruct_AddMethod($struct, 'GetPDFPaperSize', '__CefPrintHandler_GPPS')

	return $struct
endfunc

func __CefPrintHandler_OPSt($self, $func = null)
	if @numparams == 1 then return $self.__OPSt

	$self.__OPSt = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_OnPrintStart', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__OPSt)
endfunc

func __CefPrintHandler_OPSe($self, $func = null)
	if @numparams == 1 then return $self.__OPSe

	$self.__OPSe = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_OnPrintSettings', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__OPSe)
endfunc

func __CefPrintHandler_OPD($self, $func = null)
	if @numparams == 1 then return $self.__OPD

	$self.__OPD = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_OnPrintDialog', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__OPD)
endfunc

func __CefPrintHandler_OPJ($self, $func = null)
	if @numparams == 1 then return $self.__OPJ

	$self.__OPJ = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_OnPrintJob', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__OPJ)
endfunc

func __CefPrintHandler_OPR($self, $func = null)
	if @numparams == 1 then return $self.__OPR

	$self.__OPR = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_OnPrintReset', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__OPR)
endfunc

func __CefPrintHandler_GPPS($self, $func = null)
	if @numparams == 1 then return $self.__GPPS

	$self.__GPPS = $func
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefPrintHandler_GetPDFPaperSize', 'ptr', $self.__pointer__, 'ptr', $__CefPrintHandler__GPPS)
endfunc

; ==================================================

func __CefPrintHandler__OPSt($self, $browser)
	$self 		= CefPrintHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	return call($self.__OPSt, $self, $browser)
endfunc

func __CefPrintHandler__OPSe($self, $browser, $settings, $get_defaults)
	$self 		= CefPrintHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)
	;$settings 	= CefPrintSettings_Create($settings)

	return call($self.__OPSe, $self,  $browser, $settings, $get_defaults)
endfunc

func __CefPrintHandler__OPD($self, $browser, $has_selection, $callback)
	$self 		= CefPrintHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	$callback 	= CefPrintDialogCallback_Create($callback)

	return call($self.__OPD, $self, $browser, $has_selection, $callback)
endfunc

func __CefPrintHandler__OPJ($self, $browser, $document_name, $pdf_file_path, $callback)
	$self 			= CefPrintHandler_Create($self)
	$browser 		= CefBrowser_Create($browser)
	$document_name 	= CefString_Read($document_name)
	$pdf_file_path 	= CefString_Read($pdf_file_path)
	$callback 		= CefPrintJobCallback_Create($callback)

	return call($self.__OPJ, $self, $browser, $document_name, $pdf_file_path, $callback)
endfunc

func __CefPrintHandler__OPR($self, $browser)
	$self 		= CefPrintHandler_Create($self)
	$browser 	= CefBrowser_Create($browser)

	call($self.__OPR, $self, $browser)
endfunc

func __CefPrintHandler__GPPS($self, $device_units_per_inch)
	$self = CefPrintHandler_Create($self)

	return call($self.__GPPS, $self, $device_units_per_inch)
endfunc