#cs
	file: api/types.au3
	author: wuuyi123
#ce

#include-once

func __CefTypes_SetString($ptr, $name, $prop_name, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', $name & '_Set_' & $prop_name, 'ptr', $ptr, 'wstr', $value)
endfunc

func __CefTypes_GetString($ptr, $name, $prop_name)
	local $ret = dllcall($__Cefau3Dll__, 'wstr:cdecl', $name & '_Get_' & $prop_name, 'ptr', $ptr)
	return @error ? null : $ret[0]
endfunc

func __CefTypes_SetPtr($ptr, $name, $prop_name, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', $name & '_Set_' & $prop_name, 'ptr', $ptr, 'ptr', $value)
endfunc

func __CefTypes_GetPtr($ptr, $name, $prop_name)
	local $ret = dllcall($__Cefau3Dll__, 'ptr:cdecl', $name & '_Get_' & $prop_name, 'ptr', $ptr)
	return @error ? null : $ret[0]
endfunc

; CefSettings
; ==================================================

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
)

func CefSettings_Create($ptr = null)
	if ($ptr==null) then $ptr = dllcall($__Cefau3Dll__, 'ptr:cdecl', 'CefSettings_Create')[0]
	local $struct = CefStruct_Create($tag_CefSettings, 'CefSettings', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'browser_subprocess_path', '__CefSettings_bsp')
	CefStruct_AddMethod($struct, 'framework_dir_path', '__CefSettings_fdp')
	CefStruct_AddMethod($struct, 'cache_path', '__CefSettings_cp')
	CefStruct_AddMethod($struct, 'user_data_path', '__CefSettings_udp')
	CefStruct_AddMethod($struct, 'user_agent', '__CefSettings_ua')
	CefStruct_AddMethod($struct, 'product_version', '__CefSettings_pv')
	CefStruct_AddMethod($struct, 'locale', '__CefSettings_l')
	CefStruct_AddMethod($struct, 'log_file', '__CefSettings_lf')
	CefStruct_AddMethod($struct, 'javascript_flags', '__CefSettings_jf')
	CefStruct_AddMethod($struct, 'resources_dir_path', '__CefSettings_rdp')
	CefStruct_AddMethod($struct, 'locales_dir_path', '__CefSettings_ldp')
	CefStruct_AddMethod($struct, 'accept_language_list', '__CefSettings_all')

	return $struct
endfunc

func __CefSettings_bsp($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'browser_subprocess_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'browser_subprocess_path', $value)
endfunc

func __CefSettings_fdp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'framework_dir_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'framework_dir_path', $value)
endfunc

func __CefSettings_cp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'cache_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'cache_path', $value)
endfunc

func __CefSettings_udp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'user_data_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'user_data_path', $value)
endfunc

func __CefSettings_ua($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'user_agent')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'user_agent', $value)
endfunc

func __CefSettings_pv($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'product_version')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'product_version', $value)
endfunc

func __CefSettings_l($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'locale')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'locale', $value)
endfunc

func __CefSettings_lf($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'log_file')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'log_file', $value)
endfunc

func __CefSettings_jf($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'javascript_flags')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'javascript_flags', $value)
endfunc

func __CefSettings_rdp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'resources_dir_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'resources_dir_path', $value)
endfunc

func __CefSettings_ldp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'locales_dir_path')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'locales_dir_path', $value)
endfunc

func __CefSettings_all($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefSettings', 'accept_language_list')
    __CefTypes_SetString($self.__pointer__, 'CefSettings', 'accept_language_list', $value)
endfunc

; CefBrowserSettings
; ==================================================

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
)

