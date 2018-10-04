#cs
    file: api/task.au3
    author: wuuyi123
#ce

#include-once

#include-once

; CefTask
; ==================================================

global $tag_CefTask = ( _
    $tag_CefBase    & _
    'ptr;'          _
)

func CefTask_Create($ptr = null)
    local $struct = CefStruct_Create($tag_CefTask, 'CefTask', $ptr)
    $struct.size = $struct.__size__

    CefStruct_AddMethod($struct, 'Execute',  '__CefTask_Execute')

    return $struct
endfunc

func __CefTask_Execute($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefTask_Execute', 'ptr', $self.__pointer__)
endfunc

; CefTaskRunner
; ==================================================

global $tag_CefTaskRunner = ( _
    $tag_CefBase    & _
    'ptr[5];'       _
)

; ==================================================

func CefTaskRunner_Create($ptr = null)
    local $struct = CefStruct_Create($tag_CefTaskRunner, 'CefTaskRunner', $ptr)
    $struct.size = $struct.__size__

    CefStruct_AddMethod($struct, 'IsSame',                  '__CefTaskRunner_IsSame')
    CefStruct_AddMethod($struct, 'BelongsToCurrentThread',  '__CefTaskRunner_BelongsToCurrentThread')
    CefStruct_AddMethod($struct, 'BelongsToThread',         '__CefTaskRunner_BelongsToThread')
    CefStruct_AddMethod($struct, 'PostTask',                '__CefTaskRunner_PostTask')
    CefStruct_AddMethod($struct, 'PostDelayedTask',         '__CefTaskRunner_PostDelayedTask')

    return $struct
endfunc

func __CefTaskRunner_IsSame($self, $that)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_IsSame', 'ptr', $self.__pointer__, 'ptr', $that)
    return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_BelongsToCurrentThread($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_BelongsToCurrentThread', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_BelongsToThread($self, $threadId)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_BelongsToThread', 'ptr', $self.__pointer__, 'int', $threadId)
    return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_PostTask($self, $task)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_PostTask', 'ptr', $self.__pointer__, 'ptr', $task)
    return @error ? 0 : $ret[0]
endfunc

func __CefTaskRunner_PostDelayedTask($self, $delay_ms)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefTaskRunner_PostDelayedTask', 'ptr', $self.__pointer__, 'int64', $delay_ms)
    return @error ? 0 : $ret[0]
endfunc