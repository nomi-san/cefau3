<p>
	<h1 align="center">
		<img src="https://raw.githubusercontent.com/wy3/cefau3/master/cefau3.png" width=180>
		<br>
		Cefau3
	</h1>
	<h3 align="center">Chromium Embedded Framework for AutoIt 3</h3>
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
## Changelog


#### 2018.09.20 [82%]
- use AutoItObject for save code
- only create C struct in AutoIt

#### 2018.09.05 [58%]
- fixed string pointer, null pointer exception when using string function
- add build with commandline method for C compiler

#### 2018.08.27 [40%]
- add more type, callback & event handler
- fixed some bugs

#### 2018.08.11 [15% * in new project]
- Cefau3 was rewritten in C99, use native-code-like (syntax, struct, type, method, prop... like C++ & base on C)
- use only functionally for code
- add more callback & event handler

#### 2018.08.07 [20%]
- update to Chromium v61.0.3, increate more performance
- added build for __x64/ARM__
- added __Cef_Shutdown()__ for shutdown CEF & all browser window/child
- added __Cef_Close()__ for close main browser in handler
- can save cache & cookie to path; __Cef_Init()__, second arg is path to store cache (default is .\cache) can delete it when browser closed
- fixed Youtube rendering error
- fixed crash when exit (may crash on x64)
- add more callback & event handler

#### 2018.04.26 [16%]
- first release of Cefau3, written in C++

## Install

- **You can download [lastest releases](https://github.com/wy3/cefau3/releases)** or **build** with following guide.

## Build

### Visual Studio method:
Open **vs/cefau3.sln** with Microsoft Visual Studio (default is VS2015)
Set to **Release** mode and **Build**

### Commandline method:
Run **build.bat** with arguments below for option compiler:
- **msvc**: Microsoft Visual C Ccompiler (with VS Commandline Tools)
- [**gcc**](http://www.mingw.org/): GNU C compiler
- [**tcc**](https://bellard.org/tcc/): Tiny C compiler

E.g: `$ build gcc`

### Configure

After built, it need CEF resources for work correctly, download CEF binary distribution (for current version) : [x86](http://opensource.spotify.com/cefbuilds/cef_binary_3.3163.1671.g700dc25_windows32_minimal.tar.bz2) / [x86_x64](http://opensource.spotify.com/cefbuilds/cef_binary_3.3163.1671.g700dc25_windows64_minimal.tar.bz2)
Extract CEF binary distribution package, and copy all files in **release** and **esources** folders (exclude **.lib**) to **autoit3\cef\**

### Cefau3 example project

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

### updating...

## Simple Example

```au3
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
```

<p align="center">
	<img src="https://i.imgur.com/TOY8syh.png" width=800>
</p>

```batch
CEF: 3.3163.1671.g700dc25
Chromium: 61.0.3163
-- on after created --
Check $self is $cef_lifespan: True
-- on before close --
```

<br>

## License: [MIT](https://github.com/wy3/cefau3/blob/master/LICENSE)

Copyright © 2018 by [me](https://github.com/wy3)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
