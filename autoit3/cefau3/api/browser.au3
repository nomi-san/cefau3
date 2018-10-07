#cs
	file: api/browser.au3
	author: wuuyi123
#ce

#include-once

global $__CefBrowser = null

; CefBrowser
; ==================================================

func CefBrowser_Create($ptr = null)
	if $__CefBrowser == null then
		$__CefBrowser = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefBrowser, '__ptr')
		_AutoItObject_AddProperty($__CefBrowser, '__type', 1, 'CefBrowser')
		
		_AutoItObject_AddMethod($__CefBrowser, 'GetHost', '__CefBrowser_GetHost')
		_AutoItObject_AddMethod($__CefBrowser, 'CanGoBack', '__CefBrowser_CanGoBack')
		_AutoItObject_AddMethod($__CefBrowser, 'GoBack', '__CefBrowser_GoBack')
		_AutoItObject_AddMethod($__CefBrowser, 'CanGoForward', '__CefBrowser_CanGoForward')
		_AutoItObject_AddMethod($__CefBrowser, 'GoForward', '__CefBrowser_GoForward')
		_AutoItObject_AddMethod($__CefBrowser, 'IsLoading', '__CefBrowser_IsLoading')
		_AutoItObject_AddMethod($__CefBrowser, 'Reload', '__CefBrowser_Reload')
		_AutoItObject_AddMethod($__CefBrowser, 'ReloadIgnoreCache', '__CefBrowser_ReloadIgnoreCache')
		_AutoItObject_AddMethod($__CefBrowser, 'StopLoad', '__CefBrowser_StopLoad')
		_AutoItObject_AddMethod($__CefBrowser, 'GetIdentifier', '__CefBrowser_GetIdentifier')
		_AutoItObject_AddMethod($__CefBrowser, 'IsSame', '__CefBrowser_IsSame')
		_AutoItObject_AddMethod($__CefBrowser, 'IsPopup', '__CefBrowser_IsPopup')
		_AutoItObject_AddMethod($__CefBrowser, 'HasDocument', '__CefBrowser_HasDocument')
		_AutoItObject_AddMethod($__CefBrowser, 'GetMainFrame', '__CefBrowser_GetMainFrame')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFocusedFrame', '__CefBrowser_GetFocusedFrame')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFrameByident', '__CefBrowser_GetFrameByident')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFrame', '__CefBrowser_GetFrame')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFrameCount', '__CefBrowser_GetFrameCount')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFrameIdentifiers', '__CefBrowser_GetFrameIdentifiers')
		_AutoItObject_AddMethod($__CefBrowser, 'GetFrameNames', '__CefBrowser_GetFrameNames')
		_AutoItObject_AddMethod($__CefBrowser, 'SendProcessMessage', '__CefBrowser_SendProcessMessage')
	endif

	local $self = _AutoItObject_Create($__CefBrowser)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefBrowser_GetHost($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetHost', 'ptr', $self.__ptr)
	 $ret = $ret[0]
	return CefBrowserHost_Create($ret)
endfunc

func __CefBrowser_CanGoBack($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoBack', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GoBack($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoBack', 'ptr', $self.__ptr)
endfunc

func __CefBrowser_CanGoForward($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoForward', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GoForward($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoForward', 'ptr', $self.__ptr)
endfunc

func __CefBrowser_IsLoading($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsLoading', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_Reload($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_Reload', 'ptr', $self.__ptr)
endfunc

func __CefBrowser_ReloadIgnoreCache($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_ReloadIgnoreCache', 'ptr', $self.__ptr)
endfunc

func __CefBrowser_StopLoad($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_StopLoad', 'ptr', $self.__ptr)
endfunc

func __CefBrowser_GetIdentifier($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetIdentifier', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_IsSame($self, $that = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsSame', 'ptr', $self.__ptr, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_IsPopup($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsPopup', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_HasDocument($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_HasDocument', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetMainFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetMainFrame', 'ptr', $self.__ptr)
	$ret = $ret[0]
	return CefFrame_Create($ret)
endfunc

func __CefBrowser_GetFocusedFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetFocusedFrame', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameByident($self, $identifier)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrameByident', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrame($self, $name = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrame', 'ptr', $self.__ptr, 'wstr', $name)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameCount($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefBrowser_GetFrameCount', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameIdentifiers($self, $identifiersCount = null, $identifiers = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GetFrameIdentifiers', 'ptr', $self.__ptr, 'uint*', $identifiersCount, 'int64*', $identifiers)
endfunc

func __CefBrowser_GetFrameNames($self, $names = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GetFrameNames', 'ptr', $self.__ptr, 'ptr', $names)
endfunc

func __CefBrowser_SendProcessMessage($self, $target_process = 0, $message = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_SendProcessMessage', 'ptr', $self.__ptr, 'int', $target_process, 'ptr', $message)
	return @error ? 0 : $ret[0]
endfunc

; CefBrowserHost
; ==================================================

global $__CefBrowserHost = null

; ==================================================

func CefBrowserHost_Create($ptr = null)
	if ($__CefBrowserHost == null) then
		$__CefBrowserHost = _AutoItObject_Create()
		_AutoItObject_AddProperty($__CefBrowserHost, '__ptr')
		_AutoItObject_AddProperty($__CefBrowserHost, '__type', 1, 'CefBrowserHost')

		_AutoItObject_AddMethod($__CefBrowserHost, 'GetBrowser', '__CefBrowserHost_GetBrowser')
		_AutoItObject_AddMethod($__CefBrowserHost, 'CloseBrowser', '__CefBrowserHost_CloseBrowser')
		_AutoItObject_AddMethod($__CefBrowserHost, 'TryCloseBrowser', '__CefBrowserHost_TryCloseBrowser')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SetFocus', '__CefBrowserHost_SetFocus')
		_AutoItObject_AddMethod($__CefBrowserHost, 'HasView', '__CefBrowserHost_HasView')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetClient', '__CefBrowserHost_GetClient')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetRequestContext', '__CefBrowserHost_GetRequestContext')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetZoomLevel', '__CefBrowserHost_GetZoomLevel')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SetZoomLevel', '__CefBrowserHost_SetZoomLevel')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetWindowHandle', '__CefBrowserHost_GetWindowHandle')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetOpenerWindowHandle', '__CefBrowserHost_GetOpenerWindowHandle')
		_AutoItObject_AddMethod($__CefBrowserHost, 'RunFileDialog', '__CefBrowserHost_RunFileDialog')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DownloadImage', '__CefBrowserHost_DownloadImage')
		_AutoItObject_AddMethod($__CefBrowserHost, 'PrintToPDF', '__CefBrowserHost_PrintToPDF')
		_AutoItObject_AddMethod($__CefBrowserHost, 'Find', '__CefBrowserHost_Find')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ShowDevTools', '__CefBrowserHost_ShowDevTools')
		_AutoItObject_AddMethod($__CefBrowserHost, 'StartDownload', '__CefBrowserHost_StartDownload')
		_AutoItObject_AddMethod($__CefBrowserHost, 'Print', '__CefBrowserHost_Print')
		_AutoItObject_AddMethod($__CefBrowserHost, 'StopFinding', '__CefBrowserHost_StopFinding')
		_AutoItObject_AddMethod($__CefBrowserHost, 'CloseDevTools', '__CefBrowserHost_CloseDevTools')
		_AutoItObject_AddMethod($__CefBrowserHost, 'HasDevTools', '__CefBrowserHost_HasDevTools')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetNavigationEntries', '__CefBrowserHost_GetNavigationEntries')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SetMouseCursorChangeDisabled', '__CefBrowserHost_SetMouseCursorChangeDisabled')
		_AutoItObject_AddMethod($__CefBrowserHost, 'IsMouseCursorChangeDisabled', '__CefBrowserHost_IsMouseCursorChangeDisabled')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ReplaceMisspelling', '__CefBrowserHost_ReplaceMisspelling')
		_AutoItObject_AddMethod($__CefBrowserHost, 'AddWordToDictionary', '__CefBrowserHost_AddWordToDictionary')
		_AutoItObject_AddMethod($__CefBrowserHost, 'IsWindowRenderingDisabled', '__CefBrowserHost_IsWindowRenderingDisabled')
		_AutoItObject_AddMethod($__CefBrowserHost, 'WasResized', '__CefBrowserHost_WasResized')
		_AutoItObject_AddMethod($__CefBrowserHost, 'WasHidden', '__CefBrowserHost_WasHidden')
		_AutoItObject_AddMethod($__CefBrowserHost, 'NotifyScreenInfoChanged', '__CefBrowserHost_NotifyScreenInfoChanged')
		_AutoItObject_AddMethod($__CefBrowserHost, 'Invalidate', '__CefBrowserHost_Invalidate')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendKeyEvent', '__CefBrowserHost_SendKeyEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendMouseClickEvent', '__CefBrowserHost_SendMouseClickEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendMouseMoveEvent', '__CefBrowserHost_SendMouseMoveEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendMouseWheelEvent', '__CefBrowserHost_SendMouseWheelEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendFocusEvent', '__CefBrowserHost_SendFocusEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SendCaptureLostEvent', '__CefBrowserHost_SendCaptureLostEvent')
		_AutoItObject_AddMethod($__CefBrowserHost, 'NotifyMoveOrResizeStarted', '__CefBrowserHost_NotifyMoveOrResizeStarted')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetWindowlessFrameRate', '__CefBrowserHost_GetWindowlessFrameRate')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SetWindowlessFrameRate', '__CefBrowserHost_SetWindowlessFrameRate')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ImeSetComposition', '__CefBrowserHost_ImeSetComposition')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ImeCommitText', '__CefBrowserHost_ImeCommitText')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ImeFinishComposingText', '__CefBrowserHost_ImeFinishComposingText')
		_AutoItObject_AddMethod($__CefBrowserHost, 'ImeCancelComposition', '__CefBrowserHost_ImeCancelComposition')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragTargetDragEnter', '__CefBrowserHost_DragTargetDragEnter')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragTargetDragOver', '__CefBrowserHost_DragTargetDragOver')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragTargetDragLeave', '__CefBrowserHost_DragTargetDragLeave')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragTargetDrop', '__CefBrowserHost_DragTargetDrop')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragSourceEndedAt', '__CefBrowserHost_DragSourceEndedAt')
		_AutoItObject_AddMethod($__CefBrowserHost, 'DragSourceSystemDragEnded', '__CefBrowserHost_DragSourceSystemDragEnded')
		_AutoItObject_AddMethod($__CefBrowserHost, 'GetVisibleNavigationEntry', '__CefBrowserHost_GetVisibleNavigationEntry')
		_AutoItObject_AddMethod($__CefBrowserHost, 'SetAccessibilityState', '__CefBrowserHost_SetAccessibilityState')
	endif

	local $self = _AutoItObject_Create($__CefBrowserHost)
	if ($ptr == null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_Create')[0]
	$self.__ptr = $ptr
	return $self
endfunc

func __CefBrowserHost_GetBrowser($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetBrowser', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_CloseBrowser($self, $force_close)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseBrowser', 'ptr', $self.__ptr, 'int', $force_close)
endfunc

func __CefBrowserHost_TryCloseBrowser($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_TryCloseBrowser', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetFocus($self, $focus)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetFocus', 'ptr', $self.__ptr, 'int', $focus)
endfunc

func __CefBrowserHost_HasView($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasView', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetClient($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetClient', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetRequestContext($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetRequestContext', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetZoomLevel($self)
	local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'CefBrowserHost_GetZoomLevel', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetZoomLevel($self, $zoomLevel)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetZoomLevel', 'ptr', $self.__ptr, 'double', $zoomLevel)
endfunc

func __CefBrowserHost_GetWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetWindowHandle', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetOpenerWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetOpenerWindowHandle', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_RunFileDialog($self, $mode, $title, $default_file_path, $accept_filters, $selected_accept_filter, $callback)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self.__ptr, 'int', $mode, 'wstr', $title, 'wstr', $default_file_path, 'ptr', $accept_filters, 'int', $selected_accept_filter, 'ptr', $callback)
endfunc

func __CefBrowserHost_DownloadImage($self, $image_url, $is_favicon, $max_image_size, $bypass_cache, $callback)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self.__ptr, 'wstr', $image_url, 'int', $is_favicon, 'uint', $max_image_size, 'int', $bypass_cache, 'ptr', $callback)
endfunc

func __CefBrowserHost_PrintToPDF($self, $path, $settings, $callback)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_PrintToPDF', 'ptr', $self.__ptr, 'wstr', $path, 'ptr', $settings, 'ptr', $callback)
endfunc

func __CefBrowserHost_Find($self, $identifier, $searchText, $forward, $matchCase, $findNext)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Find', 'ptr', $self.__ptr, 'int', $identifier, 'wstr', $searchText, 'int', $forward, 'int', $matchCase, 'int', $findNext)
endfunc

func __CefBrowserHost_ShowDevTools($self, $windowInfo, $client, $settings, $inspect_element_at)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ShowDevTools', 'ptr', $self.__ptr, 'ptr', $windowInfo, 'ptr', $client, 'ptr', $settings, 'ptr', $inspect_element_at)
endfunc

func __CefBrowserHost_StartDownload($self, $url)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StartDownload', 'ptr', $self.__ptr, 'wstr', $url)
endfunc

func __CefBrowserHost_Print($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Print', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_StopFinding($self, $clearSelection)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StopFinding', 'ptr', $self.__ptr, 'int', $clearSelection)
endfunc

func __CefBrowserHost_CloseDevTools($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseDevTools', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_HasDevTools($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasDevTools', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetNavigationEntries($self, $visitor, $current_only)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_GetNavigationEntries', 'ptr', $self.__ptr, 'ptr', $visitor, 'int', $current_only)
endfunc

func __CefBrowserHost_SetMouseCursorChangeDisabled($self, $disabled)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetMouseCursorChangeDisabled', 'ptr', $self.__ptr, 'int', $disabled)
endfunc

func __CefBrowserHost_IsMouseCursorChangeDisabled($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsMouseCursorChangeDisabled', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_ReplaceMisspelling($self, $word)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ReplaceMisspelling', 'ptr', $self.__ptr, 'wstr', $word)
endfunc

func __CefBrowserHost_AddWordToDictionary($self, $word)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_AddWordToDictionary', 'ptr', $self.__ptr, 'wstr', $word)
endfunc

func __CefBrowserHost_IsWindowRenderingDisabled($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsWindowRenderingDisabled', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_WasResized($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasResized', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_WasHidden($self, $hidden)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasHidden', 'ptr', $self.__ptr, 'int', $hidden)
endfunc

func __CefBrowserHost_NotifyScreenInfoChanged($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyScreenInfoChanged', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_Invalidate($self, $type)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Invalidate', 'ptr', $self.__ptr, 'int', $type)
endfunc

func __CefBrowserHost_SendKeyEvent($self, $event)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendKeyEvent', 'ptr', $self.__ptr, 'ptr', $event)
endfunc

func __CefBrowserHost_SendMouseClickEvent($self, $event, $type, $mouseUp, $clickCount)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseClickEvent', 'ptr', $self.__ptr, 'ptr', $event, 'int', $type, 'int', $mouseUp, 'int', $clickCount)
endfunc

func __CefBrowserHost_SendMouseMoveEvent($self, $event, $mouseLeave)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseMoveEvent', 'ptr', $self.__ptr, 'ptr', $event, 'int', $mouseLeave)
endfunc

func __CefBrowserHost_SendMouseWheelEvent($self, $event, $deltaX, $deltaY)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseWheelEvent', 'ptr', $self.__ptr, 'ptr', $event, 'int', $deltaX, 'int', $deltaY)
endfunc

func __CefBrowserHost_SendFocusEvent($self, $setFocus)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendFocusEvent', 'ptr', $self.__ptr, 'int', $setFocus)
endfunc

func __CefBrowserHost_SendCaptureLostEvent($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendCaptureLostEvent', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_NotifyMoveOrResizeStarted($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyMoveOrResizeStarted', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_GetWindowlessFrameRate($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_GetWindowlessFrameRate', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetWindowlessFrameRate($self, $frame_rate)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetWindowlessFrameRate', 'ptr', $self.__ptr, 'int', $frame_rate)
endfunc

func __CefBrowserHost_ImeSetComposition($self, $text, $underlinesCount, $underlines, $replacement_range, $selection_range)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeSetComposition', 'ptr', $self.__ptr, 'wstr', $text, 'uint', $underlinesCount, 'ptr', $underlines, 'ptr', $replacement_range, 'ptr', $selection_range)
endfunc

func __CefBrowserHost_ImeCommitText($self, $text, $replacement_range, $relative_cursor_pos)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCommitText', 'ptr', $self.__ptr, 'wstr', $text, 'ptr', $replacement_range, 'int', $relative_cursor_pos)
endfunc

func __CefBrowserHost_ImeFinishComposingText($self, $keep_selection)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeFinishComposingText', 'ptr', $self.__ptr, 'int', $keep_selection)
endfunc

func __CefBrowserHost_ImeCancelComposition($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCancelComposition', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_DragTargetDragEnter($self, $drag_data, $event, $allowed_ops)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragEnter', 'ptr', $self.__ptr, 'ptr', $drag_data, 'ptr', $event, 'int', $allowed_ops)
endfunc

func __CefBrowserHost_DragTargetDragOver($self, $event, $allowed_ops)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragOver', 'ptr', $self.__ptr, 'ptr', $event, 'ptr', $allowed_ops)
endfunc

func __CefBrowserHost_DragTargetDragLeave($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragLeave', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_DragTargetDrop($self, $event)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDrop', 'ptr', $self.__ptr, 'ptr', $event)
endfunc

func __CefBrowserHost_DragSourceEndedAt($self, $x, $y, $op)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceEndedAt', 'ptr', $self.__ptr, 'int', $x, 'int', $y, 'int', $op)
endfunc

func __CefBrowserHost_DragSourceSystemDragEnded($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceSystemDragEnded', 'ptr', $self.__ptr)
endfunc

func __CefBrowserHost_GetVisibleNavigationEntry($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetVisibleNavigationEntry', 'ptr', $self.__ptr)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetAccessibilityState($self, $accessibility_state)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetAccessibilityState', 'ptr', $self.__ptr, 'int', $accessibility_state)
endfunc

; static function ///////////////////////////////////////

func __CefBrowserHost_CreateBrowser($self, $windowInfo, $client, $url, $settings, $request_context)
	if @numparams == 1 then return 0
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_CreateBrowser', _
		'ptr', $windowInfo, _
		'ptr', $client, _
		'wstr', $url, _
		'ptr', $settings, _
		'ptr', $request_context _
	)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_CreateBrowserSync($self, $windowInfo, $client, $url, $settings, $request_context)
	if @numparams == 1 then return null
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_CreateBrowserSync', _
		'ptr', $windowInfo, _
		'ptr', $client, _
		'wstr', $url, _
		'ptr', $settings, _
		'ptr', $request_context _
	)
	return @error ? 0 : CefBrowser_Create($ret[0])
endfunc

func CefBrowserHost_CreateBrowser($windowInfo, $client, $url, $settings, $request_context)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_CreateBrowser', _
		'ptr', $windowInfo, _
		'ptr', $client, _
		'wstr', $url, _
		'ptr', $settings, _
		'ptr', $request_context _
	)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_CreateBrowserSync($windowInfo, $client, $url, $settings, $request_context)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_CreateBrowserSync', _
		'ptr', $windowInfo, _
		'ptr', $client, _
		'ptr', $url, _
		'ptr', $settings, _
		'ptr', $request_context _
	)
	return @error ? 0 : CefBrowser_Create($ret[0])
endfunc