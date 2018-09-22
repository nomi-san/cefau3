#cs
	file: api/types.au3
	author: wuuyi123
#ce

global $tag_CefSettings = ( _
	'uint size;' & _
	'int single_process;' & _
	'int no_sandbox;' & _
	$tag_CefString & _
	$tag_CefString & _
	'int multi_threaded_message_loop;' & _
	'int external_message_pump;' & _
	'int windowless_rendering_enabled;' & _
	'int command_line_args_disabled;' & _
	$tag_CefString & _
	$tag_CefString & _
	'int persist_session_cookies;' & _
	'int persist_user_preferences;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int log_severity;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int pack_loading_disabled;' & _
	'int remote_debugging_port;' & _
	'int uncaught_exception_stack_size;' & _
	'int ignore_certificate_errors;' & _
	'int enable_net_security_expiration;' & _
	'uint background_color;' & _
	$tag_CefString _
) ;CefSettings

func CefSettings_Create()
;~ 	Local $ret = DllCall($__Cefau3Dll__, 'ptr:cdecl', 'CefSettings_Create')
;~ 	Return @error ? 0 : $ret[0]

	local $struct = _AutoItObject_DllStructCreate($tag_CefSettings)
	$struct.size = Cef_StructSize(30);
	$struct.log_severity = 99;
	$struct.no_sandbox = true; // 1
	$struct.multi_threaded_message_loop = true;

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddMethod($struct, 'browser_subprocess_path', '__CefSettings_bsp')
	_AutoItObject_AddMethod($struct, 'framework_dir_path', '__CefSettings_fdp')
	_AutoItObject_AddMethod($struct, 'cache_path', '__CefSettings_cp')
	_AutoItObject_AddMethod($struct, 'user_data_path', '__CefSettings_udp')
	_AutoItObject_AddMethod($struct, 'user_agent', '__CefSettings_ua')
	_AutoItObject_AddMethod($struct, 'product_version', '__CefSettings_pv')
	_AutoItObject_AddMethod($struct, 'locale', '__CefSettings_l')
	_AutoItObject_AddMethod($struct, 'log_file', '__CefSettings_lf')
	_AutoItObject_AddMethod($struct, 'javascript_flags', '__CefSettings_jf')
	_AutoItObject_AddMethod($struct, 'resources_dir_path', '__CefSettings_rdp')
	_AutoItObject_AddMethod($struct, 'locales_dir_path', '__CefSettings_ldp')
	_AutoItObject_AddMethod($struct, 'accept_language_list', '__CefSettings_all')

	return $struct
EndFunc

;////////////////////

