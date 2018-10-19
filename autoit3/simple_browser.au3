#include 'cefau3/cefau3.au3'

; startup =========================

global $cef = CefStart(default)

$cef.EnableHighDPISupport()

global $cef_app = $cef.new('App'), _
	$cef_args = $cef.new('MainArgs')

if ($cef.ExecuteProcess($cef_args.__ptr, $cef_app.__ptr) >= 0) then exit

global $width = 1000, $height = 600, $gui_title = 'Simple Browser'
	$url = 'https://www.google.com/'

global $html_dir = @scriptdir & '\html'

; gui =========================

Opt('GUIOnEventMode', 1)

global $hMainGUI = GUICreate($gui_title, $width, $height, -1, -1, 0x00CF0000)
GUISetBkColor(0xffffff)

; cef components =========================

global $cef_settings = $cef.new('Settings'), _
	$cef_bs = $cef.new('BrowserSettings')

$cef_settings.single_process = 1 ;/ cannot multiple process!
$cef_settings.multi_threaded_message_loop = 1

if ($cef.Initialize($cef_args.__ptr, $cef_settings.__ptr, $cef_app.__ptr) == 0) then exit

global $cef_winfo = $cef.new('WindowInfo')
$cef_winfo.parent_window = $hMainGUI
$cef_winfo.style = 0x40000000 ; ws_child

global $toolbar_client = $cef.new('Client')
global $toolbar_lifespan = $cef.new('LifeSpanHandler')

$toolbar_client.GetLifeSpanHandler = toolbar_getLifeSpanHandler
$toolbar_lifespan.OnAfterCreated = toolbar_onAfterCreated

; =========================

global $browser_client = $cef.new('Client'), _
	$browser_lifespan = $cef.new('LifeSpanHandler'), _
	$browser_display = $cef.new('DisplayHandler')

$browser_client.GetLifeSpanHandler = browser_getLifeSpanHandler
$browser_client.GetDisplayHandler = browser_getDisplayHandler

$browser_lifespan.OnAfterCreated = browser_onAfterCreated

$browser_display.OnTitleChange = browser_onTitleChange
$browser_display.OnAddressChange = browser_onAddressChange

; =========================
global $app_renderprocess = $cef.new('RenderProcessHandler')
global $app_v8 = $cef.new('V8Handler')

$app_v8.Execute = app_execute
$cef_app.GetRenderProcessHandler = app_getRenderProcessHandler
$app_renderprocess.OnWebKitInitialized = app_onWebKitInitialized

; =========================

global $toolbar_hwnd, $browser_hwnd
global $main_frame, $main_browser, $toolbar_frame
global $rcGUI = DllStructCreate('int[2];int w;int h')

$cef.CreateBrowser($cef_winfo.__ptr, $toolbar_client.__ptr, _
	'file:///' & $html_dir & '\toolbar.html', $cef_bs.__ptr, null)
$cef.CreateBrowser($cef_winfo.__ptr, $browser_client.__ptr, $url, $cef_bs.__ptr, null)

; add gui event =========================

GUISetOnEvent(-3, '__exit')
GUIRegisterMsg(0x0005, '__sizing')
OnAutoItExitRegister('CefExit')

; main windows loop =========================

CefWndMsg_RunLoop()

; callback/handler event =========================

func __exit()
	GUISetState(@SW_HIDE)
	CefWndMsg_QuitLoop()
	exit
endfunc

func __sizing($h, $m, $w, $l)
	if ($toolbar_hwnd and $browser_hwnd) then
		dllcall('user32', 'bool', 'GetClientRect', 'hwnd', $hMainGUI, 'struct*', $rcGUI)
		_MoveWindow($toolbar_hwnd, 0, 0, $rcGUI.w, 30, 1)
		_MoveWindow($browser_hwnd, 0, 30, $rcGUI.w, $rcGUI.h - 30, 1)
	endif
endfunc

; toolbar =========================

func toolbar_getLifeSpanHandler()
	return $toolbar_lifespan.__ptr
endfunc

func toolbar_onAfterCreated($browser)
	if (not $toolbar_hwnd) then
		$toolbar_hwnd = $browser.GetHost().GetWindowHandle()
		_MoveWindow($toolbar_hwnd, 0, 0, $width, 30, 1)
		_ShowWindow($toolbar_hwnd)

		GUISetState(@SW_SHOW)

		$toolbar_frame = $browser.GetMainFrame()
	endif
endfunc

; browser =========================

func browser_getLifeSpanHandler()
	return $browser_lifespan.__ptr
endfunc

func browser_getDisplayHandler()
	return $browser_display.__ptr
endfunc

func browser_onAfterCreated($browser)
	if (not $browser_hwnd) then
		$browser_hwnd = $browser.GetHost().GetWindowHandle()
		_MoveWindow($browser_hwnd, 0, 30, $width, $height - 30, 1)
		_ShowWindow($browser_hwnd)

		$main_browser = $browser
		$main_frame = $browser.GetMainFrame()
	endif
endfunc

func browser_onTitleChange($browser, $title)
	if ($browser_hwnd) then WinSetTitle($hMainGUI, '', $gui_title & ' :: ' & $title.val)
endfunc

func browser_onAddressChange($browser, $frame, $url)
	local $code = 'set("' & $url.val & '")'  ;'urlbox.value = "' & $url.val & '"'
	$toolbar_frame.ExecuteJS($code)
endfunc

; app/v8 =========================

func app_getRenderProcessHandler()
	return $app_renderprocess.__ptr
endfunc

func app_onWebKitInitialized()
	local $code = stringformat(fileread($html_dir & '\ext.js'))
	CefRegisterExtension('v8/app', $code, $app_v8.__ptr)
endfunc

;              fn name |  this  | a[n] | <ret>  |   err     // a[0] = count; a[N] = param N (count > 0)
func app_execute($name, $object, $args, $retval, $exception)

	switch ($name.val)
		case 'back'
			$main_browser.GoBack()
		case 'forward'
			$main_browser.GoForward()
		case 'reload'
			$main_browser.Reload()
		case 'home'
			$main_frame.LoadURL($url)
		case 'load'
			if ($args[0] > 0) then ; check
				local $new_url = $args[1].GetStringValue()
				$main_frame.LoadURL($new_url)
			endif
	endswitch

	return 0 ; 1 for change retval
endfunc