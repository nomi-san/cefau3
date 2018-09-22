#cs
	file: types/windows.au3
	author: wuuyi123
#ce

global $__user32 = dllopen('user32.dll')
global $__kernel32 = dllopen('kernel32.dll')

global $tag_MSG = 'hwnd hwnd;uint message;wparam wParam;lparam lParam;dword time;int x;int y;'
global $tag_POINT = 'int x;int y;'
global $tag_RECT = 'int left;int top;int right;int bottom;'

func _GetMessage($lpMsg, $hWnd = null)
	dllcall($__user32, 'bool', 'GetMessageW', 'ptr', $lpMsg, 'hwnd', $hWnd, 'int', 0, 'int', 0)
endfunc

func _DispatchMessage($lpMsg)
	dllcall($__user32, 'lresult', 'DispatchMessageW', 'ptr', $lpMsg)
endfunc

func _TranslateMessage($lpMsg)
	dllcall($__user32, 'bool', 'TranslateMessage', 'ptr', $lpMsg)
endfunc

func _ShowWindow($hWnd, $iShowCmd = 5)
	dllcall($__user32, 'bool', 'ShowWindow', 'hwnd', $hWnd, 'int', $iShowCmd)
endfunc

func _GetClientRect($hWnd, $lpRect)
	dllcall($__user32, 'bool', 'GetClientRect', 'hwnd', $hWnd, 'ptr', $lpRect)
endfunc

func _GetWindowRect($hWnd, $lpRect)
	dllcall($__user32, 'bool', 'GetWindowRect', 'hwnd', $hWnd, 'ptr', $lpRect)
endfunc