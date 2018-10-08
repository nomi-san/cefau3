#include 'cefau3/cefau3.au3'

global $cef = CefStart(default)

$cef.EnableHighDPISupport()

global $cef_app = $cef.new('App'), _
	$cef_args = $cef.new('MainArgs')

if ($cef.ExecuteProcess($cef_args.__ptr, $cef_app.__ptr) >= 0) then exit

global $width = 1000, $height = 600, $gui_title = 'Simple Browser'
	$url = 'https://google.com'

Opt('GUIOnEventMode', 1)

global $hMainGUI = GUICreate($gui_title, $width, $height, -1, -1, 0x00CF0000)
;dllcall('user32', 'hwnd', 'CreateWindowExW', 'uint', 0, 'wstr', '#32770', 'wstr', '', 'uint', 0x10CF0000, 'int', 0x80000000, 'int', 0x80000000, 'int', 0x80000000, 'int', 0x80000000, 'ptr', 0, 'ptr', 0, 'ptr', 0, 'ptr', 0)[0] ;
GUISetBkColor(0xffffff)

Global $input_url = GUICtrlCreateInput($url, 5, 5, $width - 55, 25)
GUICtrlSetFont(-1, 14)
GUICtrlSetResizing(-1, 544)
Global $btn_go = GUICtrlCreateButton("Go", $width - 45, 5, 40, 25)
GUICtrlSetFont(-1, 14)
GUICtrlSetResizing(-1, 544)
GUICtrlSetOnEvent(-1, '__go')

GUISetOnEvent(-3, __exit)

global $cef_settings = $cef.new('Settings'), _
	$cef_bs = $cef.new('BrowserSettings')

$cef_settings.single_process = @Compiled ? 0 : 1
$cef_settings.multi_threaded_message_loop = 1

if ($cef.Initialize($cef_args.__ptr, $cef_settings.__ptr, $cef_app.__ptr) == 0) then exit

global $cef_wininfo = $cef.new('WindowInfo')
$cef_wininfo.parent_window = $hMainGUI
$cef_wininfo.style 	= 0x50000000
$cef_wininfo.x 		= 0
$cef_wininfo.y 		= 35
$cef_wininfo.width 	= $width
$cef_wininfo.height = $height - 35

global $cef_client = $cef.new('Client'), _
	$cef_lifespan = $cef.new('LifeSpanHandler'), _
	$cef_display = $cef.new('DisplayHandler')

$cef_client.GetLifeSpanHandler 	= __getLifeSpanHandler
$cef_client.GetDisplayHandler 	= __getDisplayHandler

$cef_lifespan.OnAfterCreated 	= __onAfterCreated

$cef_display.OnTitleChange		= __onTitleChange
$cef_display.OnAddressChange	= __onAddressChange

$cef.CreateBrowser($cef_wininfo.__ptr, $cef_client.__ptr, $url, $cef_bs.__ptr, Null)

global $cef_browser_hwnd = null, _
	$cef_browser, $cef_browser_host, $cef_frame

GUIRegisterMsg(0x0005, __sizing)
GUISetState()

global $rc = DllStructCreate('int[2];int w;int h')

CefWndMsg_RunLoop()

func __exit()
	GUISetState(@SW_HIDE)
	CefWndMsg_QuitLoop()
	exit
endfunc

func __go()
	$url = GUICtrlRead($input_url)
	$cef_frame.LoadURL($url)
endfunc

func __sizing($hwnd, $msg, $wp, $lp)
	if ($cef_browser_hwnd) then
		dllcall('user32', 'bool', 'GetClientRect', 'hwnd', $hMainGUI, 'struct*', $rc)
		_MoveWindow($cef_browser_hwnd, 0, 35, $rc.w, $rc.h - 35, 1)
	endif
endfunc

func __getLifeSpanHandler()
	return $cef_lifespan.__ptr
endfunc

func __getDisplayHandler()
	return $cef_display.__ptr
endfunc

func __onAfterCreated($browser)
	if (not $cef_browser_hwnd) then
		$cef_browser = $browser
		$cef_browser_hwnd = $browser.GetHost().GetWindowHandle()
		_ShowWindow($cef_browser_hwnd, 5)
		$cef_frame = $browser.GetMainFrame()
	endif
endfunc

func __onTitleChange($browser, $title)
	WinSetTitle($hMainGUI, '', $gui_title & ' :: ' & $title.val)
endfunc

func __onAddressChange($browser, $frame, $url)
	GUICtrlSetData($input_url, $url.val)
endfunc