func CefBrowserSettings_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefBrowserSettings, 'CefBrowserSettings', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'standard_font_family', '__CefBrowserSettings_sff')
	CefStruct_AddMethod($struct, 'fixed_font_family', '__CefBrowserSettings_fff')
	CefStruct_AddMethod($struct, 'serif_font_family', '__CefBrowserSettings_seff')
	CefStruct_AddMethod($struct, 'sans_serif_font_family', '__CefBrowserSettings_ssff')
	CefStruct_AddMethod($struct, 'cursive_font_family', '__CefBrowserSettings_cff')
	CefStruct_AddMethod($struct, 'fantasy_font_family', '__CefBrowserSettings_faff')
	CefStruct_AddMethod($struct, 'default_encoding', '__CefBrowserSettings_de')
	CefStruct_AddMethod($struct, 'accept_language_list', '__CefBrowserSettings_all')

	return $struct
endfunc

func __CefBrowserSettings_sff($self, $value = null)
    if @numparams == 1 then _
	return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'standard_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'standard_font_family', $value)
endfunc

func __CefBrowserSettings_fff($self, $value = null)
    if @numparams == 1 then _
	return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'fixed_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'fixed_font_family', $value)
endfunc

func __CefBrowserSettings_seff($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'serif_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'serif_font_family', $value)
endfunc

func __CefBrowserSettings_ssff($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'sans_serif_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'sans_serif_font_family', $value)
endfunc

func __CefBrowserSettings_cff($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'cursive_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'cursive_font_family', $value)
endfunc

func __CefBrowserSettings_faff($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'fantasy_font_family')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'fantasy_font_family', $value)
endfunc

func __CefBrowserSettings_de($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'default_encoding')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'default_encoding', $value)
endfunc

func __CefBrowserSettings_all($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefBrowserSettings', 'accept_language_list')
    __CefTypes_SetString($self.__pointer__, 'CefBrowserSettings', 'accept_language_list', $value)
endfunc

; CefRequestContextSettings
; ==================================================

global $tag_CefRequestContextSettings = ( _
	'uint size;' & _
	$tag_CefString & _ ; cache_path;
	'int persist_session_cookies;' & _
	'int persist_user_preferences;' & _
	'int ignore_certificate_errors;' & _
	'int enable_net_security_expiration;' & _
	$tag_CefString _ ; accept_language_list;
)

func CefRequestContextSettings_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefRequestContextSettings, 'CefRequestContextSettings', $ptr)
	$struct.size = $struct.__size__

	CefStruct_AddMethod($struct, 'cache_path', '__CefRequestContextSettings_cp')
	CefStruct_AddMethod($struct, 'accept_language_list', '__CefRequestContextSettings_all')

	return $struct
endfunc

func __CefRequestContextSettings_cp($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefRequestContextSettings', 'cache_path')
    __CefTypes_SetString($self.__pointer__, 'CefRequestContextSettings', 'cache_path', $value)
endfunc

func __CefRequestContextSettings_all($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefRequestContextSettings', 'accept_language_list')
    __CefTypes_SetString($self.__pointer__, 'CefRequestContextSettings', 'accept_language_list', $value)
endfunc

; CefURLParts
; ==================================================

global $tag_CefURLParts = ( _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString & _
	$tag_CefString _
)

func CefURLParts_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefURLParts, 'CefURLParts', $ptr)

	CefStruct_AddMethod($struct, 'spec', '__CefURLParts_sff')
	CefStruct_AddMethod($struct, 'scheme', '__CefURLParts_scheme')
	CefStruct_AddMethod($struct, 'username', '__CefURLParts_username')
	CefStruct_AddMethod($struct, 'password', '__CefURLParts_password')
	CefStruct_AddMethod($struct, 'host', '__CefURLParts_host')
	CefStruct_AddMethod($struct, 'port', '__CefURLParts_port')
	CefStruct_AddMethod($struct, 'origin', '__CefURLParts_origin')
	CefStruct_AddMethod($struct, 'path', '__CefURLParts_path')
	CefStruct_AddMethod($struct, 'query', '__CefURLParts_query')

	return $struct
endfunc

func __CefURLParts_spec($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'spec')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'spec', $value)
endfunc

func __CefURLParts_scheme($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'scheme')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'scheme', $value)
endfunc

func __CefURLParts_username($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'username')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'username', $value)
endfunc

