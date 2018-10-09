#cs
	file: api/download_item.au3
	author: wuuyi123
#ce

#include-once

; CefDownloadItem
; ==================================================

global $__CefDownloadItem = null

func CefDownloadItem_Create($ptr)
	if $__CefDownloadItem == null then
		$__CefDownloadItem = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefDownloadItem, '__ptr')
		_AutoItObject_AddProperty($__CefDownloadItem, '__type', 1, 'CefDownloadItem')
		
		_AutoItObject_AddMethod($__CefDownloadItem, 'IsValid', '__CefDownloadItem_IsValid')
		_AutoItObject_AddMethod($__CefDownloadItem, 'IsInProgress', '__CefDownloadItem_IsInProgress')
		_AutoItObject_AddMethod($__CefDownloadItem, 'IsComplete', '__CefDownloadItem_IsComplete')
		_AutoItObject_AddMethod($__CefDownloadItem, 'IsCanceled', '__CefDownloadItem_IsCanceled')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetCurrentSpeed', '__CefDownloadItem_GetCurrentSpeed')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetPercentComplete', '__CefDownloadItem_GetPercentComplete')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetTotalBytes', '__CefDownloadItem_GetTotalBytes')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetReceivedBytes', '__CefDownloadItem_GetReceivedBytes')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetStartTime', '__CefDownloadItem_GetStartTime')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetEndTime', '__CefDownloadItem_GetEndTime')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetFullPath', '__CefDownloadItem_GetFullPath')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetId', '__CefDownloadItem_GetId')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetUrl', '__CefDownloadItem_GetUrl')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetOriginalUrl', '__CefDownloadItem_GetOriginalUrl')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetSuggestedFileName', '__CefDownloadItem_GetSuggestedFileName')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetContentDisposition', '__CefDownloadItem_GetContentDisposition')
		_AutoItObject_AddMethod($__CefDownloadItem, 'GetMimeType', '__CefDownloadItem_GetMimeType')
	endif

	local $self = _AutoItObject_Create($__CefDownloadItem)
	$self.__ptr = $ptr
	return $self
endfunc

; ==================================================

func __CefDownloadItem_IsValid($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefDownloadItem_IsValid', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_IsInProgress($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefDownloadItem_IsInProgress', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_IsComplete($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefDownloadItem_IsComplete', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_IsCanceled($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefDownloadItem_IsCanceled', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetCurrentSpeed($self)
	local $ret = dllcall($__Cefau3Dll__, 'int64:cdecl', 'CefDownloadItem_GetCurrentSpeed', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetPercentComplete($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefDownloadItem_GetPercentComplete', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetTotalBytes($self)
	local $ret = dllcall($__Cefau3Dll__, 'int64:cdecl', 'CefDownloadItem_GetTotalBytes', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetReceivedBytes($self)
	local $ret = dllcall($__Cefau3Dll__, 'int64:cdecl', 'CefDownloadItem_GetReceivedBytes', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

; time

func __CefDownloadItem_GetStartTime($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefDownloadItem_GetStartTime', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

; time

func __CefDownloadItem_GetEndTime($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefDownloadItem_GetEndTime', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetFullPath($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetFullPath', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetId($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefDownloadItem_GetId', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetUrl', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetOriginalUrl($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetOriginalUrl', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetSuggestedFileName($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetSuggestedFileName', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetContentDisposition($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetContentDisposition', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefDownloadItem_GetMimeType($self)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', 'CefDownloadItem_GetMimeType', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc