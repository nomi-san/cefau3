<p>
	<h1 align="center">
		<img src="https://raw.githubusercontent.com/wy3/cefau3/master/cefau3.png" width=180>
		<br>
		<br>
		Cefau3
	</h1>
	<h3 align="center">Chromium Embedded Framework for AutoIt 3</h3>
	<h4 align="center">- Bring Chromium to anyone -</h4>
	<p align="center">
		<a href="#">
			<img src="https://img.shields.io/badge/platform-win32/64/arm-lightgrey.svg?longCache=true&style=flat-square">
		</a>
		<a href="http://opensource.spotify.com/cefbuilds/index.html">
			<img src="https://img.shields.io/badge/cef-3.3163-blue.svg?longCache=true&style=flat-square">
		</a>
		<a href="#">
			<img src="https://img.shields.io/badge/chromium-61.0.3-red.svg?longCache=true&style=flat-square">
		</a>
		<br>
		<a href="https://github.com/wy3">
			<img src="https://img.shields.io/badge/author-wuuyi123-orange.svg?longCache=true&style=flat-square">
		</a>
		<a href="https://github.com/wy3/cefau3/blob/master/LICENSE">
			<img src="https://img.shields.io/badge/license-MIT-green.svg?longCache=true&style=flat-square">
		</a>
	</p>
</p>

-------
# Gettings Started

## Setup

### Install

- **You can download [lastest releases](https://github.com/wy3/cefau3/releases)** or **build** with following guide.

### Build [or]

- Prerequisites: 
	- Windows 7 or later.
	- Micorsoft [Visual Studio 2010](https://www.visualstudio.com) or later.
	- Microsoft [Build Tools](https://www.microsoft.com/en-us/download/details.aspx?id=48159) (optional).
	
- Download [CEF binary distribution](http://opensource.spotify.com/cefbuilds/cef_binary_3.3163.1671.g700dc25_windows32_minimal.tar.bz2) (x86, this's current ver in project) or [others at here](http://opensource.spotify.com/cefbuilds/index.html)
- Clone this repository `$ git clone https://github.com/wy3/cefau3.git`
- Run solution, wait for loaded
	- Copy __include__ and __libcef_dll__ folders to __cefau3/cef/__
	- Copy __libcef.lib__ to __cefau3/cef/__ (__cefau3/cef/x64__ for x64)
	- Copy __AutoItX3_DLL.lib__ to __cefau3/cef/__ (__cefau3/cef/x64__ for x64)
	- Replace all src files in **libcefd_dll_wrapper** with __cefau3/cef/libcef_dll__
- Start build solution, after done, copy all files in __release__ and __resources__ folders (exclude __* .lib__) to __autoit3\cef\__

## Configuration

### AutoIt program:

- Set a project directory following

```j
program/
	|---app/...
	|	|---css/...		# style
	|	|---js/...		# javascript
	|	|---app.js		# app
	|	|---index.html		# index
	|
	|---cef/...			# resources
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
```

- **Resources** where? copy all file from **Cef Binaries**, in two folders **Release** and **Resources** (see download at [**Build**](https://github.com/wy3/cefau3/blob/master/README.md#build-or)).
- Copy **AutoItX3.dll** from **.AutoIt3/AutoItX/** directory.

### updating...

# Documents
- **Visit [Wiki](https://github.com/wy3/cefau3/wiki)**
<br>

## Simple Example

```au3
#include './cefau3/cefau3.au3'

; start Cefau3
global $cef = CefStart(default)

; Windows constant
global const $CW_USEDEFAULT = 0x80000000, _
    $WS_VISIBLE             = 0x10000000, _
    $WS_OVERLAPPEDWINDOW    = 0x00CF0000

; enable high DPI, support on Windows 7 or later
$cef.EnableHighDPISupport()

; create new struct
global $cef_app = $cef.new('App'), _
    $cef_args = $cef.new('MainArgs')

; execute process,
if ($cef.ExecuteProcess($cef_args.ptr, $cef_app.ptr) >= 0) then exit

; if [Settings].single_process = 1 (true), do not insert code above
; -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

Cef_Print(@crlf & 'CEF: ' & $cef.Version & _
    @crlf & 'Chromium: ' & $cef.ChromiumVersion & @crlf)

global $cef_settings = $cef.new('Settings'), _
    $cef_bs = $cef.new('BrowserSettings')

; multiprocess for performance, not work while running script
$cef_settings.single_process = @Compiled ? 0 : 1

; initialize
if ($cef.Initialize($cef_args.ptr, $cef_settings.ptr, $cef_app.ptr) == 0) then exit

; create WindowInfo & set attribute for Cef browser window
global $cef_wininfo = $cef.new('WindowInfo')
$cef_wininfo.window_name = 'Hello World!'
$cef_wininfo.style  = bitor($WS_VISIBLE, $WS_OVERLAPPEDWINDOW)
$cef_wininfo.x      = $CW_USEDEFAULT
$cef_wininfo.y      = $CW_USEDEFAULT
$cef_wininfo.width  = $CW_USEDEFAULT
$cef_wininfo.height = $CW_USEDEFAULT

; Client & LifeSpanHandler, it's callback handler, implement property for control
global $cef_client = $cef.new('Client'), _
    $cef_lifespan = $cef.new('LifeSpanHandler')

; implement callback functions
$cef_client.GetLifeSpanHandler = '__getLifeSpanHandler'
$cef_lifespan.OnAfterCreated   = '__onAfterCreated'
$cef_lifespan.OnBeforeClose    = '__onBeforeClose'

global $url = 'https://www.google.com'
$cef.CreateBrowser($cef_wininfo.ptr, $cef_client.ptr, $url, $cef_bs.ptr, Null)

do ; message loop
until Cef_WindowMessage()

; -- callback function
                        ; $client == self.ptr == $cef_client
func __getLifeSpanHandler($client)
    return $cef_lifespan.ptr
endfunc

func __onAfterCreated($life_span, $browser)
    Cef_Print(@crlf & '-- on after created --')
endfunc

func __onBeforeClose($life_span, $browser)
    Cef_Print(@crlf & '-- on before close --')
    CefEnd(); shutdown
    exit
endfunc
```

<br>

<p align="center">
	<img src="https://i.imgur.com/TOY8syh.png" width=800>
</p>

<br>

```batch
CEF: 3.3163.1671.g700dc25
Chromium: 61.0.3163

-- on after created --
-- on before close --
```