func __CefURLParts_password($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'password')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'password', $value)
endfunc

func __CefURLParts_host($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'host')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'host', $value)
endfunc

func __CefURLParts_port($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'port')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'port', $value)
endfunc

func __CefURLParts_origin($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'origin')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'origin', $value)
endfunc

func __CefURLParts_path($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'path')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'path', $value)
endfunc

func __CefURLParts_query($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefURLParts', 'query')
    __CefTypes_SetString($self.__pointer__, 'CefURLParts', 'query', $value)
endfunc

; CefTime
; ==================================================

global $tag_CefTime = ( _
	'int year;' & _
	'int month;' & _
	'int day_of_week;' & _
	'int day_of_month;' & _
	'int hour;' & _
	'int minute;' & _
	'int second;' & _
	'int millisecond;' _
)

func CefTime_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefTime, 'CefTime', $ptr)

	return $struct
endfunc

; CefCookie
; ==================================================

global $tag_CefCookie = ( _
	$tag_CefString & _ ; name;
	$tag_CefString & _ ; value;
	$tag_CefString & _ ; domain;
	$tag_CefString & _ ; path;
	'int secure;' & _
	'int httponly;' & _
	$tag_CefTime & _ ; creation;' & _
	$tag_CefTime & _ ; last_access;' & _
	'int has_expires;' & _
	$tag_CefTime _ ; expires;' _
)

func CefCookie_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefCookie, 'CefCookie', $ptr)

	CefStruct_AddMethod($struct, 'name' , '__CefCookie_name')
	CefStruct_AddMethod($struct, 'value' , '__CefCookie_value')
	CefStruct_AddMethod($struct, 'domain' , '__CefCookie_domain')
	CefStruct_AddMethod($struct, 'path' , '__CefCookie_path')

	return $struct
endfunc

func __CefCookie_name($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefCookie', 'name')
    __CefTypes_SetString($self.__pointer__, 'CefCookie', 'name', $value)
endfunc

func __CefCookie_value($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefCookie', 'value')
    __CefTypes_SetString($self.__pointer__, 'CefCookie', 'value', $value)
endfunc

func __CefCookie_domain($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefCookie', 'domain')
    __CefTypes_SetString($self.__pointer__, 'CefCookie', 'domain', $value)
endfunc

func __CefCookie_path($self, $value = null)
    if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefCookie', 'path')
    __CefTypes_SetString($self.__pointer__, 'CefCookie', 'path', $value)
endfunc

; CefPoint
; ==================================================

global $tag_CefPoint = ( _
	'int x;' & _
	'int y;' _
)

func CefPoint_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPoint, 'CefPoint', $ptr)

	return $struct
endfunc

; CefRect
; ==================================================

global $tag_CefRect = ( _
	'int x;' & _
	'int y;' & _
	'int width;' & _
	'int height;' _
)

func CefRect_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefRect, 'CefRect', $ptr)

	return $struct
endfunc

; CefSize
; ==================================================

global $tag_CefSize = ( _
	'int width;' & _
	'int height;' _
)

func CefSize_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefSize, 'CefSize', $ptr)

	return $struct
endfunc

; CefRange
; ==================================================

global $tag_CefRange = ( _
	'int from;' & _
	'int to;' _
)

func CefRange_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefRange, 'CefRange', $ptr)

	return $struct
endfunc

; CefInsets
; ==================================================

global $tag_CefInsets = ( _
	'int top;' & _
	'int left;' & _
	'int bottom;' & _
	'int right;' _
)

func CefInsets_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefInsets, 'CefInsets', $ptr)

	return $struct
endfunc

; CefDraggableRegion
; ==================================================

global $tag_CefDraggableRegion = ( _
	$tag_CefRect & _ ; bounds;
	'int draggable;' _
)

func CefDraggableRegion_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefDraggableRegion, 'CefDraggableRegion', $ptr)

	CefStruct_AddMethod($struct, 'bounds', '__CefDraggableRegion_b')

	return $struct
endfunc

