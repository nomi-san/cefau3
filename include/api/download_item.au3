#cs
	file: api/download_item.au3
	author: wuuyi123
#ce

#include-once

; ==================================================
; // CefDownloadItem
; ==================================================

with _AutoItObject_Class()

	.AddProperty('__ptr')
	.AddProperty('__type', 1, 'CefDownloadItem')

	.AddMethod('IsValid', 				'__CefDownloadItem_IsValid')
	.AddMethod('IsInProgress', 			'__CefDownloadItem_IsInProgress')
	.AddMethod('IsComplete', 			'__CefDownloadItem_IsComplete')
	.AddMethod('IsCanceled',			'__CefDownloadItem_IsCanceled')
	.AddMethod('GetCurrentSpeed', 		'__CefDownloadItem_GetCurrentSpeed')
	.AddMethod('GetPercentComplete', 	'__CefDownloadItem_GetPercentComplete')
	.AddMethod('GetTotalBytes', 		'__CefDownloadItem_GetTotalBytes')
	.AddMethod('GetReceivedBytes', 		'__CefDownloadItem_GetReceivedBytes')
	.AddMethod('GetStartTime', 			'__CefDownloadItem_GetStartTime')
	.AddMethod('GetEndTime', 			'__CefDownloadItem_GetEndTime')
	.AddMethod('GetFullPath', 			'__CefDownloadItem_GetFullPath')
	.AddMethod('GetId', 				'__CefDownloadItem_GetId')
	.AddMethod('GetUrl', 				'__CefDownloadItem_GetUrl')
	.AddMethod('GetOriginalUrl', 		'__CefDownloadItem_GetOriginalUrl')
	.AddMethod('GetSuggestedFileName', 	'__CefDownloadItem_GetSuggestedFileName')
	.AddMethod('GetContentDisposition', '__CefDownloadItem_GetContentDisposition')
	.AddMethod('GetMimeType', 			'__CefDownloadItem_GetMimeType')

	global $__CefDownloadItem = .Object

endwith

; ==================================================

func CefDownloadItem_Create($ptr)
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