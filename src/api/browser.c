#include "../cefau3.h"

#include "include/capi/cef_browser_capi.h"

/* CefBrowser
--------------------------------------------------*/

typedef struct CefBrowser {
	cef_browser_t self;
} CefBrowser;

CefHandlerObjCreate(CefBrowser);

CEFAU3API cef_browser_host_t*  CefBrowser_GetHost(
	struct _cef_browser_t* self)
{
	return self->get_host(self);
}

CEFAU3API int  CefBrowser_CanGoBack(struct _cef_browser_t* self)
{
	return self->can_go_back(self);
}

CEFAU3API void  CefBrowser_GoBack(struct _cef_browser_t* self)
{
	self->go_back(self);
}

CEFAU3API int  CefBrowser_CanGoForward(struct _cef_browser_t* self)
{
	return self->can_go_forward(self);
}

CEFAU3API void  CefBrowser_GoForward(struct _cef_browser_t* self)
{
	self->go_forward(self);
}

CEFAU3API int  CefBrowser_IsLoading(struct _cef_browser_t* self)
{
	return self->is_loading(self);
}

CEFAU3API void  CefBrowser_Reload(struct _cef_browser_t* self)
{
	self->reload(self);
}

CEFAU3API void  CefBrowser_ReloadIgnoreCache(struct _cef_browser_t* self)
{
	self->reload_ignore_cache(self);
}

CEFAU3API void  CefBrowser_StopLoad(struct _cef_browser_t* self)
{
	self->stop_load(self);
}

CEFAU3API int  CefBrowser_GetIdentifier(struct _cef_browser_t* self)
{
	return self->get_identifier(self);
}