func __CefDraggableRegion_b($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefDraggableRegion', 'bounds')
    __CefTypes_SetPtr($self.__pointer__, 'CefDraggableRegion', 'bounds', $value)
endfunc

; CefScreenInfo
; ==================================================

global $tag_CefScreenInfo = ( _
	'float device_scale_factor;' & _
	'int depth;' & _
	'int depth_per_component;' & _
	'int is_monochrome;' & _
	$tag_CefRect & _ ;rect;
	$tag_CefRect _ ;available_rect;
)

func CefScreenInfo_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefScreenInfo, 'CefScreenInfo', $ptr)

	CefStruct_AddMethod($struct, 'rect', '__CefScreenInfo_r')
	CefStruct_AddMethod($struct, 'available_rect', '__CefScreenInfo_ar')

	return $struct
endfunc

func __CefScreenInfo_r($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefScreenInfo', 'rect')
    __CefTypes_SetPtr($self.__pointer__, 'CefScreenInfo', 'rect', $value)
endfunc

func __CefScreenInfo_ar($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefScreenInfo', 'available_rect')
    __CefTypes_SetPtr($self.__pointer__, 'CefScreenInfo', 'available_rect', $value)
endfunc

; CefMouseEvent
; ==================================================

global $tag_CefMouseEvent = ( _
	'int x;' & _
	'int y;' & _
	'uint modifiers;' _
)

func CefMouseEvent_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefMouseEvent, 'CefMouseEvent', $ptr)

	return $struct
endfunc

; CefKeyEvent
; ==================================================

global $tag_CefKeyEvent = ( _
	'int type;' & _
	'uint modifiers;' & _
	'int windows_key_code;' & _
	'int native_key_code;' & _
	'int is_system_key;' & _
	'wchar character;' & _
	'wchar unmodified_character;' & _
	'int focus_on_editable_field;' _
)

func CefKeyEvent_Create($ptr = null)
	;local $struct = CefStruct_Create($tag_CefKeyEvent, 'CefKeyEvent', $ptr)

	;return $struct
	return dllstructcreate($tag_CefKeyEvent, $ptr)
endfunc

; CefPopupFeatures
; ==================================================

global $tag_CefPopupFeatures = ( _
	'int x;' & _
	'int xSet;' & _
	'int y;' & _
	'int ySet;' & _
	'int width;' & _
	'int widthSet;' & _
	'int height;' & _
	'int heightSet;' & _
	'int menuBarVisible;' & _
	'int statusBarVisible;' & _
	'int toolBarVisible;' & _
	'int scrollbarsVisible;' _
)

func CefPopupFeatures_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPopupFeatures, 'CefPopupFeatures', $ptr)

	return $struct
endfunc

; CefGeoPosition
; ==================================================

global $tag_CefGeoPosition = ( _
	'double latitude;' & _
	'double longitude;' & _
	'double altitude;' & _
	'double accuracy;' & _
	'double altitude_accuracy;' & _
	'double heading;' & _
	'double speed;' & _
	$tag_CefTime & _ ; timestamp;
	'int error_code;' & _
	$tag_CefString _ ; error_message;
)

func CefGeoPosition_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefGeoPosition, 'CefGeoPosition', $ptr)

	CefStruct_AddMethod($struct, 'timestamp', '__CefGeoPosition_t')
	CefStruct_AddMethod($struct, 'error_message', '__CefCursorInfo_em')

	return $struct
endfunc

