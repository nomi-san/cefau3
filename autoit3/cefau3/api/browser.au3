#cs
	file: api/browser.au3
	author: wuuyi123
#ce

func CefBrowser_GetHost($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetHost', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_CanGoBack($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoBack', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GoBack($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoBack', 'ptr', $self)
endfunc

func CefBrowser_CanGoForward($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoForward', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GoForward($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoForward', 'ptr', $self)
endfunc

func CefBrowser_IsLoading($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsLoading', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_Reload($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_Reload', 'ptr', $self)
endfunc

func CefBrowser_ReloadIgnoreCache($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_ReloadIgnoreCache', 'ptr', $self)
endfunc

func CefBrowser_StopLoad($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_StopLoad', 'ptr', $self)
endfunc

func CefBrowser_GetIdentifier($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetIdentifier', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_IsSame($self, $that)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsSame', 'ptr', $self, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_IsPopup($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsPopup', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_HasDocument($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_HasDocument', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GetMainFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetMainFrame', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GetFocusedFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetFocusedFrame', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GetFrameByident($self, $identifier)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrameByident', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GetFrame($self, $name)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrame', 'ptr', $self, 'wstr', $name)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowser_GetFrameCount($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefBrowser_GetFrameCount', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

#cs
void CEF_CALLBACK CefBrowser_GetFrameIdentifiers(struct _cef_browser_t* self,
	size_t* identifiersCount,
	int64* identifiers)
{
	return self->get_frame_identifiers(self, identifiersCount, identifiers);
}
func CefBrowser_CanGoBack($self)
	local $ret = dllcall($__Cefau3Dll__, 'int', 'CefBrowser_CanGoBack', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

void CEF_CALLBACK CefBrowser_GetFrameNames(struct _cef_browser_t* self,
	cef_string_list_t names)
{
	return self->get_frame_names(self, names);
}
func CefBrowser_CanGoBack($self)
	local $ret = dllcall($__Cefau3Dll__, 'int', 'CefBrowser_CanGoBack', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc
#ce

func CefBrowser_SendProcessMessage($self, $target_process, $message)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_SendProcessMessage', 'ptr', $self, 'int', $target_process, 'ptr', $message)
	return @error ? 0 : $ret[0]
endfunc


; /////////////////////////////////////////

func CefBrowserHost_GetBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetBrowser', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_CloseBrowser($self, $force_close)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseBrowser', 'ptr', $self, $force_close)
endfunc

func CefBrowserHost_TryCloseBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_TryCloseBrowser', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_SetFocus($self, $focus)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetFocus', 'ptr', $self, 'int', $focus)
endfunc

func CefBrowserHost_HasView($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasView', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_GetClient($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetClient', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_GetRequestContext($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetRequestContext', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_GetZoomLevel($self)
    local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'CefBrowserHost_GetZoomLevel', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_SetZoomLevel($self, $zoomLevel)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetZoomLevel', 'ptr', $self, 'double', $zoomLevel)
endfunc

func CefBrowserHost_GetWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetWindowHandle', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_GetOpenerWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetOpenerWindowHandle', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_RunFileDialog($self, $mode, $title, $default_file_path, $accept_filters, $selected_accept_filter, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self, 'int', $mode, 'wstr', $title, 'wstr', $default_file_path, 'ptr', $accept_filters, 'int', $selected_accept_filter, 'ptr', $callback)
endfunc

func CefBrowserHost_DownloadImage($self, $image_url, $is_favicon, $max_image_size, $bypass_cache, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self, 'wstr', $image_url, 'int', $is_favicon, 'uint', $max_image_size, 'int', $bypass_cache, 'ptr', $callback)
endfunc

func CefBrowserHost_PrintToPDF($self, $path, $settings, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_PrintToPDF', 'ptr', $self, 'wstr', $path, 'ptr', $settings, 'ptr', $callback)
endfunc

func CefBrowserHost_Find($self, $identifier, $searchText, $forward, $matchCase, $findNext)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Find', 'ptr', $self, 'int', $identifier, 'wstr', $searchText, 'int', $forward, 'int', $matchCase, 'int', $findNext)
endfunc

func CefBrowserHost_ShowDevTools($self, $windowInfo, $client, $settings, $inspect_element_at)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ShowDevTools', 'ptr', $self, 'ptr', $windowInfo, 'ptr', $client, 'ptr', $settings, 'ptr', $inspect_element_at)
endfunc

func CefBrowserHost_StartDownload($self, $url)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StartDownload', 'ptr', $self, 'wstr', $url)
endfunc

func CefBrowserHost_Print($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Print', 'ptr', $self)
endfunc

func CefBrowserHost_StopFinding($self, $clearSelection)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StopFinding', 'ptr', $self, 'int', $clearSelection)
endfunc

func CefBrowserHost_CloseDevTools($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseDevTools', 'ptr', $self)
endfunc

func CefBrowserHost_HasDevTools($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasDevTools', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_GetNavigationEntries($self, $visitor, $current_only)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_GetNavigationEntries', 'ptr', $self, 'ptr', $visitor, 'int', $current_only)
endfunc

func CefBrowserHost_SetMouseCursorChangeDisabled($self, $disabled)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetMouseCursorChangeDisabled', 'ptr', $self, 'int', $disabled)
endfunc

func CefBrowserHost_IsMouseCursorChangeDisabled($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsMouseCursorChangeDisabled', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_ReplaceMisspelling($self, $word)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ReplaceMisspelling', 'ptr', $self, 'wstr', $word)
endfunc

func CefBrowserHost_AddWordToDictionary($self, $word)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_AddWordToDictionary', 'ptr', $self, 'wstr', $word)
endfunc

func CefBrowserHost_IsWindowRenderingDisabled($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsWindowRenderingDisabled', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_WasResized($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasResized', 'ptr', $self)
endfunc

func CefBrowserHost_WasHidden($self, $hidden)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasHidden', 'ptr', $self, 'int', $hidden)
endfunc

func CefBrowserHost_NotifyScreenInfoChanged($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyScreenInfoChanged', 'ptr', $self)
endfunc

func CefBrowserHost_Invalidate($self, $type)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Invalidate', 'ptr', $self, 'int', $type)
endfunc

func CefBrowserHost_SendKeyEvent($self, $event)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendKeyEvent', 'ptr', $self, 'ptr', $event)
endfunc

func CefBrowserHost_SendMouseClickEvent($self, $event, $type, $mouseUp, $clickCount)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseClickEvent', 'ptr', $self, 'ptr', $event, 'int', $type, 'int', $mouseUp, 'int', $clickCount)
endfunc

func CefBrowserHost_SendMouseMoveEvent($self, $event, $mouseLeave)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseMoveEvent', 'ptr', $self, 'ptr', $event, 'int', $mouseLeave)
endfunc

func CefBrowserHost_SendMouseWheelEvent($self, $event, $deltaX, $deltaY)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseWheelEvent', 'ptr', $self, 'ptr', $event, 'int', $deltaX, 'int', $deltaY)
endfunc

func CefBrowserHost_SendFocusEvent($self, $setFocus)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendFocusEvent', 'ptr', $self, 'int', $setFocus)
endfunc

func CefBrowserHost_SendCaptureLostEvent($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendCaptureLostEvent', 'ptr', $self)
endfunc

func CefBrowserHost_NotifyMoveOrResizeStarted($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyMoveOrResizeStarted', 'ptr', $self)
endfunc

func CefBrowserHost_GetWindowlessFrameRate($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_GetWindowlessFrameRate', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_SetWindowlessFrameRate($self, $frame_rate)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetWindowlessFrameRate', 'ptr', $self, 'int', $frame_rate)
endfunc

func CefBrowserHost_ImeSetComposition($self, $text, $underlinesCount, $underlines, $replacement_range, $selection_range)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeSetComposition', 'ptr', $self, 'wstr', $text, 'uint', $underlinesCount, 'ptr', $underlines, 'ptr', $replacement_range, 'ptr', $selection_range)
endfunc

func CefBrowserHost_ImeCommitText($self, $text, $replacement_range, $relative_cursor_pos)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCommitText', 'ptr', $self, 'wstr', $text, 'ptr', $replacement_range, 'int', $relative_cursor_pos)
endfunc

func CefBrowserHost_ImeFinishComposingText($self, $keep_selection)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeFinishComposingText', 'ptr', $self, 'int', $keep_selection)
endfunc

func CefBrowserHost_ImeCancelComposition($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCancelComposition', 'ptr', $self)
endfunc

func CefBrowserHost_DragTargetDragEnter($self, $drag_data, $event, $allowed_ops)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragEnter', 'ptr', $self, 'ptr', $drag_data, 'ptr', $event, 'int', $allowed_ops)
endfunc

func CefBrowserHost_DragTargetDragOver($self, $event, $allowed_ops)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragOver', 'ptr', $self, 'ptr', $event, 'ptr', $allowed_ops)
endfunc

func CefBrowserHost_DragTargetDragLeave($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragLeave', 'ptr', $self)
endfunc

func CefBrowserHost_DragTargetDrop($self, $event)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDrop', 'ptr', $self, 'ptr', $event)
endfunc

func CefBrowserHost_DragSourceEndedAt($self, $x, $y, $op)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceEndedAt', 'ptr', $self, 'int', $x, 'int', $y, 'int', $op)
endfunc

func CefBrowserHost_DragSourceSystemDragEnded($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceSystemDragEnded', 'ptr', $self)
endfunc

func CefBrowserHost_GetVisibleNavigationEntry($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetVisibleNavigationEntry', 'ptr', $self)
    return @error ? 0 : $ret[0]
endfunc

func CefBrowserHost_SetAccessibilityState($self, $accessibility_state)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetAccessibilityState', 'ptr', $self, 'int', $accessibility_state)
endfunc


; ///////////////////////////////////////

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
		'ptr', $url, _
		'ptr', $settings, _
		'ptr', $request_context _
	)
	return @error ? 0 : $ret[0]
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
	return @error ? 0 : $ret[0]
endfunc