func __CefSettings_Set($self, $name, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefSettings_Set_' & $name, 'ptr', $self.ptr, 'wstr', $value)
endfunc

func __CefSettings_Get($self, $name)
	local $ret = dllcall($__Cefau3Dll__, 'none:cdecl', 'CefSettings_Get_' & $name, 'ptr', $self.ptr)
	return @error ? null : $ret[0]
endfunc

;/////////////////////

func __CefSettings_bsp($self, $value = null)
	if @numparams == 1 then _
		return __CefSettings_Get($self, 'browser_subprocess_path')
    __CefSettings_Set($self, 'browser_subprocess_path', $value)
endfunc

func __CefSettings_fdp($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'framework_dir_path')
    __CefSettings_Set($self, 'framework_dir_path', $value)
endfunc

func __CefSettings_cp($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'cache_path')
    __CefSettings_Set($self, 'cache_path', $value)
endfunc

func __CefSettings_udp($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'user_data_path')
    __CefSettings_Set($self, 'user_data_path', $value)
endfunc

func __CefSettings_ua($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'user_agent')
    __CefSettings_Set($self, 'user_agent', $value)
endfunc

func __CefSettings_pv($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'product_version')
    __CefSettings_Set($self, 'product_version', $value)
endfunc

func __CefSettings_l($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'locale')
    __CefSettings_Set($self, 'locale', $value)
endfunc

func __CefSettings_lf($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'log_file')
    __CefSettings_Set($self, 'log_file', $value)
endfunc

func __CefSettings_jf($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'javascript_flags')
    __CefSettings_Set($self, 'javascript_flags', $value)
endfunc

func __CefSettings_rdp($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'resources_dir_path')
    __CefSettings_Set($self, 'resources_dir_path', $value)
endfunc

func __CefSettings_ldp($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'locales_dir_path')
    __CefSettings_Set($self, 'locales_dir_path', $value)
endfunc

func __CefSettings_all($self, $value = null)
    if @numparams == 1 then _
		return __CefSettings_Get($self, 'accept_language_list')
    __CefSettings_Set($self, 'accept_language_list', $value)
endfunc


global $tag_CefBrowserSettings = ( _
	'uint size;' & _
	'int windowless_frame_rate;' & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	'int default_font_size;' & _
	'int default_fixed_font_size;' & _
	'int minimum_font_size;' & _
	'int minimum_logical_font_size;' & _
	$tag_CefString & _
	'int remote_fonts;' & _
	'int javascript;' & _
	'int javascript_close_windows;' & _
	'int javascript_access_clipboard;' & _
	'int javascript_dom_paste;' & _
	'int plugins;' & _
	'int universal_access_from_file_urls;' & _
	'int file_access_from_file_urls;' & _
	'int web_security;' & _
	'int image_loading;' & _
	'int image_shrink_standalone_to_fit;' & _
	'int text_area_resize;' & _
	'int tab_to_links;' & _
	'int local_storage;' & _
	'int databases;' & _
	'int application_cache;' & _
	'int webgl;' & _
	'uint background_color;' & _
	$tag_CefString _
) ;CefBrowserSettings

;////////////////////

func __CefBrowserSettings_Set($self, $name, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserSettings_Set_' & $name, 'ptr', $self.ptr, 'wstr', $value)
endfunc

func __CefBrowserSettings_Get($self, $name)
	local $ret = dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserSettings_Get_' & $name, 'ptr', $self.ptr)
	return @error ? null : $ret[0]
endfunc

;/////////////////////

func CefBrowserSettings_Create()
;~ 	Local $ret = DllCall($__Cefau3Dll__, 'ptr:cdecl', 'CefBrowserSettings_Create')
;~ 	Return @error ? 0 : $ret[0]
	local $struct = _AutoItObject_DllStructCreate($tag_CefSettings)
	$struct.size = Cef_StructSize(32);

	_AutoItObject_AddProperty($struct, 'ptr', $ELSCOPE_READONLY, $struct())
	_AutoItObject_AddMethod($struct, 'standard_font_family', '__CefBrowserSettings_sff')
	_AutoItObject_AddMethod($struct, 'fixed_font_family', '__CefBrowserSettings_fff')
	_AutoItObject_AddMethod($struct, 'serif_font_family', '__CefBrowserSettings_seff')
	_AutoItObject_AddMethod($struct, 'sans_serif_font_family', '__CefBrowserSettings_ssff')
	_AutoItObject_AddMethod($struct, 'cursive_font_family', '__CefBrowserSettings_cff')
	_AutoItObject_AddMethod($struct, 'fantasy_font_family', '__CefBrowserSettings_faff')
	_AutoItObject_AddMethod($struct, 'default_encoding', '__CefBrowserSettings_de')
	_AutoItObject_AddMethod($struct, 'accept_language_list', '__CefBrowserSettings_all')

	return $struct
EndFunc

func __CefBrowserSettings_sff($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'standard_font_family')
    __CefBrowserSettings_Set($self, 'standard_font_family', $value)
endfunc

func __CefBrowserSettings_fff($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'fixed_font_family')
    __CefBrowserSettings_Set($self, 'fixed_font_family', $value)
endfunc

func __CefBrowserSettings_seff($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'serif_font_family')
    __CefBrowserSettings_Set($self, 'serif_font_family', $value)
endfunc

func __CefBrowserSettings_ssff($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'sans_serif_font_family')
    __CefBrowserSettings_Set($self, 'sans_serif_font_family', $value)
endfunc

func __CefBrowserSettings_cff($self, $value = null)
	if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'cursive_font_family')
    __CefBrowserSettings_Set($self, 'cursive_font_family', $value)
endfunc

func __CefBrowserSettings_faff($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'fantasy_font_family')
    __CefBrowserSettings_Set($self, 'fantasy_font_family', $value)
endfunc

func __CefBrowserSettings_de($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'default_encoding')
    __CefBrowserSettings_Set($self, 'default_encoding', $value)
endfunc

func __CefBrowserSettings_all($self, $value = null)
    if @numparams == 1 then _
		return __CefBrowserSettings_Get($self, 'accept_language_list')
    __CefBrowserSettings_Set($self, 'accept_language_list', $value)
endfunc

; ////////////////////////////////////////////////

global $tag_CefKeyEventType = ( _
	'int type;' & _
	'uint modifiers;' & _
	'int windows_key_code;' & _
	'int native_key_code;' & _
	'wchar character;' & _
	'wchar unmodified_character;' & _
	'int focus_on_editable_field;' _
)
