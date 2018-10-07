;~ // file: example.au3
;~ // content: Cefau3 example
;~ // author: wuuyi123

#include 'cefau3/cefau3.au3'

; start Cefau3
global $cef = CefStart(default)

; Windows constant
global const $CW_USEDEFAULT = 0x80000000, _
	$WS_VISIBLE 			= 0x10000000, _
	$WS_OVERLAPPEDWINDOW 	= 0x00CF0000

; enable high DPI, support on Windows 7 or later
$cef.EnableHighDPISupport()

; create new struct
global $cef_app = $cef.new('App'), _
	$cef_args = $cef.new('MainArgs')

; execute process
if ($cef.ExecuteProcess($cef_args.__ptr, $cef_app.__ptr) >= 0) then exit

; if $cef_settings.single_process = 1 (true, in line 36),
; do not insert another codes above (e.g: MsgBox, GUICreate, user interface, etc)
; -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

Cef_Print('CEF: ' & $cef.Version  & '\n' & _
	'Chromium: ' & $cef.ChromiumVersion & '\n')

global $cef_settings = $cef.new('Settings'), _
	$cef_bs = $cef.new('BrowserSettings')

; multiprocess for performance, not work while running script
$cef_settings.single_process = @Compiled ? 0 : 1
$cef_settings.multi_threaded_message_loop = 1

; initialize
if ($cef.Initialize($cef_args.__ptr, $cef_settings.__ptr, $cef_app.__ptr) == 0) then exit

; create WindowInfo & set attribute for Cef browser window
global $cef_wininfo = $cef.new('WindowInfo')
$cef_wininfo.window_name = 'Cefau3'
$cef_wininfo.style 	= bitor($WS_VISIBLE, $WS_OVERLAPPEDWINDOW)
$cef_wininfo.x 		= $CW_USEDEFAULT
$cef_wininfo.y 		= $CW_USEDEFAULT
$cef_wininfo.width 	= $CW_USEDEFAULT
$cef_wininfo.height = $CW_USEDEFAULT

; create Client, LifeSpanHandler & DisplayHandler; it's callback handler, implement property for control
global $cef_client = $cef.new('Client'), _
	$cef_lifespan = $cef.new('LifeSpanHandler'), _
	$cef_display = $cef.new('DisplayHandler'), _
	$cef_keyboard = $cef.new('KeyboardHandler')

; implement callback functions
$cef_client.GetLifeSpanHandler 	= __getLifeSpanHandler
$cef_client.GetDisplayHandler 	= __getDisplayHandler
$cef_client.GetKeyboardHandler 	= __getKeyboardHandler

$cef_lifespan.OnAfterCreated 	= __onAfterCreated
$cef_lifespan.OnBeforeClose 	= __onBeforeClose

$cef_display.OnTitleChange		= __onTitleChange
$cef_display.OnAddressChange	= __onAddressChange
$cef_display.OnFaviconUrlChange	= __onFaviconUrlChange

$cef_keyboard.OnPreKeyEvent 	= __onPreKeyEvent

global $url = 'https://www.google.com/'
$cef.CreateBrowser($cef_wininfo.__ptr, $cef_client.__ptr, $url, $cef_bs.__ptr, Null)

global $cef_browser_hwnd

OnAutoItExitRegister(CefEnd) ; register CefEnd for on exit

Cef_WindowMessage()

; -- callback functions

func __getLifeSpanHandler()
	return $cef_lifespan.__ptr
endfunc

func __getDisplayHandler()
	return $cef_display.__ptr
endfunc

func __getKeyboardHandler()
	return $cef_keyboard.__ptr
endfunc

func __onAfterCreated($browser)
	Cef_Print('-- on after created --\n')
	if not $cef_browser_hwnd then $cef_browser_hwnd = hwnd($browser.GetHost().GetWindowHandle())
endfunc

func __onBeforeClose($browser)
	Cef_Print('-- on before close --\n')
	Cef_PostQuitMessage()
	exit
endfunc

func __onTitleChange($browser, $title)
	Cef_Print('Title change: ' & $title.val & '\n')
	WinSetTitle($cef_browser_hwnd, '', 'Cefau3 :: ' & $title.val)
endfunc

func __onAddressChange($browser, $frame, $url)
	Cef_Print('URL change: ' & $url.val & '\n')
endfunc

func __onFaviconUrlChange($browser, $frame, $icon_urls)
	Cef_Print('Favicon change: ' & $icon_urls.read() & '\n')
endfunc

func __onPreKeyEvent($browser, $event, $os_event, $is_keyboard_shortcut)
	if ($event.type == 2) then
		if $event.windows_key_code == 0xd then
			Cef_Print('Enter key released\n')
		elseif $event.windows_key_code == 0x1b then
			Cef_Print('ESC key released\n')
		elseif $event.windows_key_code == 0x70 then
			Cef_MsgBox(__onMsgBoxClosed, 0, 'Info', 'Cefau3 project,\nSimple example.\n\n\t© by wuuyi123', $cef_browser_hwnd)
			return 1
		endif
	endif
	return 0
endfunc

func __onMsgBoxClosed($ret)
	Cef_Print('MsgBox closed with code: ' & $ret & '\n')
endfunc