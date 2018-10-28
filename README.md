<p>
	<h1 align="center">
		<img src="https://raw.githubusercontent.com/wy3/cefau3/master/cefau3.png" width=150>
		<br>
		Cefau3
	</h1>
	<h3 align="center">Chromium Embedded Framework for AutoIt 3</h3>
	<br>
	<p align="center">
		<a href="https://ci.appveyor.com/project/wy3/cefau3" target="_blank">
			<img src="https://ci.appveyor.com/api/projects/status/github/wy3/cefau3?branch=master&svg=true">
		</a>
		<br>
		<a href="#">
			<img src="https://img.shields.io/badge/platform-win32/x86/x64-lightgrey.svg">
		</a>
		<a href="http://opensource.spotify.com/cefbuilds/index.html">
			<img src="https://img.shields.io/badge/cef-3.3163-blue.svg">
		</a>
		<a href="#">
			<img src="https://img.shields.io/badge/chromium-61.0.3-red.svg">
		</a>
		<a href="https://github.com/wy3">
			<img src="https://img.shields.io/badge/author-wuuyi123-orange.svg">
		</a>
		<a href="https://github.com/wy3/cefau3/blob/master/LICENSE">
			<img src="https://img.shields.io/badge/license-MIT-green.svg">
		</a>
	</p>
</p>

-------
## Changelog

#### 2018.10.23 [74% rollback]
- change method create object to C/C++ side
- fix some bugs
- change some code styles

#### 2018.10.10 [79%]
- fix window message loop
- add force close process for quick exit
- fix some crashes

#### 2018.10.08 [78%]
- change window message loop method
- fix some crashes

#### 2018.10.04 [75% - rollback]
- change struct creation method to C side
- struct is implemented

#### 2018.09.20 [82%]
- use AutoItObject for save code
- only create C struct in AutoIt

#### 2018.09.05 [58%]
- fixed string pointer, null pointer exception when using string function
- add build with commandline method for C compiler

#### 2018.08.27 [40%]
- add more type, callback & event handler
- fixed some bugs

#### 2018.08.11 [15% - in new project]
- Cefau3 was rewritten in C99, use native-code-like (syntax, struct, type, method, prop... like C++ & base on C)
- use only functionally for code
- add more callback & event handler

#### 2018.08.07 [20%]
- update to Chromium v61.0.3, increase more performance
- added build for **x64/ARM**
- added **Cef_Shutdown()** for shutdown CEF & all browser window/child
- added **Cef_Close()** for close main browser in handler
- can save cache & cookie to path; **Cef_Init()**, second arg is path to store cache (default is .\cache) can delete it when browser closed
- fixed Youtube rendering error
- fixed crash when exit (may crash on x64)
- add more callback & event handler

#### 2018.04.26 [16%]
- first release of Cefau3, written in C++

## Install

- **You can download [lastest releases](https://github.com/wy3/cefau3/releases)** or **build** with following guide.

## Build

### Visual Studio method:

- Open **vs/cefau3.sln** with Microsoft Visual Studio (default is VS2015)
- Set to **Release** mode and **Build**

### Commandline method:

Run **build.bat** with arguments below for option compiler:
- **msvc**: Microsoft Visual C/C++ Ccompiler (Visual Studio Commandline Tools)
- [**mingw**](http://www.mingw.org/): GNU C/C++ compiler (MinGW, TDM-GCC, Cygwin...)

E.g: `$ build mingw`

### Configure

After built, it need CEF resources for work correctly, download CEF binary distribution (for current version): [x86](http://opensource.spotify.com/cefbuilds/cef_binary_3.3163.1671.g700dc25_windows32_minimal.tar.bz2) | [x64_x86](http://opensource.spotify.com/cefbuilds/cef_binary_3.3163.1671.g700dc25_windows64_minimal.tar.bz2)

Extract CEF binary distribution package, and copy all files in **release** and **resources** folders (exclude **.lib**) to <b>autoit3/cef/</b>



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
	|---cefau3/...			# cefau3 udf
	|	|---base/...
	|	|---cefau3.au3
	|
	|---main.au3			# main script
```

- **Resources** where? copy all file from **Cef Binaries**, in two folders **Release** and **Resources** (see download at [**Build**](https://github.com/wy3/cefau3/blob/master/README.md#build-or)).

### updating...

## Example

Please see [**example.au3**](https://github.com/wy3/cefau3/blob/master/autoit3/example.au3).

<p align="center">
	<img src="https://i.imgur.com/iTzhK0s.png" width=800>
</p>

```batch
CEF: 3.3163.1671.g700dc25
Chromium: 61.0.3163
```
### Mini Browser

Visit here: [https://github.com/wy3/mb](https://github.com/wy3/mb).

<p align="center">
	<img src="https://i.imgur.com/3IzYuLv.png" width=800>
</p>



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
