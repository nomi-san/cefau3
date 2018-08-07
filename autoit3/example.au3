#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Cefau3_udf/Cefau3.au3>

#Region

; Startup.
Cef_Start(@ScriptDir & (@AutoItX64 ? '\cef_x64' : '\cef'))

Global $iW = 1000, $iH = 650
Global $hForm = GUICreate("Sample Browser", $iW, $iH, -1, -1, BitOR($WS_SIZEBOX, $WS_OVERLAPPEDWINDOW))
GUISetBkColor(0xffffff)

; Enable high DPI support, for Win 7 or later.
Cef_EnableHighDPI()

; Initialaze Cef, return CefHandler pointer.
Global $Cef_MainFrame = Cef_Init()
; Create CEF as child and load URL.
Cef_Create($Cef_MainFrame, $hForm, "https://google.com", 0, 50, $iW, $iH)

; Create Toolbar.
Global $Cef_Toolbar = Cef_Init()
Cef_Create($Cef_Toolbar, $hForm, @ScriptDir & "\app\index.html", 0, 0, $iW, $iH)

GUISetState(@SW_SHOW, $hForm)
GUIRegisterMsg(0x0005, "WM_SIZE")

#EndRegion

; Scale size
Func WM_SIZE($hWnd, $Msg, $wParam, $lParam)

	Local $rc = DllStructCreate("int[2];int w;int h")
	DllCall("user32.dll", 'bool', 'GetClientRect', 'hwnd', $hWnd, 'struct*', $rc)

	; Get window handle and resize.
	WinMove(Cef_GetHandle($Cef_MainFrame), '', 0, 50, $rc.w, $rc.h-50)
	WinMove(Cef_GetHandle($Cef_Toolbar), '', 0, 0, $rc.w, $rc.h)

EndFunc

While 1

	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			;Cef_Close($Cef_MainFrame)
			;Cef_Close($Cef_Toolbar)
			;Cef_ExitMessageLoop(); Optional.
			;Cef_Shutdown()
			Exit

	EndSwitch

WEnd