CEFAU3API int  CefBrowser_IsSame(struct _cef_browser_t* self,
	struct _cef_browser_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int  CefBrowser_IsPopup(struct _cef_browser_t* self)
{
	return self->is_popup(self);
}

CEFAU3API int  CefBrowser_HasDocument(struct _cef_browser_t* self)
{
	return self->has_document(self);
}

CEFAU3API struct _cef_frame_t*  CefBrowser_GetMainFrame(
	struct _cef_browser_t* self)
{
	return self->get_main_frame(self);
}

CEFAU3API struct _cef_frame_t*  CefBrowser_GetFocusedFrame(
	struct _cef_browser_t* self)
{
	return self->get_focused_frame(self);
}

CEFAU3API struct _cef_frame_t*  CefBrowser_GetFrameByident(
	struct _cef_browser_t* self,
	int64 identifier)
{
	return self->get_frame_byident(self, identifier);
}

CEFAU3API struct _cef_frame_t*  CefBrowser_GetFrame(struct _cef_browser_t* self,
	wchar_t* name)
{
	return self->get_frame(self, cefstring_pwcs(name));
}

CEFAU3API size_t  CefBrowser_GetFrameCount(struct _cef_browser_t* self)
{
	return self->get_frame_count(self);
}

CEFAU3API void  CefBrowser_GetFrameIdentifiers(struct _cef_browser_t* self,
	size_t* identifiersCount,
	int64* identifiers)
{
	self->get_frame_identifiers(self, identifiersCount, identifiers);
}

CEFAU3API void  CefBrowser_GetFrameNames(struct _cef_browser_t* self,
	cef_string_list_t names)
{
	self->get_frame_names(self, names);
}

CEFAU3API int  CefBrowser_SendProcessMessage(
	struct _cef_browser_t* self,
	cef_process_id_t target_process,
	struct _cef_process_message_t* message)
{
	return self->send_process_message(
		self,
		target_process,
		message
	);
}

/* CefBrowserHost
--------------------------------------------------*/

typedef struct CefBrowserHost {
	cef_browser_t self;
} CefBrowserHost;

CefHandlerObjCreate(CefBrowserHost);

CEFAU3API struct _cef_browser_t*  CefBrowserHost_GetBrowser(
	struct _cef_browser_host_t* self)
{
	return self->get_browser(self);
}

CEFAU3API void  CefBrowserHost_CloseBrowser(struct _cef_browser_host_t* self,
	int force_close)
{
	self->close_browser(self, force_close);
}

CEFAU3API int  CefBrowserHost_TryCloseBrowser(struct _cef_browser_host_t* self)
{
	return self->try_close_browser(self);
}

CEFAU3API void  CefBrowserHost_SetFocus(struct _cef_browser_host_t* self, int focus)
{
	self->set_focus(self, focus);
}

CEFAU3API cef_window_handle_t  CefBrowserHost_GetWindowHandle(
	struct _cef_browser_host_t* self)
{
	return self->get_window_handle(self);
}

CEFAU3API cef_window_handle_t  CefBrowserHost_GetOpenerWindowHandle(
	struct _cef_browser_host_t* self)
{
	return self->get_opener_window_handle(self);
}

CEFAU3API int  CefBrowserHost_HasView(struct _cef_browser_host_t* self)
{
	return self->has_view(self);
}

CEFAU3API struct _cef_client_t*  CefBrowserHost_GetClient(
	struct _cef_browser_host_t* self)
{
	return self->get_client(self);
}

CEFAU3API struct _cef_request_context_t*  CefBrowserHost_GetRequestContext(
	struct _cef_browser_host_t* self)
{
	return self->get_request_context(self);
}

CEFAU3API double  CefBrowserHost_GetZoomLevel(struct _cef_browser_host_t* self)
{
	return self->get_zoom_level(self);
}

CEFAU3API void  CefBrowserHost_SetZoomLevel(struct _cef_browser_host_t* self,
	double zoomLevel)
{
	self->set_zoom_level(self, zoomLevel);
}

CEFAU3API void  CefBrowserHost_RunFileDialog(
	struct _cef_browser_host_t* self,
	cef_file_dialog_mode_t mode,
	const wchar_t* title,
	const wchar_t* default_file_path,
	cef_string_list_t accept_filters,
	int selected_accept_filter,
	struct _cef_run_file_dialog_callback_t* callback)
{
	self->run_file_dialog(
		self,
		mode,
		cefstring_pwcs(title),
		cefstring_pwcs(default_file_path),
		accept_filters,
		selected_accept_filter,
		callback
	);
}

CEFAU3API void  CefBrowserHost_StartDownload(struct _cef_browser_host_t* self,
	const wchar_t* url)
{
	self->start_download(self, cefstring_pwcs(url));
}

CEFAU3API void  CefBrowserHost_DownloadImage(
	struct _cef_browser_host_t* self,
	const wchar_t* image_url,
	int is_favicon,
	uint32 max_image_size,
	int bypass_cache,
	struct _cef_download_image_callback_t* callback)
{
	self->download_image(
		self,
		cefstring_pwcs(image_url),
		is_favicon,
		max_image_size,
		bypass_cache,
		callback
	);
}

CEFAU3API void  CefBrowserHost_Print(struct _cef_browser_host_t* self)
{
	self->print(self);
}

CEFAU3API void  CefBrowserHost_PrintToPDF(
	struct _cef_browser_host_t* self,
	const wchar_t* path,
	const struct _cef_pdf_print_settings_t* settings,
	struct _cef_pdf_print_callback_t* callback)
{
	self->print_to_pdf(
		self,
		cefstring_pwcs(path),
		settings,
		callback
	);
}

CEFAU3API void  CefBrowserHost_Find(struct _cef_browser_host_t* self,
	int identifier,
	const wchar_t* searchText,
	int forward,
	int matchCase,
	int findNext)
{
	self->find(
		self,
		identifier,
		cefstring_pwcs(searchText),
		forward,
		matchCase,
		findNext
	);
}

CEFAU3API void  CefBrowserHost_StopFinding(struct _cef_browser_host_t* self,
	int clearSelection)
{
	self->stop_finding(self, clearSelection);
}

CEFAU3API void  CefBrowserHost_ShowDevTools(
	struct _cef_browser_host_t* self,
	const struct _cef_window_info_t* windowInfo,
	struct _cef_client_t* client,
	const struct _cef_browser_settings_t* settings,
	const cef_point_t* inspect_element_at)
{
	self->show_dev_tools(
		self,
		windowInfo,
		client,
		settings,
		inspect_element_at
	);
}

CEFAU3API void  CefBrowserHost_CloseDevTools(struct _cef_browser_host_t* self)
{
	self->close_dev_tools(self);
}


CEFAU3API int  CefBrowserHost_HasDevTools(struct _cef_browser_host_t* self)
{
	return self->has_dev_tools(self);
}

CEFAU3API void  CefBrowserHost_GetNavigationEntries(
	struct _cef_browser_host_t* self,
	struct _cef_navigation_entry_visitor_t* visitor,
	int current_only)
{
	self->get_navigation_entries(
		self,
		visitor,
		current_only
	);
}

CEFAU3API void  CefBrowserHost_SetMouseCursorChangeDisabled(
	struct _cef_browser_host_t* self,
	int disabled)
{
	self->set_mouse_cursor_change_disabled(
		self,
		disabled
	);
}

CEFAU3API int  CefBrowserHost_IsMouseCursorChangeDisabled(
	struct _cef_browser_host_t* self)
{
	return self->is_mouse_cursor_change_disabled(self);
}

CEFAU3API void  CefBrowserHost_ReplaceMisspelling(struct _cef_browser_host_t* self,
	const wchar_t* word)
{
	self->replace_misspelling(
		self,
		cefstring_pwcs(word)
	);
}

CEFAU3API void  CefBrowserHost_AddWordToDictionary(struct _cef_browser_host_t* self,
	const wchar_t* word)
{
	self->add_word_to_dictionary(
		self,
		cefstring_pwcs(word)
	);
}

CEFAU3API int  CefBrowserHost_IsWindowRenderingDisabled(
	struct _cef_browser_host_t* self)
{
	return self->is_window_rendering_disabled(self);
}

CEFAU3API void  CefBrowserHost_WasResized(struct _cef_browser_host_t* self)
{
	self->was_resized(self);
}

CEFAU3API void  CefBrowserHost_WasHidden(struct _cef_browser_host_t* self, int hidden)
{
	self->was_hidden(self, hidden);
}

CEFAU3API void  CefBrowserHost_NotifyScreenInfoChanged(
	struct _cef_browser_host_t* self)
{
	self->notify_move_or_resize_started(self);
}

CEFAU3API void  CefBrowserHost_Invalidate(struct _cef_browser_host_t* self,
	cef_paint_element_type_t type)
{
	self->invalidate(
		self,
		type
	);
}

CEFAU3API void  CefBrowserHost_SendKeyEvent(struct _cef_browser_host_t* self,
	const struct _cef_key_event_t* event)
{
	self->send_key_event(
		self,
		event
	);
}

CEFAU3API void  CefBrowserHost_SendMouseClickEvent(
	struct _cef_browser_host_t* self,
	const struct _cef_mouse_event_t* event,
	cef_mouse_button_type_t type,
	int mouseUp,
	int clickCount)
{
	self->send_mouse_click_event(
		self,
		event,
		type,
		mouseUp,
		clickCount
	);
}

CEFAU3API void  CefBrowserHost_SendMouseMoveEvent(
	struct _cef_browser_host_t* self,
	const struct _cef_mouse_event_t* event,
	int mouseLeave)
{
	self->send_mouse_move_event(
		self,
		event,
		mouseLeave
	);
}

CEFAU3API void  CefBrowserHost_SendMouseWheelEvent(
	struct _cef_browser_host_t* self,
	const struct _cef_mouse_event_t* event,
	int deltaX,
	int deltaY)
{
	self->send_mouse_wheel_event(
		self,
		event,
		deltaX,
		deltaY
	);
}

CEFAU3API void  CefBrowserHost_SendFocusEvent(struct _cef_browser_host_t* self,
	int setFocus)
{
	self->send_focus_event(
		self,
		setFocus
	);
}

CEFAU3API void  CefBrowserHost_SendCaptureLostEvent(struct _cef_browser_host_t* self)
{
	self->send_capture_lost_event(self);
}

CEFAU3API void  CefBrowserHost_NotifyMoveOrResizeStarted(
	struct _cef_browser_host_t* self)
{
	self->notify_move_or_resize_started(self);
}

CEFAU3API int  CefBrowserHost_GetWindowlessFrameRate(
	struct _cef_browser_host_t* self)
{
	return self->get_windowless_frame_rate(self);
}

CEFAU3API void  CefBrowserHost_SetWindowlessFrameRate(
	struct _cef_browser_host_t* self,
	int frame_rate)
{
	self->set_windowless_frame_rate(
		self,
		frame_rate
	);
}

CEFAU3API void  CefBrowserHost_ImeSetComposition(
	struct _cef_browser_host_t* self,
	const wchar_t* text,
	size_t underlinesCount,
	cef_composition_underline_t const* underlines,
	const cef_range_t* replacement_range,
	const cef_range_t* selection_range)
{
	self->ime_set_composition(
		self,
		cefstring_pwcs(text),
		underlinesCount,
		underlines,
		replacement_range,
		selection_range
	);
}

CEFAU3API void  CefBrowserHost_ImeCommitText(struct _cef_browser_host_t* self,
	const wchar_t* text,
	const cef_range_t* replacement_range,
	int relative_cursor_pos)
{
	self->ime_commit_text(
		self,
		cefstring_pwcs(text),
		replacement_range,
		relative_cursor_pos
	);
}

CEFAU3API void  CefBrowserHost_ImeFinishComposingText(
	struct _cef_browser_host_t* self,
	int keep_selection)
{
	self->ime_finish_composing_text(
		self,
		keep_selection
	);
}

CEFAU3API void  CefBrowserHost_ImeCancelComposition(struct _cef_browser_host_t* self)
{
	self->ime_cancel_composition(self);
}

CEFAU3API void  CefBrowserHost_DragTargetDragEnter(
	struct _cef_browser_host_t* self,
	struct _cef_drag_data_t* drag_data,
	const struct _cef_mouse_event_t* event,
	cef_drag_operations_mask_t allowed_ops)
{
	self->drag_target_drag_enter(
		self,
		drag_data,
		event,
		allowed_ops
	);
}

CEFAU3API void  CefBrowserHost_DragTargetDragOver(
	struct _cef_browser_host_t* self,
	const struct _cef_mouse_event_t* event,
	cef_drag_operations_mask_t allowed_ops)
{
	self->drag_target_drag_over(
		self,
		event,
		allowed_ops
	);
}

CEFAU3API void  CefBrowserHost_DragTargetDragLeave(struct _cef_browser_host_t* self)
{
	self->drag_target_drag_leave(self);
}

CEFAU3API void  CefBrowserHost_DragTargetDrop(struct _cef_browser_host_t* self,
	const struct _cef_mouse_event_t* event)
{
	self->drag_target_drop(
		self,
		event
	);
}

CEFAU3API void  CefBrowserHost_DragSourceEndedAt(struct _cef_browser_host_t* self,
	int x,
	int y,
	cef_drag_operations_mask_t op)
{
	self->drag_source_ended_at(
		self,
		x,
		y,
		op
	);
}

CEFAU3API void  CefBrowserHost_DragSourceSystemDragEnded(
	struct _cef_browser_host_t* self)
{
	self->drag_source_system_drag_ended(self);
}

CEFAU3API struct _cef_navigation_entry_t*  CefBrowserHost_GetVisibleNavigationEntry(
	struct _cef_browser_host_t* self)
{
	return self->get_visible_navigation_entry(self);
}

CEFAU3API void  CefBrowserHost_SetAccessibilityState(struct _cef_browser_host_t* self,
	cef_state_t accessibility_state)
{
	self->set_accessibility_state(self, accessibility_state);
}

//////////////////////////

CEFAU3API int  CefBrowserHost_CreateBrowser(
	const cef_window_info_t* windowInfo,
	struct _cef_client_t* client,
	wchar_t *cs_url,
	const struct _cef_browser_settings_t* settings,
	struct _cef_request_context_t* request_context)
{
	cef_string_t s = { 0 };
	cef_string_from_wide(cs_url, wcslen(cs_url), &s);

	return cef_browser_host_create_browser(
		windowInfo,
		client,
		&s,
		settings,
		request_context
	);
}

CEFAU3API cef_browser_t *  CefBrowserHost_CreateBrowserSync(
	const cef_window_info_t* windowInfo,
	struct _cef_client_t* client,
	wchar_t *cs_url,
	const struct _cef_browser_settings_t* settings,
	struct _cef_request_context_t* request_context)
{
	cef_string_t s = { 0 };
	cef_string_from_wide(cs_url, wcslen(cs_url), &s);
	return cef_browser_host_create_browser_sync(
		windowInfo,
		client,
		&s,
		settings,
		request_context
	);
}