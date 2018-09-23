#cs

Name:.............: Cefau3 - Chromium Embedded Framework for AutoIt3
AutoIt version:...: v3.3.14.5
Author:...........: wuuyi123
Page:.............: https://github.com/MyChromium/cefau3-native

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

global $__Cefau3Dll__ = null;
global $__Cefau3DllName__ = 'cefau3.dll';
global $__CefObject__ = null;

#include-once

#include <WinAPISysWin.au3>
#include <WinAPIMisc.au3>

#include 'AutoItObject.au3'

#include 'base/base.au3'
#include 'base/app.au3'
#include 'base/client.au3'

#include 'types/windows.au3'
#include 'types/string.au3'
#include 'types/ptr.au3'

#include 'api/accessibility_handler.au3'
#include 'api/browser_process_handler.au3'

#include 'api/life_span_handler.au3'
#include 'api/display_handler.au3'
#include 'api/keyboard_handler.au3'
#include 'api/render_process_handler.au3'
#include 'api/browser.au3'
#include 'api/frame.au3'
#include 'api/types.au3'
#include 'api/types_win.au3'
#include 'api/v8.au3'
#include 'api/load_handler.au3'

opt('MustDeclareVars', 1)

; startup & create CEF object
func CefStart($CefPath = default)
	if (($CefPath = default) or (not $CefPath)) then _ ; ./cef (x86) & ./cef_x64 (x64) for default path
		$CefPath = @ScriptDir & (@AutoItX64 ? '\cef_x64' : '\cef')

	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', $CefPath)
	local $ret = dllopen($__Cefau3DllName__)
	dllcall('kernel32.dll', 'int', 'SetCurrentDirectoryW', 'wstr', @ScriptDir)
	if @error or ($ret == -1) then return 0
	$__Cefau3Dll__ = $ret
	Cef_CreateWindowMessage()
	_AutoItObject_Startup()

	if @error then return 0

	__Cef_Init()

	if @error then return 0

	return $__CefObject__
endfunc

; shutdown CEF
func CefEnd()
	if ($__CefObject__) then $__CefObject__ = null
	if ($__Cefau3Dll__) then DllClose($__Cefau3Dll__)
endfunc

func __Cef_Init()
	local $obj = _AutoItObject_Create()

	_AutoItObject_AddMethod($obj, 'new', '__Cef_New')

	_AutoItObject_AddMethod($obj, 'Version', '__Cef_GetVersion')
	_AutoItObject_AddMethod($obj, 'ChromiumVersion', '__Cef_GetChromiumVersion')

	_AutoItObject_AddMethod($obj, 'ExecuteProcess', '__Cef_ExecuteProcess')
	_AutoItObject_AddMethod($obj, 'Initialize', '__Cef_Initialize')
	_AutoItObject_AddMethod($obj, 'Shutdown', '__Cef_Shutdown')
	_AutoItObject_AddMethod($obj, 'DoMessageLoopWork', '__Cef_DoMessageLoopWork')
	_AutoItObject_AddMethod($obj, 'RunMessageLoop', '__Cef_RunMessageLoop')
	_AutoItObject_AddMethod($obj, 'QuitMessageLoop', '__Cef_QuitMessageLoop')
	_AutoItObject_AddMethod($obj, 'EnableHighDPISupport', '__Cef_EnableHighDPISupport')

	_AutoItObject_AddMethod($obj, 'CreateBrowser', '__CefBrowserHost_CreateBrowser')
	_AutoItObject_AddMethod($obj, 'CreateBrowserSync', '__CefBrowserHost_CreateBrowserSync')

	$__CefObject__ = $obj;
endfunc

; $Cef.new(<string> $name[, <pointer> $param])
func __Cef_New($self, $name = null, $ptr = null)
	if @numparams == 1 then return null

	if not IsString($name) then return null

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

		case 'downloadhandler'

		case 'draghandler'

		case 'findhandler'

		case 'focushandler'

		case 'geolocationhandler'

		case 'jsdialoghandler'

		case 'keyboardhandler'
			return CefKeyboardHandler_Create($ptr)

		case 'lifespanhandler'
			return CefLifeSpanHandler_Create($ptr)

		case 'loadhandler'
			return CefLoadHandler_Create($ptr)

		case 'printhandler'

		case 'renderhandler'

		case 'renderprocesshandler'

		case 'requestcontexthandler'

		case 'requesthandler'

		case 'resourcebundlehandler'

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
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'Cef_CreateWindowMessage')
	return @error ? null : $ret[0]
endfunc

func Cef_WindowMessage()
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_WindowMessage')
endfunc

func Cef_PostQuitMessage($code = 0)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'Cef_PostQuitMessage', 'int', $code)
endfunc

func Cef_GetStructSize($index)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'Cef_GetStructSize', 'int', $index)
	return @error ? 0 : $ret[0]
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