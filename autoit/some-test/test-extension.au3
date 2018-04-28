#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <../cefau3_udf/cefau3.au3>

CEf_Start('../cef/')

Global $hForm = GUICreate("", 700, 500)

Global $Cef = Cef_Init()
Cef_Create($Cef, $hForm, 'file://' & @ScriptDir & '/test-extension/index.html')

Sleep(200) ; Wait for Cef done, if use $Cef below (not in function).

; Register callback function for JavaScript call, no return and param is string with 'wstr' type.
Global $hClb = DllCallbackRegister('Test', 'none', 'wstr')

; Execute JavaScript, declare pointer of AutoIt function.
Cef_ExecuteJs($Cef, 'var myau3pointer = ' & DllCallbackGetPtr($hClb) & ';')

GUISetState(@SW_SHOW)

Func Test($ret)
	MsgBox(0, "Hi, I'm AutoIt messagebox", $ret)
EndFunc

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
