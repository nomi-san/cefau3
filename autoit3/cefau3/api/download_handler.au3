#cs
	file: api/download_handler.au3
	author: wuuyi123
#ce

#include-once

; CefBeforeDownloadCallback
; ==================================================

global $__CefBeforeDownloadCallback = null

; ==================================================

func CefBeforeDownloadCallback_Create($ptr)
	if $__CefBeforeDownloadCallback == null then
		$__CefBeforeDownloadCallback = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefBeforeDownloadCallback, '__ptr')
		_AutoItObject_AddProperty($__CefBeforeDownloadCallback, '__type', 1, 'CefBeforeDownloadCallback')
		
		_AutoItObject_AddMethod($__CefBeforeDownloadCallback, 'Continue', '__CefBeforeDownloadCallback_Continue')
	endif

	local $self = _AutoItObject_Create($__CefBeforeDownloadCallback)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefBeforeDownloadCallback_Continue($self, $download_path = null, $show_dialog = null)
	if @numparams == 1 then return
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBeforeDownloadCallback_Continue', 'ptr', $self.__ptr, 'wstr', $download_path, 'int', $show_dialog)
endfunc

; CefDownloadItemCallback
; ==================================================

global $__CefDownloadItemCallback = null

; ==================================================

func CefDownloadItemCallback_Create($ptr)
	if $__CefDownloadItemCallback == null then
		$__CefDownloadItemCallback = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefDownloadItemCallback, '__ptr')
		_AutoItObject_AddProperty($__CefDownloadItemCallback, '__type', 1, 'CefDownloadItemCallback')
		
		_AutoItObject_AddMethod($__CefDownloadItemCallback, 'Cancel', '__CefDownloadItemCallback_Cancel')
		_AutoItObject_AddMethod($__CefDownloadItemCallback, 'Pause', '__CefDownloadItemCallback_Pause')
		_AutoItObject_AddMethod($__CefDownloadItemCallback, 'Resume', '__CefDownloadItemCallback_Resume')
	endif

	local $self = _AutoItObject_Create($__CefDownloadItemCallback)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefDownloadItemCallback_Cancel($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadItemCallback_Cancel', 'ptr', $self.__ptr)
endfunc

func __CefDownloadItemCallback_Pause($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadItemCallback_Pause', 'ptr', $self.__ptr)
endfunc

func __CefDownloadItemCallback_Resume($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadItemCallback_Resume', 'ptr', $self.__ptr)
endfunc

; CefDownloadHandler
; ==================================================

global $__CefDownloadHandler = null

global $__CefDownloadHandler__OBD	= Cef_CallbackRegister(__CefDownloadHandler__OBD, 'none', 'ptr;ptr;ptr;ptr;ptr')
global $__CefDownloadHandler__ODU	= Cef_CallbackRegister(__CefDownloadHandler__ODU, 'none', 'ptr;ptr;ptr;ptr')

; ==================================================

func CefDownloadHandler_Create($ptr = null)
	if $__CefDownloadHandler == null then
		$__CefDownloadHandler = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefDownloadHandler, '__ptr')
		_AutoItObject_AddProperty($__CefDownloadHandler, '__type', 1, 'CefDownloadHandler')
		
		_AutoItObject_AddMethod($__CefDownloadHandler, 'OnBeforeDownload', '__CefDownloadHandler_OBD')
		_AutoItObject_AddMethod($__CefDownloadHandler, 'OnDownloadUpdated', '__CefDownloadHandler_ODU')
	endif

	local $self = _AutoItObject_Create($__CefDownloadHandler)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefDownloadHandler_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefDownloadHandler_OBD($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDownloadHandler_Get_OBD', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadHandler_Set_OBD', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadHandler_OBD', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefDownloadHandler__OBD : null)
endfunc

func __CefDownloadHandler_ODU($self, $func = null)
	if @numparams == 1 then return dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDownloadHandler_Get_ODU', 'ptr', $self.__ptr)[0]

	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadHandler_Set_ODU', 'ptr', $self.__ptr, 'str', funcname($func))
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefDownloadHandler_ODU', 'ptr', $self.__ptr, 'ptr', funcname($func) ? $__CefDownloadHandler__ODU : null)
endfunc

; ==================================================

func __CefDownloadHandler__OBD($self, $browser, $download_item, $suggested_name, $callback)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDownloadHandler_Get_OBD', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$download_item = CefDownloadItem_Create($download_item)
	$suggested_name = CefString_Create($suggested_name)
	$callback = CefBeforeDownloadCallback_Create($callback)

	call($self, $browser, $download_item, $suggested_name, $callback)
endfunc

func __CefDownloadHandler__ODU($self, $browser, $download_item, $callback)
	$self = dllcall($__Cefau3Dll__, 'str:cdecl', 'CefDownloadHandler_Get_ODU', 'ptr', $self)[0]
	$browser = CefBrowser_Create($browser)
	$download_item = CefDownloadItem_Create($download_item)
	$callback = CefDownloadItemCallback_Create($callback)

	call($self, $browser, $download_item, $callback)
endfunc