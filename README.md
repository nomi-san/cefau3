Cefau3 - Chromium Embedded Framework for AutoIt3
===
[![platform](https://img.shields.io/badge/platform-win32-lightgrey.svg?longCache=true&style=flat-square)]()
[![cefversion](https://img.shields.io/badge/cef-3.3112-blue.svg?longCache=true&style=flat-square)](http://opensource.spotify.com/cefbuilds/index.html)
[![chromium](https://img.shields.io/badge/chromium-60-red.svg?longCache=true&style=flat-square)]()

[![author](https://img.shields.io/badge/author-wuuyi123-orange.svg?longCache=true&style=flat-square)](https://github.com/wy3)
[![license](https://img.shields.io/badge/license-MIT-green.svg?longCache=true&style=flat-square)](https://github.com/wy3/cefau3/blob/master/LICENSE)

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
	
- Clone this repository `$ git cl

one https://github.com/wy3/cefau3.git`

- Download **Cef Binaries Distribution** for Win32 (x86) and build it, [download here](http://opensource.spotify.com/cefbuilds/cef_binary_3.3112.1659.gfef43e0_windows32.tar.bz2).
	- Use [**CMAKE**](https://cmake.org/download/) to make solution for **Visual Studio**.
	- Build **libcef_dll_wrapper** project (set to **Release x86** mode).
	- Copy **libcef.lib** and **libcef_dll_wrapper.lib** to **Cefau3/lib/**.
	- Build **Cefau3** solution (with default config).
	
## Configuration

### AutoIt program:

- Set a project following
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
