#cs
	file: api/browser.au3
	author: wuuyi123
#ce

; CefBrowser
; ==================================================

global $tag_CefBrowser = ( _
	$tag_CefBase & _
	'ptr;' & _ ; get_host
	'ptr;' & _ ; can_go_back
	'ptr;' & _ ; go_back
	'ptr;' & _ ; can_go_forward
	'ptr;' & _ ; go_forward
	'ptr;' & _ ; is_loading
	'ptr;' & _ ; reload
	'ptr;' & _ ; reload_ignore_cache
	'ptr;' & _ ; stop_load
	'ptr;' & _ ; get_identifier
	'ptr;' & _ ; is_same
	'ptr;' & _ ; is_popup
	'ptr;' & _ ; has_document
	'ptr;' & _ ; get_main_frame
	'ptr;' & _ ; get_focused_frame
	'ptr;' & _ ; get_frame_byident
	'ptr;' & _ ; get_frame
	'ptr;' & _ ; get_frame_count
	'ptr;' & _ ; get_frame_identifiers
	'ptr;' & _ ; get_frame_names
	'ptr;' _ ; send_process_message
)

func CefBrowser_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefBrowser, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefBrowser)
	$struct.size = $struct.__size__

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefBrowser')

	_AutoItObject_AddMethod($struct, 'GetHost', '__CefBrowser_GetHost')
    _AutoItObject_AddMethod($struct, 'CanGoBack', '__CefBrowser_CanGoBack')
    _AutoItObject_AddMethod($struct, 'GoBack', '__CefBrowser_GoBack')
    _AutoItObject_AddMethod($struct, 'CanGoForward', '__CefBrowser_CanGoForward')
    _AutoItObject_AddMethod($struct, 'GoForward', '__CefBrowser_GoForward')
    _AutoItObject_AddMethod($struct, 'IsLoading', '__CefBrowser_IsLoading')
    _AutoItObject_AddMethod($struct, 'Reload', '__CefBrowser_Reload')
    _AutoItObject_AddMethod($struct, 'ReloadIgnoreCache', '__CefBrowser_ReloadIgnoreCache')
    _AutoItObject_AddMethod($struct, 'StopLoad', '__CefBrowser_StopLoad')
    _AutoItObject_AddMethod($struct, 'GetIdentifier', '__CefBrowser_GetIdentifier')
    _AutoItObject_AddMethod($struct, 'IsSame', '__CefBrowser_IsSame')
    _AutoItObject_AddMethod($struct, 'IsPopup', '__CefBrowser_IsPopup')
    _AutoItObject_AddMethod($struct, 'HasDocument', '__CefBrowser_HasDocument')
    _AutoItObject_AddMethod($struct, 'GetMainFrame', '__CefBrowser_GetMainFrame')
    _AutoItObject_AddMethod($struct, 'GetFocusedFrame', '__CefBrowser_GetFocusedFrame')
    _AutoItObject_AddMethod($struct, 'GetFrameByident', '__CefBrowser_GetFrameByident')
    _AutoItObject_AddMethod($struct, 'GetFrame', '__CefBrowser_GetFrame')
    _AutoItObject_AddMethod($struct, 'GetFrameCount', '__CefBrowser_GetFrameCount')
    _AutoItObject_AddMethod($struct, 'GetFrameIdentifiers', '__CefBrowser_GetFrameIdentifiers')
    _AutoItObject_AddMethod($struct, 'GetFrameNames', '__CefBrowser_GetFrameNames')
    _AutoItObject_AddMethod($struct, 'SendProcessMessage', '__CefBrowser_SendProcessMessage')

	return $struct
endfunc

