#cs
	file: api/task.au3
	author: wuuyi123
#ce

#include-once

; CefTask
; ==================================================

func CefTask_Create($ptr = null)
	;local $self = CefObject_Create('CefTask', $ptr)

	;CefObject_AddMethod($self, 'Execute',  '__CefTask_Execute')

	;return $self
endfunc

func __CefTask_Execute($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefTask_Execute', 'ptr', $self.__ptr)
endfunc

; CefTaskRunner
; ==================================================

func CefTaskRunner_Create($ptr = null)
	;local $self = CefObject_Create('CefTaskRunner', $ptr)

	;CefObject_AddMethod($self, 'IsSame',					'__CefTaskRunner_IsSame')
	;CefObject_AddMethod($self, 'BelongsToCurrentThread',   '__CefTaskRunner_BelongsToCurrentThread')
	;CefObject_AddMethod($self, 'BelongsToThread',			'__CefTaskRunner_BelongsToThread')
	;CefObject_AddMethod($self, 'PostTask',					'__CefTaskRunner_PostTask')
	;CefObject_AddMethod($self, 'PostDelayedTask',			'__CefTaskRunner_PostDelayedTask')

	;return $self
endfunc

func __CefTaskRunner_IsSame($self, $that)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_IsSame', 'ptr', $self.__ptr, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_BelongsToCurrentThread($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_BelongsToCurrentThread', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_BelongsToThread($self, $threadId)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_BelongsToThread', 'ptr', $self.__ptr, 'int', $threadId)
	return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_PostTask($self, $task)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_PostTask', 'ptr', $self.__ptr, 'ptr', $task)
	return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_PostDelayedTask($self, $delay_ms)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_PostDelayedTask', 'ptr', $self.__ptr, 'int64', $delay_ms)
	return @error ? 0 : $ret[0]
endfunc