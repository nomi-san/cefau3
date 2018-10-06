#cs

Name:.............: Cefau3 - Chromium Embedded Framework for AutoIt3
AutoIt version:...: v3.3.14.5
Author:...........: wuuyi123
Page:.............: https://github.com/wy3/cefau3

program/
	|---app/...
	|	|---css/...			# style
	|	|---js/...			# javascript
	|	|---app.js			# app
	|	|---index.html		# index
	|
	|---cef/...				# resources
	|	|---locales/...
	|	|---autoitx3.dll	# autoitx3
	|	|---libcef.dll		# libcef
	|	|---cefau3.dll		# cefau3
	|
	|---include/...			# your autoit header
	|---cefau3/...			# cefau3 udf
	|	|---base/...
	|	|---cefau3.au3
	|
	|---main.au3			# main script
	|...

#ce

global static $__Cefau3Dll__ 		= null;
global static $__Cefau3DllName__ 	= 'cefau3.dll';
global static $__CefObject__ 		= null;

#include-once

#include <WinAPISysWin.au3>
#include <WinAPIMisc.au3>

#include 'AutoItObject.au3'

#include 'base/base.au3'
#include 'base/app.au3'
#include 'base/client.au3'

#include 'types/windows.au3'
#include 'types/string.au3'
#include 'types/string_list.au3'
#include 'types/ptr.au3'

#include 'api/accessibility_handler.au3'
#include 'api/browser_process_handler.au3'
#include 'api/display_handler.au3'
#include 'api/keyboard_handler.au3'
#include 'api/life_span_handler.au3'
#include 'api/load_handler.au3'
#include 'api/print_handler.au3'
#include 'api/render_handler.au3'
#include 'api/render_process_handler.au3'

#include "api/geolocation.au3"
#include "api/geolocation_handler.au3"

#include 'api/browser.au3'
#include 'api/frame.au3'
#include 'api/types.au3'
#include 'api/types_win.au3'
#include 'api/task.au3'
#include 'api/task.au3'
#include 'api/v8.au3'

;opt('MustDeclareVars', 0)

; startup & create CEF object
func CefStart($CefPath = default)
	if (($__Cefau3Dll__) and ($__CefObject__)) then return $__CefObject__
	if (($CefPath = default) or (not $CefPath)) then _ ; ./cef (x86) & ./cef_x64 (x64) for default path
		$CefPath = @ScriptDir & (@AutoItX64 ? '\cef_x64' : '\cef')

	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', $CefPath)
	local $ret = dllopen($__Cefau3DllName__)
	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', @ScriptDir)
	if @error or ($ret == -1) then return 0
	$__Cefau3Dll__ = $ret
	_AutoItObject_Startup()

	if @error then return 0

	__Cef_Init()

	if @error then return 0

	Cef_CreateWindowMessage()

	return $__CefObject__
endfunc

; shutdown CEF
func CefEnd()
	if ($__CefObject__) then $__CefObject__ = null
	if ($__Cefau3Dll__) then DllClose($__Cefau3Dll__)
endfunc