func __CefBrowser_GetHost($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetHost', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_CanGoBack($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoBack', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GoBack($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoBack', 'ptr', $self.__pointer__)
endfunc

func __CefBrowser_CanGoForward($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_CanGoForward', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GoForward($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GoForward', 'ptr', $self.__pointer__)
endfunc

func __CefBrowser_IsLoading($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsLoading', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_Reload($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_Reload', 'ptr', $self.__pointer__)
endfunc

func __CefBrowser_ReloadIgnoreCache($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_ReloadIgnoreCache', 'ptr', $self.__pointer__)
endfunc

func __CefBrowser_StopLoad($self)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_StopLoad', 'ptr', $self.__pointer__)
endfunc

func __CefBrowser_GetIdentifier($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetIdentifier', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_IsSame($self, $that = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsSame', 'ptr', $self.__pointer__, 'ptr', $that)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_IsPopup($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_IsPopup', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_HasDocument($self)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_HasDocument', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetMainFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetMainFrame', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFocusedFrame($self)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowser_GetFocusedFrame', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameByident($self, $identifier)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrameByident', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrame($self, $name = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_GetFrame', 'ptr', $self.__pointer__, 'wstr', $name)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameCount($self)
	local $ret = dllcall($__Cefau3Dll__, 'uint:cdecl', 'CefBrowser_GetFrameCount', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowser_GetFrameIdentifiers($self, $identifiersCount = null, $identifiers = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GetFrameIdentifiers', 'ptr', $self.__pointer__, 'uint*', $identifiersCount, 'int64*', $identifiers)
endfunc

func __CefBrowser_GetFrameNames($self, $names = null)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowser_GetFrameNames', 'ptr', $self.__pointer__, 'ptr', $names)
endfunc

func __CefBrowser_SendProcessMessage($self, $target_process = 0, $message = null)
	local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowser_SendProcessMessage', 'ptr', $self.__pointer__, 'int', $target_process, 'ptr', $message)
	return @error ? 0 : $ret[0]
endfunc

; CefBrowserHost
; ==================================================

global $tag_CefBrowserHost = ( _
    $tag_CefBase & _
    'ptr;' & _ ; get_browser
    'ptr;' & _ ; close_browser
    'ptr;' & _ ; try_close_browser
    'ptr;' & _ ; set_focus
    'ptr;' & _ ; get_window_handle
    'ptr;' & _ ; get_opener_window_handle
    'ptr;' & _ ; has_view
    'ptr;' & _ ; get_client
    'ptr;' & _ ; get_request_context
    'ptr;' & _ ; get_zoom_level
    'ptr;' & _ ; set_zoom_level
    'ptr;' & _ ; run_file_dialog
    'ptr;' & _ ; start_download
    'ptr;' & _ ; download_image
    'ptr;' & _ ; print
    'ptr;' & _ ; print_to_pdf
    'ptr;' & _ ; find
    'ptr;' & _ ; stop_finding
    'ptr;' & _ ; show_dev_tools
    'ptr;' & _ ; close_dev_tools
    'ptr;' & _ ; has_dev_tools
    'ptr;' & _ ; get_navigation_entries
    'ptr;' & _ ; set_mouse_cursor_change_disabled
    'ptr;' & _ ; is_mouse_cursor_change_disabled
    'ptr;' & _ ; replace_misspelling
    'ptr;' & _ ; add_word_to_dictionary
    'ptr;' & _ ; is_window_rendering_disabled
    'ptr;' & _ ; was_resized
    'ptr;' & _ ; was_hidden
    'ptr;' & _ ; notify_screen_info_changed
    'ptr;' & _ ; invalidate
    'ptr;' & _ ; send_key_event
    'ptr;' & _ ; send_mouse_click_event
    'ptr;' & _ ; send_mouse_move_event
    'ptr;' & _ ; send_mouse_wheel_event
    'ptr;' & _ ; send_focus_event
    'ptr;' & _ ; send_capture_lost_event
    'ptr;' & _ ; notify_move_or_resize_started
    'ptr;' & _ ; get_windowless_frame_rate
    'ptr;' & _ ; set_windowless_frame_rate
    'ptr;' & _ ; ime_set_composition
    'ptr;' & _ ; ime_commit_text
    'ptr;' & _ ; ime_finish_composing_text
    'ptr;' & _ ; ime_cancel_composition
    'ptr;' & _ ; drag_target_drag_enter
    'ptr;' & _ ; drag_target_drag_over
    'ptr;' & _ ; drag_target_drag_leave
    'ptr;' & _ ; drag_target_drop
    'ptr;' & _ ; drag_source_ended_at
    'ptr;' & _ ; drag_source_system_drag_ended
    'ptr;' & _ ; get_visible_navigation_entry
    'ptr;' _ ; set_accessibility_state
)

func CefBrowserHost_Create($ptr = null)
	local $struct = $ptr ? _AutoItObject_DllStructCreate($tag_CefBrowser, $ptr) _
		: _AutoItObject_DllStructCreate($tag_CefBrowser)
	$struct.size = $struct.__size__

	_AutoItObject_AddProperty($struct, '__ptr', $ELSCOPE_READONLY, $struct.__pointer__)
	_AutoItObject_AddProperty($struct, '__type', $ELSCOPE_READONLY, 'CefBrowserHost')

    _AutoItObject_AddMethod($struct, 'GetBrowser', '__CefBrowserHost_GetBrowser')
    _AutoItObject_AddMethod($struct, 'CloseBrowser', '__CefBrowserHost_CloseBrowser')
    _AutoItObject_AddMethod($struct, 'TryCloseBrowser', '__CefBrowserHost_TryCloseBrowser')
    _AutoItObject_AddMethod($struct, 'SetFocus', '__CefBrowserHost_SetFocus')
    _AutoItObject_AddMethod($struct, 'HasView', '__CefBrowserHost_HasView')
    _AutoItObject_AddMethod($struct, 'GetClient', '__CefBrowserHost_GetClient')
    _AutoItObject_AddMethod($struct, 'GetRequestContext', '__CefBrowserHost_GetRequestContext')
    _AutoItObject_AddMethod($struct, 'GetZoomLevel', '__CefBrowserHost_GetZoomLevel')
    _AutoItObject_AddMethod($struct, 'SetZoomLevel', '__CefBrowserHost_SetZoomLevel')
    _AutoItObject_AddMethod($struct, 'GetWindowHandle', '__CefBrowserHost_GetWindowHandle')
    _AutoItObject_AddMethod($struct, 'GetOpenerWindowHandle', '__CefBrowserHost_GetOpenerWindowHandle')
    _AutoItObject_AddMethod($struct, 'RunFileDialog', '__CefBrowserHost_RunFileDialog')
    _AutoItObject_AddMethod($struct, 'DownloadImage', '__CefBrowserHost_DownloadImage')
    _AutoItObject_AddMethod($struct, 'PrintToPDF', '__CefBrowserHost_PrintToPDF')
    _AutoItObject_AddMethod($struct, 'Find', '__CefBrowserHost_Find')
    _AutoItObject_AddMethod($struct, 'ShowDevTools', '__CefBrowserHost_ShowDevTools')
    _AutoItObject_AddMethod($struct, 'StartDownload', '__CefBrowserHost_StartDownload')
    _AutoItObject_AddMethod($struct, 'Print', '__CefBrowserHost_Print')
    _AutoItObject_AddMethod($struct, 'StopFinding', '__CefBrowserHost_StopFinding')
    _AutoItObject_AddMethod($struct, 'CloseDevTools', '__CefBrowserHost_CloseDevTools')
    _AutoItObject_AddMethod($struct, 'HasDevTools', '__CefBrowserHost_HasDevTools')
    _AutoItObject_AddMethod($struct, 'GetNavigationEntries', '__CefBrowserHost_GetNavigationEntries')
    _AutoItObject_AddMethod($struct, 'SetMouseCursorChangeDisabled', '__CefBrowserHost_SetMouseCursorChangeDisabled')
    _AutoItObject_AddMethod($struct, 'IsMouseCursorChangeDisabled', '__CefBrowserHost_IsMouseCursorChangeDisabled')
    _AutoItObject_AddMethod($struct, 'ReplaceMisspelling', '__CefBrowserHost_ReplaceMisspelling')
    _AutoItObject_AddMethod($struct, 'AddWordToDictionary', '__CefBrowserHost_AddWordToDictionary')
    _AutoItObject_AddMethod($struct, 'IsWindowRenderingDisabled', '__CefBrowserHost_IsWindowRenderingDisabled')
    _AutoItObject_AddMethod($struct, 'WasResized', '__CefBrowserHost_WasResized')
    _AutoItObject_AddMethod($struct, 'WasHidden', '__CefBrowserHost_WasHidden')
    _AutoItObject_AddMethod($struct, 'NotifyScreenInfoChanged', '__CefBrowserHost_NotifyScreenInfoChanged')
    _AutoItObject_AddMethod($struct, 'Invalidate', '__CefBrowserHost_Invalidate')
    _AutoItObject_AddMethod($struct, 'SendKeyEvent', '__CefBrowserHost_SendKeyEvent')
    _AutoItObject_AddMethod($struct, 'SendMouseClickEvent', '__CefBrowserHost_SendMouseClickEvent')
    _AutoItObject_AddMethod($struct, 'SendMouseMoveEvent', '__CefBrowserHost_SendMouseMoveEvent')
    _AutoItObject_AddMethod($struct, 'SendMouseWheelEvent', '__CefBrowserHost_SendMouseWheelEvent')
    _AutoItObject_AddMethod($struct, 'SendFocusEvent', '__CefBrowserHost_SendFocusEvent')
    _AutoItObject_AddMethod($struct, 'SendCaptureLostEvent', '__CefBrowserHost_SendCaptureLostEvent')
    _AutoItObject_AddMethod($struct, 'NotifyMoveOrResizeStarted', '__CefBrowserHost_NotifyMoveOrResizeStarted')
    _AutoItObject_AddMethod($struct, 'GetWindowlessFrameRate', '__CefBrowserHost_GetWindowlessFrameRate')
    _AutoItObject_AddMethod($struct, 'SetWindowlessFrameRate', '__CefBrowserHost_SetWindowlessFrameRate')
    _AutoItObject_AddMethod($struct, 'ImeSetComposition', '__CefBrowserHost_ImeSetComposition')
    _AutoItObject_AddMethod($struct, 'ImeCommitText', '__CefBrowserHost_ImeCommitText')
    _AutoItObject_AddMethod($struct, 'ImeFinishComposingText', '__CefBrowserHost_ImeFinishComposingText')
    _AutoItObject_AddMethod($struct, 'ImeCancelComposition', '__CefBrowserHost_ImeCancelComposition')
    _AutoItObject_AddMethod($struct, 'DragTargetDragEnter', '__CefBrowserHost_DragTargetDragEnter')
    _AutoItObject_AddMethod($struct, 'DragTargetDragOver', '__CefBrowserHost_DragTargetDragOver')
    _AutoItObject_AddMethod($struct, 'DragTargetDragLeave', '__CefBrowserHost_DragTargetDragLeave')
    _AutoItObject_AddMethod($struct, 'DragTargetDrop', '__CefBrowserHost_DragTargetDrop')
    _AutoItObject_AddMethod($struct, 'DragSourceEndedAt', '__CefBrowserHost_DragSourceEndedAt')
    _AutoItObject_AddMethod($struct, 'DragSourceSystemDragEnded', '__CefBrowserHost_DragSourceSystemDragEnded')
    _AutoItObject_AddMethod($struct, 'GetVisibleNavigationEntry', '__CefBrowserHost_GetVisibleNavigationEntry')
    _AutoItObject_AddMethod($struct, 'SetAccessibilityState', '__CefBrowserHost_SetAccessibilityState')

	return $struct
endfunc

func __CefBrowserHost_GetBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetBrowser', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_CloseBrowser($self, $force_close)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseBrowser', 'ptr', $self.__pointer__, 'int', $force_close)
endfunc

func __CefBrowserHost_TryCloseBrowser($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_TryCloseBrowser', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetFocus($self, $focus)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetFocus', 'ptr', $self.__pointer__, 'int', $focus)
endfunc

func __CefBrowserHost_HasView($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasView', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetClient($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetClient', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetRequestContext($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetRequestContext', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetZoomLevel($self)
    local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'CefBrowserHost_GetZoomLevel', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetZoomLevel($self, $zoomLevel)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetZoomLevel', 'ptr', $self.__pointer__, 'double', $zoomLevel)
endfunc

func __CefBrowserHost_GetWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetWindowHandle', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetOpenerWindowHandle($self)
	local $ret = dllcall($__Cefau3Dll__, 'hwnd:cdecl', 'CefBrowserHost_GetOpenerWindowHandle', 'ptr', $self.__pointer__)
	return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_RunFileDialog($self, $mode, $title, $default_file_path, $accept_filters, $selected_accept_filter, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self.__pointer__, 'int', $mode, 'wstr', $title, 'wstr', $default_file_path, 'ptr', $accept_filters, 'int', $selected_accept_filter, 'ptr', $callback)
endfunc

func __CefBrowserHost_DownloadImage($self, $image_url, $is_favicon, $max_image_size, $bypass_cache, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DownloadImage', 'ptr', $self.__pointer__, 'wstr', $image_url, 'int', $is_favicon, 'uint', $max_image_size, 'int', $bypass_cache, 'ptr', $callback)
endfunc

func __CefBrowserHost_PrintToPDF($self, $path, $settings, $callback)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_PrintToPDF', 'ptr', $self.__pointer__, 'wstr', $path, 'ptr', $settings, 'ptr', $callback)
endfunc

func __CefBrowserHost_Find($self, $identifier, $searchText, $forward, $matchCase, $findNext)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Find', 'ptr', $self.__pointer__, 'int', $identifier, 'wstr', $searchText, 'int', $forward, 'int', $matchCase, 'int', $findNext)
endfunc

func __CefBrowserHost_ShowDevTools($self, $windowInfo, $client, $settings, $inspect_element_at)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ShowDevTools', 'ptr', $self.__pointer__, 'ptr', $windowInfo, 'ptr', $client, 'ptr', $settings, 'ptr', $inspect_element_at)
endfunc

func __CefBrowserHost_StartDownload($self, $url)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StartDownload', 'ptr', $self.__pointer__, 'wstr', $url)
endfunc

func __CefBrowserHost_Print($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Print', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_StopFinding($self, $clearSelection)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_StopFinding', 'ptr', $self.__pointer__, 'int', $clearSelection)
endfunc

func __CefBrowserHost_CloseDevTools($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_CloseDevTools', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_HasDevTools($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_HasDevTools', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_GetNavigationEntries($self, $visitor, $current_only)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_GetNavigationEntries', 'ptr', $self.__pointer__, 'ptr', $visitor, 'int', $current_only)
endfunc

func __CefBrowserHost_SetMouseCursorChangeDisabled($self, $disabled)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetMouseCursorChangeDisabled', 'ptr', $self.__pointer__, 'int', $disabled)
endfunc

func __CefBrowserHost_IsMouseCursorChangeDisabled($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsMouseCursorChangeDisabled', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_ReplaceMisspelling($self, $word)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ReplaceMisspelling', 'ptr', $self.__pointer__, 'wstr', $word)
endfunc

func __CefBrowserHost_AddWordToDictionary($self, $word)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_AddWordToDictionary', 'ptr', $self.__pointer__, 'wstr', $word)
endfunc

func __CefBrowserHost_IsWindowRenderingDisabled($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_IsWindowRenderingDisabled', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_WasResized($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasResized', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_WasHidden($self, $hidden)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_WasHidden', 'ptr', $self.__pointer__, 'int', $hidden)
endfunc

func __CefBrowserHost_NotifyScreenInfoChanged($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyScreenInfoChanged', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_Invalidate($self, $type)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_Invalidate', 'ptr', $self.__pointer__, 'int', $type)
endfunc

func __CefBrowserHost_SendKeyEvent($self, $event)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendKeyEvent', 'ptr', $self.__pointer__, 'ptr', $event)
endfunc

func __CefBrowserHost_SendMouseClickEvent($self, $event, $type, $mouseUp, $clickCount)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseClickEvent', 'ptr', $self.__pointer__, 'ptr', $event, 'int', $type, 'int', $mouseUp, 'int', $clickCount)
endfunc

func __CefBrowserHost_SendMouseMoveEvent($self, $event, $mouseLeave)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseMoveEvent', 'ptr', $self.__pointer__, 'ptr', $event, 'int', $mouseLeave)
endfunc

func __CefBrowserHost_SendMouseWheelEvent($self, $event, $deltaX, $deltaY)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendMouseWheelEvent', 'ptr', $self.__pointer__, 'ptr', $event, 'int', $deltaX, 'int', $deltaY)
endfunc

func __CefBrowserHost_SendFocusEvent($self, $setFocus)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendFocusEvent', 'ptr', $self.__pointer__, 'int', $setFocus)
endfunc

func __CefBrowserHost_SendCaptureLostEvent($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SendCaptureLostEvent', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_NotifyMoveOrResizeStarted($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_NotifyMoveOrResizeStarted', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_GetWindowlessFrameRate($self)
    local $ret = dllcall($__Cefau3Dll__, 'int:cdecl', 'CefBrowserHost_GetWindowlessFrameRate', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetWindowlessFrameRate($self, $frame_rate)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetWindowlessFrameRate', 'ptr', $self.__pointer__, 'int', $frame_rate)
endfunc

func __CefBrowserHost_ImeSetComposition($self, $text, $underlinesCount, $underlines, $replacement_range, $selection_range)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeSetComposition', 'ptr', $self.__pointer__, 'wstr', $text, 'uint', $underlinesCount, 'ptr', $underlines, 'ptr', $replacement_range, 'ptr', $selection_range)
endfunc

func __CefBrowserHost_ImeCommitText($self, $text, $replacement_range, $relative_cursor_pos)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCommitText', 'ptr', $self.__pointer__, 'wstr', $text, 'ptr', $replacement_range, 'int', $relative_cursor_pos)
endfunc

func __CefBrowserHost_ImeFinishComposingText($self, $keep_selection)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeFinishComposingText', 'ptr', $self.__pointer__, 'int', $keep_selection)
endfunc

func __CefBrowserHost_ImeCancelComposition($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_ImeCancelComposition', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_DragTargetDragEnter($self, $drag_data, $event, $allowed_ops)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragEnter', 'ptr', $self.__pointer__, 'ptr', $drag_data, 'ptr', $event, 'int', $allowed_ops)
endfunc

func __CefBrowserHost_DragTargetDragOver($self, $event, $allowed_ops)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragOver', 'ptr', $self.__pointer__, 'ptr', $event, 'ptr', $allowed_ops)
endfunc

func __CefBrowserHost_DragTargetDragLeave($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDragLeave', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_DragTargetDrop($self, $event)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragTargetDrop', 'ptr', $self.__pointer__, 'ptr', $event)
endfunc

func __CefBrowserHost_DragSourceEndedAt($self, $x, $y, $op)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceEndedAt', 'ptr', $self.__pointer__, 'int', $x, 'int', $y, 'int', $op)
endfunc

func __CefBrowserHost_DragSourceSystemDragEnded($self)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_DragSourceSystemDragEnded', 'ptr', $self.__pointer__)
endfunc

func __CefBrowserHost_GetVisibleNavigationEntry($self)
    local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserHost_GetVisibleNavigationEntry', 'ptr', $self.__pointer__)
    return @error ? 0 : $ret[0]
endfunc

func __CefBrowserHost_SetAccessibilityState($self, $accessibility_state)
    dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserHost_SetAccessibilityState', 'ptr', $self.__pointer__, 'int', $accessibility_state)
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