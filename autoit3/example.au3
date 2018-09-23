;~ // file: example_1.au3
;~ // content: Cefau3 example
;~ // author: wuuyi123

#include './cefau3/cefau3.au3'

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

; execute process,
if ($cef.ExecuteProcess($cef_args.__ptr, $cef_app.__ptr) >= 0) then exit

; if $cef_settings.single_process = 1 (true, in line 35), do not insert code above
; -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

Cef_Print('CEF: ' & $cef.Version  & '\n' & _
	'Chromium: ' & $cef.ChromiumVersion & '\n')

global $cef_settings = $cef.new('Settings'), _
	$cef_bs = $cef.new('BrowserSettings')

; multiprocess for performance, not work while running script
$cef_settings.single_process = @Compiled ? 0 : 1
;~ $cef_settings.cache_path = @ScriptDir & '\cache'

; initialize
if ($cef.Initialize($cef_args.__ptr, $cef_settings.__ptr, $cef_app.__ptr) == 0) then exit

; create WindowInfo & set attribute for Cef browser window
global $cef_wininfo = $cef.new('WindowInfo')
$cef_wininfo.window_name = 'Hello World!'
$cef_wininfo.style 	= bitor($WS_VISIBLE, $WS_OVERLAPPEDWINDOW)
$cef_wininfo.x 		= $CW_USEDEFAULT
$cef_wininfo.y 		= $CW_USEDEFAULT
$cef_wininfo.width 	= $CW_USEDEFAULT
$cef_wininfo.height = $CW_USEDEFAULT

; Client & LifeSpanHandler, it's callback handler, implement property for control
global $cef_client = $cef.new('Client'), _
	$cef_lifespan = $cef.new('LifeSpanHandler')

; implement callback functions
$cef_client.GetLifeSpanHandler = '__getLifeSpanHandler'
$cef_lifespan.OnAfterCreated = '__onAfterCreated'
$cef_lifespan.OnBeforeClose = '__onBeforeClose'

global $url = 'https://google.com'
$cef.CreateBrowser($cef_wininfo.__ptr, $cef_client.__ptr, $url, $cef_bs.__ptr, Null)

OnAutoItExitRegister(CefEnd) ; register CefEnd for on exit

do ; message loop
until Cef_WindowMessage()

; -- callback function

;                         $self.__ptr == $cef_client.__ptr
func __getLifeSpanHandler($self)
	return $cef_lifespan.__ptr
endfunc

; same
func __onAfterCreated($self, $browser)
	Cef_Print('-- on after created --\n')
	Cef_Print('Check $self is $cef_lifespan: ' & ($self.__ptr == $cef_lifespan.__ptr) & '\n') ; -> true
endfunc

func __onBeforeClose($life_span, $browser)
	Cef_Print('-- on before close --\n')
	exit
endfunc