func __Cef_Init()
	$__CefObject__ = _AutoItObject_Create()

	CefObject_AddMethod($__CefObject__, 'new', '__Cef_New')

	CefObject_AddMethod($__CefObject__, 'Version', 			'__Cef_GetVersion')
	CefObject_AddMethod($__CefObject__, 'ChromiumVersion', 	'__Cef_GetChromiumVersion')

	CefObject_AddMethod($__CefObject__, 'ExecuteProcess', 	'__Cef_ExecuteProcess')
	CefObject_AddMethod($__CefObject__, 'Initialize', 		'__Cef_Initialize')
	CefObject_AddMethod($__CefObject__, 'Shutdown', 			'__Cef_Shutdown')
	CefObject_AddMethod($__CefObject__, 'DoMessageLoopWork', 	'__Cef_DoMessageLoopWork')
	CefObject_AddMethod($__CefObject__, 'RunMessageLoop', 	'__Cef_RunMessageLoop')
	CefObject_AddMethod($__CefObject__, 'QuitMessageLoop', 	'__Cef_QuitMessageLoop')
	CefObject_AddMethod($__CefObject__, 'EnableHighDPISupport', '__Cef_EnableHighDPISupport')

	CefObject_AddMethod($__CefObject__, 'CreateBrowser', 		'__CefBrowserHost_CreateBrowser')
	CefObject_AddMethod($__CefObject__, 'CreateBrowserSync', 	'__CefBrowserHost_CreateBrowserSync')

	CefObject_AddMethod($__CefObject__, 'RegisterExtension', 	'__Cef_RegisterExtension')

	CefObject_AddProperty($__CefObject__, '__type', 1, 'Cef')
endfunc

; $Cef.new(<string> $name[, <pointer> $param])
func __Cef_New($self, $name = null, $ptr = null)
	if @numparams == 1 then return

	switch stringlower($name)
		case 'base';

		case 'app';
			return CefApp_Create($ptr)

		case 'client';
			return CefClient_Create($ptr)

		case 'mainargs'
			return CefMainArgs_Create($ptr)

		case 'windowinfo'
			return CefWindowInfo_Create($ptr)

		case 'settings'
			return CefSettings_Create($ptr)

		case 'browsersettings'
			return CefBrowserSettings_Create($ptr)

		case 'accessibilityhandler'
			return CefAccessibilityHandler_Create($ptr)

		case 'browserprocesshandler'
			return CefBrowserProcessHandler_Create($ptr)

		case 'contextmenuhandler'

		case 'dialoghandler'

		case 'displayhandler'
			return CefDisplayHandler_Create($ptr)

		case 'downloadhandler'

		case 'draghandler'

		case 'findhandler'

		case 'focushandler'

		case 'geolocationhandler'
			return CefGeolocationHandler_Create($ptr)

		case 'jsdialoghandler'

		case 'keyboardhandler'
			return CefKeyboardHandler_Create($ptr)

		case 'lifespanhandler'
			return CefLifeSpanHandler_Create($ptr)

		case 'loadhandler'
			return CefLoadHandler_Create($ptr)

		case 'printhandler'
			return CefPrintHandler_Create($ptr)

		case 'renderhandler'
			return CefRenderHandler_Create($ptr)

		case 'renderprocesshandler'
			return CefRenderProcessHandler_Create($ptr)

		case 'requestcontexthandler'

		case 'requesthandler'

		case 'resourcebundlehandler'

		case 'v8handler'
			return CefV8Handler_Create($ptr)

	endswitch

	return null
endfunc

; methods -------------------------------------------------------------;

; $Cef.release(<struct|pointer> $value)
func __Cef_Release($self, $param)
	if (not $param) then return
	local $pointer = isptr($param) ? $param : $param()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_Release', 'ptr', $pointer)
endfunc

func __Cef_GetVersion($self)
	local $ret = dllcall($__Cefau3Dll__, 'str:cdecl', 'Cef_GetVersion')
	return (@error ? null : $ret[0])
endfunc

func __Cef_GetChromiumVersion($self)
	local $t = dllstructcreate('int[3]')
	local $ret = dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_GetChromiumVersion', 'ptr', dllstructgetptr($t, 1))
	return (@error ? _
		null : ( _
		dllstructgetdata($t, 1, 1) & '.' & _
		dllstructgetdata($t, 1, 2) & '.' & _
		dllstructgetdata($t, 1, 3)) _
	)
endfunc

; static functions ----------------------------------------------------;

func Cef_CreateWindowMessage()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_CreateWindowMessage')
endfunc

func Cef_WindowMessage()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_WindowMessage')
endfunc

func Cef_PostQuitMessage($code = 0)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_PostQuitMessage', 'int', $code)
endfunc

