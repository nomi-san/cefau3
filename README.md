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

- You can download [lastest releases](https://github.com/wy3/cefau3/releases) or build with following guide.

### Build [or]

- Require: 
	- Windows 7 or later.
	- Micorsoft [Visual Studio 2015](https://www.visualstudio.com) or later.
	- Microsoft [Build Tools](https://www.microsoft.com/en-us/download/details.aspx?id=48159) (optional).
	
- Clone this repository `$ git clone https://github.com/wy3/cefau3.git`

- Download **Cef Binaries Distribution** for Win32 (x86) and build it, [download here](http://opensource.spotify.com/cefbuilds/cef_binary_3.3112.1659.gfef43e0_windows32.tar.bz2).
	- Use [**CMAKE**](https://cmake.org/download/) to make solution for **Visual Studio**.
	- Build **libcef_dll_wrapper** project (set to **release** mode).
	- Copy **libcef_dll_wrapper.lib** to **Cefau3/lib/**  and **build solution** (Release x86 mode).
	
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
	|	|---libcef.dll		# libcef
	|	|---cefau3.dll		# cefau3
	|
	|---include/...			# autoit header
	|---main.au3			# main script
```
- **Resources** where? copy all file from **Cef Binaries**, in two folders **Release** and **Resources** (see download at [**Build**](https://github.com/wy3/cefau3/blob/master/README.md#build-or)).

### How it work?
- Use **`SetCurrentDirectory`**, set dir to **cef** and set to script dir after done.


### updating...


# Documents


## AutoIt

### updating...

## JavaScript

### Variable

|Type|Sign| Description|
|:-----:|:-----:|:-----|
|**int**|`<int>` |Integer number.
|**uint**|`<uint>`|Unsigned integer number.
|**string**|`<string>`| String (utf-16, included unicode & ANSI).
|**float**|`<float>`|Real number.
|**handle**|`<handle>`| Handle of window or control (can use `uint`).
|**undefined**|`<undefined>`| Undefined.
|**null**|`<null>`| Null value.
|**object**|`{<int>, <int>}`|Object, with multiple property and method.



### Function
- **Form**
```js
FuncName(<string> foo, <int> bar = 5, [<uint> opt]) => {<string> name, <uint> age}
```
- **Usage**
```js
var val;
val = FuncName("abc", -10, 2);
val = FuncName("def", 5); // pass third parameter.
alert(val.name + " " + val.age);
```

|Sign|Description
|:-----:|:-----
|**FuncName**| **Name** of function.
|**`<string> foo`**| **First parameter**, type is **string**.
|**`<int> bar = 5`**| **Second parameter**, type is **integer**; if not use this, **value must be 5** (not pass it).
|**`[<uint> opt]`**| **Third parameter**, type is unsigned integer; it's **optional**, if pass it, value will be **undefined**.
|**`=> {<string> name, <uint> age}`**| Function return **object** value, with two properties, **name** is **string** and **age** is **integer**.

### Call AutoIt function

**Usage:**
```js
Call(pointer_func, [param]) -> <void>
<- pointer_func: pointer to AutoIt function, type is <uint>.
<- param: optional, can pass it, type is <number> or <string>;
you can use <struct>, by put pointer.
```
**Exapmle 1:**
- AutoIt

	```autoit
	$Cef = ...
	; Register Callback function, no return, no param.
	Local $hCbf = DllCallbackRegister("Test", "none", "")
	; Get function pointer.
	Local $pCbf = DllCallbackGetPtr($hCbf)
	; Declare JavaScript code and execute.
	Local $JsCode = "app.Call(" & $pCbf & ");"
	Cef_ExecuteJs($Cef, $JsCode)

	Volatile Func Test()
		MsgBox(0, "Hello", "This function called from Js!")
	EndFunc
	; If not use "Volatile", program can problem
	```
**Example 2:**
- AutoIt
	```autoit
	; Declare JavaScript variable and set pointer value to it.
	...
	; Register Callback function, param will pass int value.
	Local $hCbf = DllCallbackRegister("Test", "none", "int")
	Local $pCbf = DllCallbackGetPtr($hCbf)
	Local $JsCode = "var pointer = " & $pCbf & ";"
	Cef_ExecuteJs($Cef, $JsCode)
	
	Volatile Func Test($int_param) ; -> param int
	...
	```
- JavaScript
	```js
	// Call this function by pointer variable, it was decalred in AutoIt.
	app.Call(pointer, 5) // <- one param, value is 5.
	```
**Example 3:**
- AutoIt
	```autoit
	; Some type for struct.
	Global $tagMyType = "int foo;double pi"
	
	Local $My = DllStructCreate($tagMyType)
	$My.foo = 5
	$My.pi = 3.14
	
	; Get struct pointer.
	Local $pMy = DllStructGetPtr($My)
	
	; Param is pointer
	Local $hCbf = DllCallbackRegister("Test", "none", "ptr")
	Local $pCbf = DllCallbackGetPtr($hCbf)
	Local $JsCode = "app.Call(" & $pCbf & ", " & $pMy & ");"
	Cef_ExecuteJs($Cef, $JsCode)

	Volatile Func Test($ptr)
		; Create struct and fill it from pointer.
		Local $My = DllStructCreate($tagMyType, $ptr)
		ConsoleWrite(@CLRF & $My.foo) ; -> 5
		ConsoleWrite(@CLRF & $My.pi) ; -> 3.14
	EndFunc
	```

### AutoIt binding

**app** object
```js
Print(<any> value)
```
```js
MsgBeep([<uint> rate])
```
```js
MsgBox(<string> title, <string> text, [<uint> flag = 0], [<handle>] parent = 0]) => <int>
```
```js
Call(<uint> pointer, [<any> param])
```
```js
LoadURL(<string> url)
```
```js
GoBack()
```
```js
GoForward()
```
```js
CanGoBack() => <bool>
```
```js
CanGoForward() => <bool>
```
```js
Reload()
```
```js
StopLoad()
```
```js
IsLoading()
```
```js
Minimize()
```
```js
Maximize()
```
```js
Restore()
```
```js
Hide()
```
```js
Show()
```
```js
SetOntop([<int> ontop = 1])
```
```js
ChangeTitle(<string> title)
```

**au3** object
```js
Init()
```
```js
error() => <int>
```
```js
AutoItSetOption(<string> option, <int> value) => <int>
```
```js
ClipGet() => <sttring>
```
```js
CliptPut(<string> text)
```
```js
ControlClick(<string | handle> window, <string> win_text = "", <string | handle> control, [<string> mouse_btn = "LEFT"], [<int> nclick = 1], [<int> x], [<int> y]) => <int>
```
```js
IsAdmin() => <int>
```
```js
ControlCommand(<string | handle> window, <string> win_text = "", <string | handle> control, <string> command, [<string> parameter]) => <string>
```
```js
ControlDisable(<string | handle> window, <string> win_text = "", <string | handle> control)
```
```js
ControlEnable(<string | handle> window, <string> win_text = "", <string | handle> control)
```
```js
ControlFocus(<string | handle> window, <string> win_text = "", <string | handle> control)
```
```js
ControlGetHandle(<string | handle> window, <string> win_text = "", <string> control) => <handle>
```
```js
ControlGetPos(<string | handle> window, <string> win_text = "", <string | handle> control, [<int> mode = 0]) => {<int> x, <int> x, <int> width, <int> height}
```
```js
ControlGetText(<string | handle> window, <string> win_text = "", <string | handle> control) => <string>
```
```js
ControlHide(<string | handle> window, <string> win_text = "", <string | handle> control)
```
```js
ControlMove(<string | handle> window, <string> win_text = "", <string | handle> control, <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int>
```
```js
ControlSend(<string | handle> window, <string> win_text = "", <string | handle> control, <string> send, [<int> mode]) => <int>
```
```js
ControlSetText(<string | handle> window, <string> win_text = "", <string | handle> control, <string> newtext) => <int>
```
```js
ControlShow(<string | handle> window, <string> win_text = "", <string | handle> control)
```
```js
MouseClick([<string> mouse_btn = "LEFT"], [<int> x], [<int> y], [<int> nclick = 1], [<int> speed = -1]) => <int>
```
```js
MouseClickDrag(<string> mouse_btn, <int> x1, <int> y1, <int> x2, <int> y2, [<int> speed = -1]) => <int>
```
```js
MouseClickDown([<string> mouse_btn = "LEFT"]) => <int>
```
```js
MouseGetCursor() => <int>
```
```js
MouseGetPos() => {int x, int y}
```
```js
MouseMove(<int> x, <int> y, [<int> speed = -1]) => <int> 
```
```js
MouseUp([<string> mouse_btn = "LEFT"])
```
```js
MouseWheel(<string> direction, [<int> click = 1])
```
```js
Opt(<string> option, <int> value) => <int> state
```
```js
PixelChecksum(<int> left, <int> top, <int> right, <int> bottom, [<int> step = 1]) => <int> bool
```
```js
PixelGetColor([<int> x], [<int> y]) => <int> dec_color
```
```js
PixelSearch(<int> left, <int> top, <int> right, <int> bottom, <uint> color, [<int> shade_var = 0], [<int> step = 1])
```
```js
ProcessClose(<string> processname) => <int>
```
```js
ProcessExists(<string> processname) => <int> process_id
```
```js
ProcessSetPriority(<string> processname, <int> priority) => <int> 
```
```js
ProcessWait(<string> processname, [<int> timeout]) => <int>
```
```js
ProcessWaitClose(<string> processname, [<int> timeout]) => <int>
```
```js
Run(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
```
```js
RunWait(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
```
```js
RunAs(<string> user, <string> domain, <string> password, <int> logonflag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
```
```js
RunAsWait(<string> user, <string> domain, <string> password, <int> logonflag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
```
```js
Send(<string> code, [<int> mode = 0])
```
```js
Shutdown(<int> flags) => <int>
```
```js
Sleep([<int> milliseconds = 10])
```
```js
ToolTip(<string> tip, [<int> x], [<int> y])
```
```js
WinActivate(<string | handle> window, [<string> win_text = ""]) => <int>
```
```js
WinActive(<string | handle> window, [<string> win_text =""]) => <int>
```
```js
WinClose(<string | handle> window, [<string> win_text = ""]) => <int>
```
```js
WinExists(<string | handle> window, [<string> win_text = ""]) => <int>
```
```js
WinGetCaretPos() => {<int> x, <int> y}
```
```js
WinGetClientSize(<string | handle> window, [<string> text]) => {<int> width, <int> height}
```
```js
WinGetPos(<string | handle> window, <string> win_text = "") => {<int> x, <int> y}
```
```js
WinGetProcess(<string | handle> window, <string> win_text = "") => <uint>
```
```js
WinGetState(<string | handle> window, <string> win_text = "", <>) => <int>
```
```js
WinGetText(<string | handle> window, <string> win_text = "", <>) => <string>
```
```js
WinGetTitle(<string | handle> window, <string> win_text = "") => <string>
```
```js
WinGetHandle(<string> window, <string> text = "") => <handle>
```
```js
WinKill(<string | handle> window, [<string> win_text = ""]) => <int>
```
```js
WinMenuSelectItem(<string | handle> window, <string> win_text = "", <string> item_1, [<string> item_2], [<string> item_N], ...) => <int>
```
```js
WinMinimizeAll()
```
```js
WinMinimizeAllUndo()
```
```js
WinMove(<string | handle> window, <string> win_text = "", <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int>
```
```js
WinSetOnTop(<string | handle> window, <string> win_text = "", [<int> flag = 1]) => <int>
```
```js
WinSetState(<string | handle> window, <string> win_text = "", <int> flag) => <int>
```
```js
WinSetTitle(<string | handle> window, <string> win_text = "", <string> newtitle) => <int>
```
```js
WinSetTrans(<string | handle> window, <string> win_text = "", <int> transparent) => <int>
```
```js
WinWait(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
```
```js
WinWaitActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
```
```js
WinWaitClose(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
```
```js
WinWaitNotActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
```

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=CZ5C58TN4LY4L)
