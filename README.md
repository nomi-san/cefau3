<p>
	<h1 align="center">
		<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Chromium_Material_Icon-256x256.png" width=100>
		&
		<img src="https://seeklogo.com/images/A/autoit-logo-CC4B097310-seeklogo.com.png" width=100>
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

![](https://github.com/wy3/data/raw/master/cefau3-test.png)
