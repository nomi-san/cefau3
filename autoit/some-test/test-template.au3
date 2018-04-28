#include <WinAPISysWin.au3>
#include <WinAPITheme.au3>
#include "../cefau3_udf/cefau3.au3"

HotKeySet('{ESC}', 'NextStep')
Cef_Start("../cef/")

Global $Step = -1
Global $LitsURL[3] =   ["file://" & @ScriptDir & '/3d-animate-words/index.html', _
						"file://" & @ScriptDir & '/blog-template/index.html', _
						"file://" & @ScriptDir & '/vortex/index.html']

Global $W = 800, $H = 600

Global $hForm = _WinAPI_CreateWindowEx(0, '#32770', 'Hi! Please press ESC!', 0x10000000, (@DesktopWidth-$W)/2, (@DesktopHeight-$H)/2, $W, $H, 0)

Global $Cef = Cef_Init()
Cef_Create($Cef, $hForm, '', 0, 0, $W, $H)

While 1
	Sleep(10)
WEnd

Func NextStep()
	$Step += 1
	If $Step == 3 Then
		_WinAPI_DestroyWindow($hForm)
		Exit
	EndIf
	Cef_LoadURL($Cef, $LitsURL[$Step])
EndFunc