func __CefGeoPosition_t($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefGeoPosition', 'timestamp')
    __CefTypes_SetPtr($self.__pointer__, 'CefGeoPosition', 'timestamp', $value)
endfunc

func __CefGeoPosition_em($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefGeoPosition', 'error_message')
    __CefTypes_SetString($self.__pointer__, 'CefGeoPosition', 'error_message', $value)
endfunc

; CefCursorInfo
; ==================================================

global $tag_CefCursorInfo = ( _
	$tag_CefPoint & _ ; hotspot;
	'float image_scale_factor;' & _
	'ptr buffer;' & _
	$tag_CefSize _ ; size;
)

func CefCursorInfo_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefCursorInfo, 'CefCursorInfo', $ptr)

	CefStruct_AddMethod($struct, 'hotspot', '__CefCursorInfo_h')
	CefStruct_AddMethod($struct, 'size', '__CefCursorInfo_s')

	return $struct
endfunc

func __CefCursorInfo_h($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefCursorInfo', 'hotspot')
    __CefTypes_SetPtr($self.__pointer__, 'CefCursorInfo', 'hotspot', $value)
endfunc

func __CefCursorInfo_s($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefCursorInfo', 'size')
    __CefTypes_SetPtr($self.__pointer__, 'CefCursorInfo', 'size', $value)
endfunc

; CefPDFPrintSettings
; ==================================================

global $tag_CefPDFPrintSettings = ( _
	$tag_CefString & _ ; header_footer_title;
	$tag_CefString & _ ; header_footer_url;
	'int page_width;' & _
	'int page_height;' & _
	'int scale_factor;' & _
	'double margin_top;' & _
	'double margin_right;' & _
	'double margin_bottom;' & _
	'double margin_left;' & _
	'int margin_type;' & _
	'int header_footer_enabled;' & _
	'int selection_only;' & _
	'int landscape;' & _
	'int backgrounds_enabled;' _
)

func CefPDFPrintSettings_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefPDFPrintSettings, 'CefPDFPrintSettings', $ptr)

	CefStruct_AddMethod($struct, 'header_footer_title', '__CefPDFPrintSettings_hft')
	CefStruct_AddMethod($struct, 'header_footer_title', '__CefPDFPrintSettings_hfu')

	return $struct
endfunc

func __CefPDFPrintSettings_hft($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefPDFPrintSettings', 'header_footer_title')
    __CefTypes_SetString($self.__pointer__, 'CefPDFPrintSettings', 'header_footer_title', $value)
endfunc

func __CefPDFPrintSettings_hfu($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetString($self.__pointer__, 'CefPDFPrintSettings', 'header_footer_url')
    __CefTypes_SetString($self.__pointer__, 'CefPDFPrintSettings', 'header_footer_url', $value)
endfunc

; CefBoxLayoutSettings
; ==================================================

global $tag_CefBoxLayoutSettings = ( _
	'int horizontal;' & _
	'int inside_border_horizontal_spacing;' & _
	'int inside_border_vertical_spacing;' & _
	$tag_CefInsets & _ ; inside_border_insets;
	'int between_child_spacing;' & _
	'int main_axis_alignment;' & _
	'int cross_axis_alignment;' & _
	'int minimum_cross_axis_size;' & _
	'int default_flex;' _
)

func CefBoxLayoutSettings_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefBoxLayoutSettings, 'CefBoxLayoutSettings', $ptr)

	CefStruct_AddMethod($struct, 'inside_border_insets', '__CefBoxLayoutSettings_ibi')

	return $struct
endfunc

func __CefBoxLayoutSettings_ibi($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefBoxLayoutSettings', 'inside_border_insets')
    __CefTypes_SetPtr($self.__pointer__, 'CefBoxLayoutSettings', 'inside_border_insets', $value)
endfunc

; CefCompositionUnderline
; ==================================================

global $tag_CefCompositionUnderline = ( _
	$tag_CefRange & _ ; range;
	'uint color;' & _
	'uint background_color;' & _
	'int thick;' _
)

func CefCompositionUnderline_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefCompositionUnderline, 'CefCompositionUnderline', $ptr)

	CefStruct_AddMethod($struct, 'range', '__CefCompositionUnderline_r')

	return $struct
endfunc

func __CefCompositionUnderline_r($self, $value = null)
	if @numparams == 1 then _
		return __CefTypes_GetPtr($self.__pointer__, 'CefCompositionUnderline', 'range')
    __CefTypes_SetPtr($self.__pointer__, 'CefCompositionUnderline', 'range', $value)
endfunc