func Cef_Print($str)
	consolewrite(stringformat($str))
	;dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_Print', 'str', $str)
endfunc

func Cef_CallbackRegister($func, $return_type, $params_type)
	local $cb_idx = dllcallbackregister($func, $return_type, $params_type)
	return @error ? null : dllcallbackgetptr($cb_idx)
endfunc

func Cef_ReduceMemory($pid)
	local $handle = dllcall('kernel32.dll', 'handle', 'OpenProcess', 'dword', 0x1f0fff, 'bool', 0, 'dword', $pid)
	if not @error then
		$handle = $handle[0]
		dllcall('kernel32.dll', 'bool', 'SetProcessWorkingSetSizeEx', 'handle', $handle, 'int', -1, 'int', -1, 'dword', 0x1)
		dllcall('psapi.dll', 'bool', 'EmptyWorkingSet', 'handle', $handle)
		dllcall('kernel32.dll', 'bool', 'CloseHandle', 'handle', $handle)
	endif
endfunc

; CefStruct
; ==================================================

func CefStruct_Create($tag, $type_name = null, $ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag, $ptr) _
		: _AutoItObject_DllStructCreate($tag)
	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, $type_name)

	return $struct
endfunc

func CefStruct_AddMethod($struct, $medthod_name, $func)
	_AutoItObject_AddMethod($struct, $medthod_name, $func)
endfunc

func CefStruct_AddProperty($struct, $prop_name, $attrib = 0, $value = 0)
	_AutoItObject_AddProperty($struct, $prop_name, $attrib, $value)
endfunc

func CefStruct_GetSize($index)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'Cef_GetStructSize', 'int', $index)
	return @error ? 0 : $ret[0]
endfunc

; CefObject
; ==================================================

func CefObject_Clone($parent = null)
	local $object = $parent ? _AutoItObject_Create($parent) _
		: _AutoItObject_Create()

	return $object
endfunc

func CefObject_Create($type_name, $ptr = null)
	local $object = _AutoItObject_Create()

	if ($ptr == null) then
		local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', $type_name & '_Create')
		$ptr = @error ? 0: $ret[0]
	endif

	_AutoItObject_AddProperty($object, '__ptr', $ELSCOPE_READONLY, $ptr)
	_AutoItObject_AddProperty($object, '__type', $ELSCOPE_READONLY, $type_name)

	return $object
endfunc

func CefObject_AddMethod($object, $medthod_name, $func)
	_AutoItObject_AddMethod($object, $medthod_name, $func)
endfunc

func CefObject_AddProperty($object, $prop_name, $attrib = 0, $value = 0)
	_AutoItObject_AddProperty($object, $prop_name, $attrib, $value)
endfunc





; CefMem
; ==================================================

func CefMem_Alloc($size)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefMem_Alloc', 'uint', $size)
	return @error ? 0 : $ret[0]
endfunc

func CefMem_Free($ptr)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefMem_Free', 'ptr', $ptr)
endfunc

func CefMem_ReAlloc($ptr, $size)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefMem_ReAlloc', 'ptr', $ptr, 'uint', $size)
	return @error ? 0 : $ret[0]
endfunc


; CefMisc
; ==================================================

global const $__Cef_MsgBox_Port = Cef_CallbackRegister(__Cef_MsgBox_Port, 'none', 'int;str')

func __Cef_MsgBox_Port($ret, $fn_name)
	call($fn_name, $ret)
endfunc

func Cef_MsgBox($OnMsgBoxClosed, $flags, $title, $text, $parent = null)
	local $fn = funcname($OnMsgBoxClosed)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_MsgBox', _
		'ptr', $__Cef_MsgBox_Port, _
		'str', $fn ? $fn : null, _
		'uint', $flags, _
		'wstr', stringformat($title), _
		'wstr', stringformat($text), 	_
		'hwnd', $parent _
	)
endfunc