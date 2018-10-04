#include "../cefau3.h"

#include "include/capi/cef_app_capi.h"
#include "include/capi/cef_base_capi.h"
#include "include/capi/cef_client_capi.h"

/* CefSettings
--------------------------------------------------*/

CEFAU3API cef_settings_t * CefSettings_Create()
{
	u16 sz = sizeof(cef_settings_t);
	cef_settings_t *p = calloc(1, sz);
	p->size = sz;
	p->log_severity = 99;
	p->no_sandbox = 1;

	return p;
}

CEFAU3API void CefSettings_Set_browser_subprocess_path(cef_settings_t *self, wchar_t* value)
{
	self->browser_subprocess_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_browser_subprocess_path(cef_settings_t *self)
{
	return self->browser_subprocess_path.str;
}

CEFAU3API void CefSettings_Set_framework_dir_path(cef_settings_t *self, wchar_t* value)
{
	self->framework_dir_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_framework_dir_path(cef_settings_t *self)
{
	return self->framework_dir_path.str;
}

CEFAU3API void CefSettings_Set_cache_path(cef_settings_t *self, wchar_t* value)
{
	self->cache_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_cache_path(cef_settings_t *self)
{
	return self->cache_path.str;
}

CEFAU3API void CefSettings_Set_user_data_path(cef_settings_t *self, wchar_t* value)
{
	self->user_data_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_user_data_path(cef_settings_t *self)
{
	return self->user_data_path.str;
}

CEFAU3API void CefSettings_Set_user_agent(cef_settings_t *self, wchar_t* value)
{
	self->user_agent = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_user_agent(cef_settings_t *self)
{
	return self->user_agent.str;
}

CEFAU3API void CefSettings_Set_product_version(cef_settings_t *self, wchar_t* value)
{
	self->product_version = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_product_version(cef_settings_t *self)
{
	return self->product_version.str;
}

CEFAU3API void CefSettings_Set_locale(cef_settings_t *self, wchar_t* value)
{
	self->locale = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_locale(cef_settings_t *self)
{
	return self->locale.str;
}

CEFAU3API void CefSettings_Set_log_file(cef_settings_t *self, wchar_t* value)
{
	self->log_file = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_log_file(cef_settings_t *self)
{
	return self->log_file.str;
}

CEFAU3API void CefSettings_Set_javascript_flags(cef_settings_t *self, wchar_t* value)
{
	self->javascript_flags = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_javascript_flags(cef_settings_t *self)
{
	return self->javascript_flags.str;
}

CEFAU3API void CefSettings_Set_resources_dir_path(cef_settings_t *self, wchar_t* value)
{
	self->resources_dir_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_resources_dir_path(cef_settings_t *self)
{
	return self->resources_dir_path.str;
}

CEFAU3API void CefSettings_Set_locales_dir_path(cef_settings_t *self, wchar_t* value)
{
	self->locales_dir_path = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_locales_dir_path(cef_settings_t *self)
{
	return self->locales_dir_path.str;
}

CEFAU3API void CefSettings_Set_accept_language_list(cef_settings_t *self, wchar_t* value)
{
	self->accept_language_list = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefSettings_Get_accept_language_list(cef_settings_t *self)
{
	return self->accept_language_list.str;
}

CEFAU3API void CefSettings_Set_size(cef_settings_t *self, int value)
{
	self->size = value;
}

CEFAU3API int CefSettings_Get_size(cef_settings_t *self)
{
	return self->size;
}

CEFAU3API void CefSettings_Set_single_process(cef_settings_t *self, int value)
{
	self->single_process = value;
}

CEFAU3API int CefSettings_Get_single_process(cef_settings_t *self)
{
	return self->single_process;
}

CEFAU3API void CefSettings_Set_no_sandbox(cef_settings_t *self, int value)
{
	self->no_sandbox = value;
}

CEFAU3API int CefSettings_Get_no_sandbox(cef_settings_t *self)
{
	return self->no_sandbox;
}

CEFAU3API void CefSettings_Set_multi_threaded_message_loop(cef_settings_t *self, int value)
{
	self->multi_threaded_message_loop = value;
}

CEFAU3API int CefSettings_Get_multi_threaded_message_loop(cef_settings_t *self)
{
	return self->multi_threaded_message_loop;
}

CEFAU3API void CefSettings_Set_external_message_pump(cef_settings_t *self, int value)
{
	self->external_message_pump = value;
}

CEFAU3API int CefSettings_Get_external_message_pump(cef_settings_t *self)
{
	return self->external_message_pump;
}

CEFAU3API void CefSettings_Set_windowless_rendering_enabled(cef_settings_t *self, int value)
{
	self->windowless_rendering_enabled = value;
}

CEFAU3API int CefSettings_Get_windowless_rendering_enabled(cef_settings_t *self)
{
	return self->windowless_rendering_enabled;
}

CEFAU3API void CefSettings_Set_command_line_args_disabled(cef_settings_t *self, int value)
{
	self->command_line_args_disabled = value;
}

CEFAU3API int CefSettings_Get_command_line_args_disabled(cef_settings_t *self)
{
	return self->command_line_args_disabled;
}

CEFAU3API void CefSettings_Set_persist_session_cookies(cef_settings_t *self, int value)
{
	self->persist_session_cookies = value;
}

CEFAU3API int CefSettings_Get_persist_session_cookies(cef_settings_t *self)
{
	return self->persist_session_cookies;
}

CEFAU3API void CefSettings_Set_persist_user_preferences(cef_settings_t *self, int value)
{
	self->persist_user_preferences = value;
}

CEFAU3API int CefSettings_Get_persist_user_preferences(cef_settings_t *self)
{
	return self->persist_user_preferences;
}

CEFAU3API void CefSettings_Set_log_severity(cef_settings_t *self, int value)
{
	self->log_severity = value;
}

CEFAU3API int CefSettings_Get_log_severity(cef_settings_t *self)
{
	return self->log_severity;
}

CEFAU3API void CefSettings_Set_pack_loading_disabled(cef_settings_t *self, int value)
{
	self->pack_loading_disabled = value;
}

CEFAU3API int CefSettings_Get_pack_loading_disabled(cef_settings_t *self)
{
	return self->pack_loading_disabled;
}

CEFAU3API void CefSettings_Set_remote_debugging_port(cef_settings_t *self, int value)
{
	self->remote_debugging_port = value;
}

CEFAU3API int CefSettings_Get_remote_debugging_port(cef_settings_t *self)
{
	return self->remote_debugging_port;
}

CEFAU3API void CefSettings_Set_uncaught_exception_stack_size(cef_settings_t *self, int value)
{
	self->uncaught_exception_stack_size = value;
}

CEFAU3API int CefSettings_Get_uncaught_exception_stack_size(cef_settings_t *self)
{
	return self->uncaught_exception_stack_size;
}

CEFAU3API void CefSettings_Set_ignore_certificate_errors(cef_settings_t *self, int value)
{
	self->ignore_certificate_errors = value;
}

CEFAU3API int CefSettings_Get_ignore_certificate_errors(cef_settings_t *self)
{
	return self->ignore_certificate_errors;
}

CEFAU3API void CefSettings_Set_enable_net_security_expiration(cef_settings_t *self, int value)
{
	self->enable_net_security_expiration = value;
}

CEFAU3API int CefSettings_Get_enable_net_security_expiration(cef_settings_t *self)
{
	return self->enable_net_security_expiration;
}

CEFAU3API void CefSettings_Set_background_color(cef_settings_t *self, int value)
{
	self->background_color = value;
}

CEFAU3API int CefSettings_Get_background_color(cef_settings_t *self)
{
	return self->background_color;
}

/* Cef RequestContextSettings
--------------------------------------------------*/

CEFAU3API void CefRequestContextSettings_Set_size(cef_request_context_settings_t *self, int value)
{
	self->size = value;
}

CEFAU3API int CefRequestContextSettings_Get_size(cef_request_context_settings_t *self)
{
	return self->size;
}

CEFAU3API void CefRequestContextSettings_Set_persist_session_cookies(cef_request_context_settings_t *self, int value)
{
	self->persist_session_cookies = value;
}

CEFAU3API int CefRequestContextSettings_Get_persist_session_cookies(cef_request_context_settings_t *self)
{
	return self->persist_session_cookies;
}

CEFAU3API void CefRequestContextSettings_Set_persist_user_preferences(cef_request_context_settings_t *self, int value)
{
	self->persist_user_preferences = value;
}

CEFAU3API int CefRequestContextSettings_Get_persist_user_preferences(cef_request_context_settings_t *self)
{
	return self->persist_user_preferences;
}

CEFAU3API void CefRequestContextSettings_Set_ignore_certificate_errors(cef_request_context_settings_t *self, int value)
{
	self->ignore_certificate_errors = value;
}

CEFAU3API int CefRequestContextSettings_Get_ignore_certificate_errors(cef_request_context_settings_t *self)
{
	return self->ignore_certificate_errors;
}

CEFAU3API void CefRequestContextSettings_Set_enable_net_security_expiration(cef_request_context_settings_t *self, int value)
{
	self->enable_net_security_expiration = value;
}

CEFAU3API int CefRequestContextSettings_Get_enable_net_security_expiration(cef_request_context_settings_t *self)
{
	return self->enable_net_security_expiration;
}

CEFAU3API void CefRequestContextSettings_Set_cache_path(cef_request_context_settings_t *self, const wchar_t* value)
{
	self->cache_path = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefRequestContextSettings_Get_cache_path(cef_request_context_settings_t *self)
{
	return self->cache_path.str;
}

CEFAU3API void CefRequestContextSettings_Set_accept_language_list(cef_request_context_settings_t *self, const wchar_t* value)
{
	self->accept_language_list = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefRequestContextSettings_Get_accept_language_list(cef_request_context_settings_t *self)
{
	return self->accept_language_list.str;
}

/* Cef BrowserSettings
--------------------------------------------------*/

CEFAU3API cef_browser_settings_t * CefBrowserSettings_Create()
{
	u16 sz = sizeof(cef_browser_settings_t);
	cef_browser_settings_t *p = calloc(1, sz);
	p->size = sz;
	return p;
}

CEFAU3API void CefBrowser_Show(cef_browser_t *self)
{
	ShowWindow(self->get_host(self)->get_window_handle(self->get_host(self)), 5);
}

CEFAU3API void CefBrowserSettings_Set_standard_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->standard_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_standard_font_family(cef_browser_settings_t *self)
{
	return self->standard_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_fixed_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->fixed_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_fixed_font_family(cef_browser_settings_t *self)
{
	return self->fixed_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_serif_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->serif_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_serif_font_family(cef_browser_settings_t *self)
{
	return self->serif_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_sans_serif_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->sans_serif_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_sans_serif_font_family(cef_browser_settings_t *self)
{
	return self->sans_serif_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_cursive_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->cursive_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_cursive_font_family(cef_browser_settings_t *self)
{
	return self->cursive_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_fantasy_font_family(cef_browser_settings_t *self, wchar_t *value)
{
	self->fantasy_font_family = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_fantasy_font_family(cef_browser_settings_t *self)
{
	return self->fantasy_font_family.str;
}

CEFAU3API void CefBrowserSettings_Set_default_encoding(cef_browser_settings_t *self, wchar_t *value)
{
	self->default_encoding = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_default_encoding(cef_browser_settings_t *self)
{
	return self->default_encoding.str;
}

CEFAU3API void CefBrowserSettings_Set_accept_language_list(cef_browser_settings_t *self, wchar_t *value)
{
	self->accept_language_list = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefBrowserSettings_Get_accept_language_list(cef_browser_settings_t *self)
{
	return self->accept_language_list.str;
}

CEFAU3API void CefBrowserSettings_Set_size(cef_browser_settings_t *self, int value)
{
	self->size = value;
}

CEFAU3API int CefBrowserSettings_Get_size(cef_browser_settings_t *self)
{
	return self->size;
}

CEFAU3API void CefBrowserSettings_Set_windowless_frame_rate(cef_browser_settings_t *self, int value)
{
	self->windowless_frame_rate = value;
}

CEFAU3API int CefBrowserSettings_Get_windowless_frame_rate(cef_browser_settings_t *self)
{
	return self->windowless_frame_rate;
}

CEFAU3API void CefBrowserSettings_Set_default_font_size(cef_browser_settings_t *self, int value)
{
	self->default_font_size = value;
}

CEFAU3API int CefBrowserSettings_Get_default_font_size(cef_browser_settings_t *self)
{
	return self->default_font_size;
}

CEFAU3API void CefBrowserSettings_Set_default_fixed_font_size(cef_browser_settings_t *self, int value)
{
	self->default_fixed_font_size = value;
}

CEFAU3API int CefBrowserSettings_Get_default_fixed_font_size(cef_browser_settings_t *self)
{
	return self->default_fixed_font_size;
}

CEFAU3API void CefBrowserSettings_Set_minimum_font_size(cef_browser_settings_t *self, int value)
{
	self->minimum_font_size = value;
}

CEFAU3API int CefBrowserSettings_Get_minimum_font_size(cef_browser_settings_t *self)
{
	return self->minimum_font_size;
}

CEFAU3API void CefBrowserSettings_Set_minimum_logical_font_size(cef_browser_settings_t *self, int value)
{
	self->minimum_logical_font_size = value;
}

CEFAU3API int CefBrowserSettings_Get_minimum_logical_font_size(cef_browser_settings_t *self)
{
	return self->minimum_logical_font_size;
}

CEFAU3API void CefBrowserSettings_Set_remote_fonts(cef_browser_settings_t *self, int value)
{
	self->remote_fonts = value;
}

CEFAU3API int CefBrowserSettings_Get_remote_fonts(cef_browser_settings_t *self)
{
	return self->remote_fonts;
}

CEFAU3API void CefBrowserSettings_Set_javascript(cef_browser_settings_t *self, int value)
{
	self->javascript = value;
}

CEFAU3API int CefBrowserSettings_Get_javascript(cef_browser_settings_t *self)
{
	return self->javascript;
}

CEFAU3API void CefBrowserSettings_Set_javascript_close_windows(cef_browser_settings_t *self, int value)
{
	self->javascript_close_windows = value;
}

CEFAU3API int CefBrowserSettings_Get_javascript_close_windows(cef_browser_settings_t *self)
{
	return self->javascript_close_windows;
}

CEFAU3API void CefBrowserSettings_Set_javascript_access_clipboard(cef_browser_settings_t *self, int value)
{
	self->javascript_access_clipboard = value;
}

CEFAU3API int CefBrowserSettings_Get_javascript_access_clipboard(cef_browser_settings_t *self)
{
	return self->javascript_access_clipboard;
}

CEFAU3API void CefBrowserSettings_Set_javascript_dom_paste(cef_browser_settings_t *self, int value)
{
	self->javascript_dom_paste = value;
}

CEFAU3API int CefBrowserSettings_Get_javascript_dom_paste(cef_browser_settings_t *self)
{
	return self->javascript_dom_paste;
}

CEFAU3API void CefBrowserSettings_Set_plugins(cef_browser_settings_t *self, int value)
{
	self->plugins = value;
}

CEFAU3API int CefBrowserSettings_Get_plugins(cef_browser_settings_t *self)
{
	return self->plugins;
}

CEFAU3API void CefBrowserSettings_Set_universal_access_from_file_urls(cef_browser_settings_t *self, int value)
{
	self->universal_access_from_file_urls = value;
}

CEFAU3API int CefBrowserSettings_Get_universal_access_from_file_urls(cef_browser_settings_t *self)
{
	return self->universal_access_from_file_urls;
}

CEFAU3API void CefBrowserSettings_Set_file_access_from_file_urls(cef_browser_settings_t *self, int value)
{
	self->file_access_from_file_urls = value;
}

CEFAU3API int CefBrowserSettings_Get_file_access_from_file_urls(cef_browser_settings_t *self)
{
	return self->file_access_from_file_urls;
}

CEFAU3API void CefBrowserSettings_Set_web_security(cef_browser_settings_t *self, int value)
{
	self->web_security = value;
}

CEFAU3API int CefBrowserSettings_Get_web_security(cef_browser_settings_t *self)
{
	return self->web_security;
}

CEFAU3API void CefBrowserSettings_Set_image_loading(cef_browser_settings_t *self, int value)
{
	self->image_loading = value;
}

CEFAU3API int CefBrowserSettings_Get_image_loading(cef_browser_settings_t *self)
{
	return self->image_loading;
}

CEFAU3API void CefBrowserSettings_Set_image_shrink_standalone_to_fit(cef_browser_settings_t *self, int value)
{
	self->image_shrink_standalone_to_fit = value;
}

CEFAU3API int CefBrowserSettings_Get_image_shrink_standalone_to_fit(cef_browser_settings_t *self)
{
	return self->image_shrink_standalone_to_fit;
}

CEFAU3API void CefBrowserSettings_Set_text_area_resize(cef_browser_settings_t *self, int value)
{
	self->text_area_resize = value;
}

CEFAU3API int CefBrowserSettings_Get_text_area_resize(cef_browser_settings_t *self)
{
	return self->text_area_resize;
}

CEFAU3API void CefBrowserSettings_Set_tab_to_links(cef_browser_settings_t *self, int value)
{
	self->tab_to_links = value;
}

CEFAU3API int CefBrowserSettings_Get_tab_to_links(cef_browser_settings_t *self)
{
	return self->tab_to_links;
}

CEFAU3API void CefBrowserSettings_Set_local_storage(cef_browser_settings_t *self, int value)
{
	self->local_storage = value;
}

CEFAU3API int CefBrowserSettings_Get_local_storage(cef_browser_settings_t *self)
{
	return self->local_storage;
}

CEFAU3API void CefBrowserSettings_Set_databases(cef_browser_settings_t *self, int value)
{
	self->databases = value;
}

CEFAU3API int CefBrowserSettings_Get_databases(cef_browser_settings_t *self)
{
	return self->databases;
}

CEFAU3API void CefBrowserSettings_Set_application_cache(cef_browser_settings_t *self, int value)
{
	self->application_cache = value;
}

CEFAU3API int CefBrowserSettings_Get_application_cache(cef_browser_settings_t *self)
{
	return self->application_cache;
}

CEFAU3API void CefBrowserSettings_Set_webgl(cef_browser_settings_t *self, int value)
{
	self->webgl = value;
}

CEFAU3API int CefBrowserSettings_Get_webgl(cef_browser_settings_t *self)
{
	return self->webgl;
}

CEFAU3API void CefBrowserSettings_Set_background_color(cef_browser_settings_t *self, int value)
{
	self->background_color = value;
}

CEFAU3API int CefBrowserSettings_Get_background_color(cef_browser_settings_t *self)
{
	return self->background_color;
}

/* CefURLParts
--------------------------------------------------*/

CEFAU3API void CefURLParts_Set_spec(cef_urlparts_t *self, const wchar_t *value)
{
	self->spec = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_spec(cef_urlparts_t *self)
{
	return self->spec.str;
}

CEFAU3API void CefURLParts_Set_scheme(cef_urlparts_t *self, const wchar_t *value)
{
	self->scheme = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_scheme(cef_urlparts_t *self)
{
	return self->scheme.str;
}

CEFAU3API void CefURLParts_Set_username(cef_urlparts_t *self, const wchar_t *value)
{
	self->username = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_username(cef_urlparts_t *self)
{
	return self->username.str;
}

CEFAU3API void CefURLParts_Set_password(cef_urlparts_t *self, const wchar_t *value)
{
	self->password = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_password(cef_urlparts_t *self)
{
	return self->password.str;
}

CEFAU3API void CefURLParts_Set_host(cef_urlparts_t *self, const wchar_t *value)
{
	self->host = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_host(cef_urlparts_t *self)
{
	return self->host.str;
}

CEFAU3API void CefURLParts_Set_port(cef_urlparts_t *self, const wchar_t *value)
{
	self->port = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_port(cef_urlparts_t *self)
{
	return self->port.str;
}

CEFAU3API void CefURLParts_Set_origin(cef_urlparts_t *self, const wchar_t *value)
{
	self->origin = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_origin(cef_urlparts_t *self)
{
	return self->origin.str;
}

CEFAU3API void CefURLParts_Set_path(cef_urlparts_t *self, const wchar_t *value)
{
	self->path = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_path(cef_urlparts_t *self)
{
	return self->path.str;
}

CEFAU3API void CefURLParts_Set_query(cef_urlparts_t *self, const wchar_t *value)
{
	self->query = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefURLParts_Get_query(cef_urlparts_t *self)
{
	return self->query.str;
}

/* CefCookie
--------------------------------------------------*/

CEFAU3API void CefCookie_Set_name(cef_cookie_t *self, const wchar_t *value)
{
	self->name = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefCookie_Get_name(cef_cookie_t *self)
{
	return self->name.str;
}

CEFAU3API void CefCookie_Set_value(cef_cookie_t *self, const wchar_t *value)
{
	self->value = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefCookie_Get_value(cef_cookie_t *self)
{
	return self->value.str;
}

CEFAU3API void CefCookie_Set_domain(cef_cookie_t *self, const wchar_t *value)
{
	self->domain = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefCookie_Get_domain(cef_cookie_t *self)
{
	return self->domain.str;
}

CEFAU3API void CefCookie_Set_path(cef_cookie_t *self, const wchar_t *value)
{
	self->path = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefCookie_Get_path(cef_cookie_t *self)
{
	return self->path.str;
}

CEFAU3API void CefCookie_Set_secure(cef_cookie_t *self, int value)
{
	self->secure = value;
}

CEFAU3API int CefCookie_Get_secure(cef_cookie_t *self)
{
	return self->secure;
}

CEFAU3API void CefCookie_Set_httponly(cef_cookie_t *self, int value)
{
	self->httponly = value;
}

CEFAU3API int CefCookie_Get_httponly(cef_cookie_t *self)
{
	return self->httponly;
}

CEFAU3API void CefCookie_Set_creation(cef_cookie_t *self, cef_time_t *value)
{
	self->creation = *value;
}

CEFAU3API cef_time_t* CefCookie_Get_creation(cef_cookie_t *self)
{
	return &self->creation;
}

CEFAU3API void CefCookie_Set_last_access(cef_cookie_t *self, cef_time_t *value)
{
	self->last_access = *value;
}

CEFAU3API cef_time_t* CefCookie_Get_last_access(cef_cookie_t *self)
{
	return &self->last_access;
}

CEFAU3API void CefCookie_Set_has_expires(cef_cookie_t *self, int value)
{
	self->has_expires = value;
}

CEFAU3API int CefCookie_Get_has_expires(cef_cookie_t *self)
{
	return self->has_expires;
}

CEFAU3API void CefCookie_Set_expires(cef_cookie_t *self, cef_time_t *value)
{
	self->expires = *value;
}

CEFAU3API cef_time_t* CefCookie_Get_expires(cef_cookie_t *self)
{
	return &self->expires;
}

/* CefPoint
--------------------------------------------------*/

CEFAU3API void CefPoint_Set_x(cef_point_t *self, int value)
{
	self->x = value;
}

CEFAU3API int CefPoint_Get_x(cef_point_t *self)
{
	return self->x;
}

CEFAU3API void CefPoint_Set_y(cef_point_t *self, int value)
{
	self->y = value;
}

CEFAU3API int CefPoint_Get_y(cef_point_t *self)
{
	return self->y;
}

/* CefRect
--------------------------------------------------*/

CEFAU3API void CefRect_Set_x(cef_rect_t *self, int value)
{
	self->x = value;
}

CEFAU3API int CefRect_Get_x(cef_rect_t *self)
{
	return self->x;
}

CEFAU3API void CefRect_Set_y(cef_rect_t *self, int value)
{
	self->y = value;
}

CEFAU3API int CefRect_Get_y(cef_rect_t *self)
{
	return self->y;
}

CEFAU3API void CefRect_Set_width(cef_rect_t *self, int value)
{
	self->width = value;
}

CEFAU3API int CefRect_Get_width(cef_rect_t *self)
{
	return self->width;
}

CEFAU3API void CefRect_Set_height(cef_rect_t *self, int value)
{
	self->height = value;
}

CEFAU3API int CefRect_Get_height(cef_rect_t *self)
{
	return self->height;
}

/* CefSize
--------------------------------------------------*/

CEFAU3API void CefSize_Set_width(cef_size_t *self, int value)
{
	self->width = value;
}

CEFAU3API int CefSize_Get_width(cef_size_t *self)
{
	return self->width;
}

CEFAU3API void CefSize_Set_height(cef_size_t *self, int value)
{
	self->height = value;
}

CEFAU3API int CefSize_Get_height(cef_size_t *self)
{
	return self->height;
}

/* CefRange
--------------------------------------------------*/

CEFAU3API void CefRange_Set_to(cef_range_t *self, int value)
{
	self->to = value;
}

CEFAU3API int CefRange_Get_to(cef_range_t *self)
{
	return self->to;
}

CEFAU3API void CefRange_Set_from(cef_range_t *self, int value)
{
	self->from = value;
}

CEFAU3API int CefRange_Get_from(cef_range_t *self)
{
	return self->from;
}

/* CefInsets
--------------------------------------------------*/

CEFAU3API void CefInsets_Set_top(cef_insets_t *self, int value)
{
	self->top = value;
}

CEFAU3API int CefInsets_Get_top(cef_insets_t *self)
{
	return self->top;
}

CEFAU3API void CefInsets_Set_left(cef_insets_t *self, int value)
{
	self->left = value;
}

CEFAU3API int CefInsets_Get_left(cef_insets_t *self)
{
	return self->left;
}

CEFAU3API void CefInsets_Set_bottom(cef_insets_t *self, int value)
{
	self->bottom = value;
}

CEFAU3API int CefInsets_Get_bottom(cef_insets_t *self)
{
	return self->bottom;
}

CEFAU3API void CefInsets_Set_right(cef_insets_t *self, int value)
{
	self->right = value;
}

CEFAU3API int CefInsets_Get_right(cef_insets_t *self)
{
	return self->right;
}

/* CefDraggableRegion
--------------------------------------------------*/

CEFAU3API void CefDraggableRegion_Set_bounds(cef_draggable_region_t *self, cef_rect_t *value)
{
	self->bounds = *value;
}

CEFAU3API cef_rect_t * CefDraggableRegion_Get_bounds(cef_draggable_region_t *self)
{
	return &self->bounds;
}

CEFAU3API void CefDraggableRegion_Set_draggable(cef_draggable_region_t *self, int value)
{
	self->draggable = value;
}

CEFAU3API int CefDraggableRegion_Get_draggable(cef_draggable_region_t *self)
{
	return self->draggable;
}

/* CefScreenInfo
--------------------------------------------------*/

CEFAU3API void CefScreenInfo_Set_depth(cef_screen_info_t *self, int value)
{
	self->depth = value;
}

CEFAU3API int CefScreenInfo_Get_depth(cef_screen_info_t *self)
{
	return self->depth;
}

CEFAU3API void CefScreenInfo_Set_depth_per_component(cef_screen_info_t *self, int value)
{
	self->depth_per_component = value;
}

CEFAU3API int CefScreenInfo_Get_depth_per_component(cef_screen_info_t *self)
{
	return self->depth_per_component;
}

CEFAU3API void CefScreenInfo_Set_is_monochrome(cef_screen_info_t *self, int value)
{
	self->is_monochrome = value;
}

CEFAU3API int CefScreenInfo_Get_is_monochrome(cef_screen_info_t *self)
{
	return self->is_monochrome;
}

CEFAU3API void CefScreenInfo_Set_device_scale_factor(cef_screen_info_t *self, float value)
{
	self->device_scale_factor = value;
}

CEFAU3API float CefScreenInfo_Get_device_scale_factor(cef_screen_info_t *self)
{
	return self->device_scale_factor;
}

CEFAU3API void CefScreenInfo_Set_rect(cef_screen_info_t *self, cef_rect_t* value)
{
	self->rect = *value;
}

CEFAU3API cef_rect_t* CefScreenInfo_Get_rect(cef_screen_info_t *self)
{
	return &self->rect;
}

CEFAU3API void CefScreenInfo_Set_available_rect(cef_screen_info_t *self, cef_rect_t* value)
{
	self->available_rect = *value;
}

CEFAU3API cef_rect_t* CefScreenInfo_Get_available_rect(cef_screen_info_t *self)
{
	return &self->available_rect;
}

/* CefMouseEvent
--------------------------------------------------*/

CEFAU3API void CefMouseEvent_Set_x(cef_mouse_event_t *self, int value)
{
	self->x = value;
}

CEFAU3API int CefMouseEvent_Get_x(cef_mouse_event_t *self)
{
	return self->x;
}

CEFAU3API void CefMouseEvent_Set_y(cef_mouse_event_t *self, int value)
{
	self->y = value;
}

CEFAU3API int CefMouseEvent_Get_y(cef_mouse_event_t *self)
{
	return self->y;
}

CEFAU3API void CefMouseEvent_Set_modifiers(cef_mouse_event_t *self, int value)
{
	self->modifiers = value;
}

CEFAU3API int CefMouseEvent_Get_modifiers(cef_mouse_event_t *self)
{
	return self->modifiers;
}

/* CefKeyEvent
--------------------------------------------------*/

CEFAU3API void CefKeyEvent_Set_type(cef_key_event_t *self, int value)
{
	self->type = value;
}

CEFAU3API int CefKeyEvent_Get_type(cef_key_event_t *self)
{
	return self->type;
}

CEFAU3API void CefKeyEvent_Set_modifiers(cef_key_event_t *self, int value)
{
	self->modifiers = value;
}

CEFAU3API int CefKeyEvent_Get_modifiers(cef_key_event_t *self)
{
	return self->modifiers;
}

CEFAU3API void CefKeyEvent_Set_windows_key_code(cef_key_event_t *self, int value)
{
	self->windows_key_code = value;
}

CEFAU3API int CefKeyEvent_Get_windows_key_code(cef_key_event_t *self)
{
	return self->windows_key_code;
}

CEFAU3API void CefKeyEvent_Set_native_key_code(cef_key_event_t *self, int value)
{
	self->native_key_code = value;
}

CEFAU3API int CefKeyEvent_Get_native_key_code(cef_key_event_t *self)
{
	return self->native_key_code;
}

CEFAU3API void CefKeyEvent_Set_is_system_key(cef_key_event_t *self, int value)
{
	self->is_system_key = value;
}

CEFAU3API int CefKeyEvent_Get_is_system_key(cef_key_event_t *self)
{
	return self->is_system_key;
}

CEFAU3API void CefKeyEvent_Set_focus_on_editable_field(cef_key_event_t *self, int value)
{
	self->focus_on_editable_field = value;
}

CEFAU3API int CefKeyEvent_Get_focus_on_editable_field(cef_key_event_t *self)
{
	return self->focus_on_editable_field;
}

/*
char16 character;
char16 unmodified_character;
*/

/* CefPopupFeatures
--------------------------------------------------*/

CEFAU3API void CefPopupFeatures_Set_x(cef_popup_features_t *self, int value)
{
	self->x = value;
}

CEFAU3API int CefPopupFeatures_Get_x(cef_popup_features_t *self)
{
	return self->x;
}

CEFAU3API void CefPopupFeatures_Set_xSet(cef_popup_features_t *self, int value)
{
	self->xSet = value;
}

CEFAU3API int CefPopupFeatures_Get_xSet(cef_popup_features_t *self)
{
	return self->xSet;
}

CEFAU3API void CefPopupFeatures_Set_y(cef_popup_features_t *self, int value)
{
	self->y = value;
}

CEFAU3API int CefPopupFeatures_Get_y(cef_popup_features_t *self)
{
	return self->y;
}

CEFAU3API void CefPopupFeatures_Set_ySet(cef_popup_features_t *self, int value)
{
	self->ySet = value;
}

CEFAU3API int CefPopupFeatures_Get_ySet(cef_popup_features_t *self)
{
	return self->ySet;
}

CEFAU3API void CefPopupFeatures_Set_width(cef_popup_features_t *self, int value)
{
	self->width = value;
}

CEFAU3API int CefPopupFeatures_Get_width(cef_popup_features_t *self)
{
	return self->width;
}

CEFAU3API void CefPopupFeatures_Set_widthSet(cef_popup_features_t *self, int value)
{
	self->widthSet = value;
}

CEFAU3API int CefPopupFeatures_Get_widthSet(cef_popup_features_t *self)
{
	return self->widthSet;
}

CEFAU3API void CefPopupFeatures_Set_height(cef_popup_features_t *self, int value)
{
	self->height = value;
}

CEFAU3API int CefPopupFeatures_Get_height(cef_popup_features_t *self)
{
	return self->height;
}

CEFAU3API void CefPopupFeatures_Set_heightSet(cef_popup_features_t *self, int value)
{
	self->heightSet = value;
}

CEFAU3API int CefPopupFeatures_Get_heightSet(cef_popup_features_t *self)
{
	return self->heightSet;
}

CEFAU3API void CefPopupFeatures_Set_menuBarVisible(cef_popup_features_t *self, int value)
{
	self->menuBarVisible = value;
}

CEFAU3API int CefPopupFeatures_Get_menuBarVisible(cef_popup_features_t *self)
{
	return self->menuBarVisible;
}

CEFAU3API void CefPopupFeatures_Set_statusBarVisible(cef_popup_features_t *self, int value)
{
	self->statusBarVisible = value;
}

CEFAU3API int CefPopupFeatures_Get_statusBarVisible(cef_popup_features_t *self)
{
	return self->statusBarVisible;
}

CEFAU3API void CefPopupFeatures_Set_toolBarVisible(cef_popup_features_t *self, int value)
{
	self->toolBarVisible = value;
}

CEFAU3API int CefPopupFeatures_Get_toolBarVisible(cef_popup_features_t *self)
{
	return self->toolBarVisible;
}

CEFAU3API void CefPopupFeatures_Set_scrollbarsVisible(cef_popup_features_t *self, int value)
{
	self->scrollbarsVisible = value;
}

CEFAU3API int CefPopupFeatures_Get_scrollbarsVisible(cef_popup_features_t *self)
{
	return self->scrollbarsVisible;
}

/* CefGeoposition
--------------------------------------------------*/

CEFAU3API void CefGeoposition_Set_latitude(cef_geoposition_t *self, double value)
{
	self->latitude = value;
}

CEFAU3API double CefGeoposition_Get_latitude(cef_geoposition_t *self)
{
	return self->latitude;
}

CEFAU3API void CefGeoposition_Set_longitude(cef_geoposition_t *self, double value)
{
	self->longitude = value;
}

CEFAU3API double CefGeoposition_Get_longitude(cef_geoposition_t *self)
{
	return self->longitude;
}

CEFAU3API void CefGeoposition_Set_altitude(cef_geoposition_t *self, double value)
{
	self->altitude = value;
}

CEFAU3API double CefGeoposition_Get_altitude(cef_geoposition_t *self)
{
	return self->altitude;
}

CEFAU3API void CefGeoposition_Set_accuracy(cef_geoposition_t *self, double value)
{
	self->accuracy = value;
}

CEFAU3API double CefGeoposition_Get_accuracy(cef_geoposition_t *self)
{
	return self->accuracy;
}

CEFAU3API void CefGeoposition_Set_altitude_accuracy(cef_geoposition_t *self, double value)
{
	self->altitude_accuracy = value;
}

CEFAU3API double CefGeoposition_Get_altitude_accuracy(cef_geoposition_t *self)
{
	return self->altitude_accuracy;
}

CEFAU3API void CefGeoposition_Set_heading(cef_geoposition_t *self, double value)
{
	self->heading = value;
}

CEFAU3API double CefGeoposition_Get_heading(cef_geoposition_t *self)
{
	return self->heading;
}

CEFAU3API void CefGeoposition_Set_speed(cef_geoposition_t *self, double value)
{
	self->speed = value;
}

CEFAU3API double CefGeoposition_Get_speed(cef_geoposition_t *self)
{
	return self->speed;
}

CEFAU3API void CefGeoposition_Set_error_code(cef_geoposition_t *self, double value)
{
	self->error_code = value;
}

CEFAU3API double CefGeoposition_Get_error_code(cef_geoposition_t *self)
{
	return self->error_code;
}

CEFAU3API void CefGeoposition_Set_timestamp(cef_geoposition_t *self, cef_time_t *value)
{
	self->timestamp = *value;
}

CEFAU3API cef_time_t* CefGeoposition_Get_timestamp(cef_geoposition_t *self)
{
	return &self->timestamp;
}

CEFAU3API void CefGeoposition_Set_scheme(cef_geoposition_t *self, const wchar_t *value)
{
	self->error_message = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefGeoposition_Get_scheme(cef_geoposition_t *self)
{
	return self->error_message.str;
}

/* CefCursorInfo
--------------------------------------------------*/

CEFAU3API void CefCursorInfo_Set_image_scale_factor(cef_cursor_info_t *self, float value)
{
	self->image_scale_factor = value;
}

CEFAU3API float CefCursorInfo_Get_image_scale_factor(cef_cursor_info_t *self)
{
	return self->image_scale_factor;
}

CEFAU3API void CefCursorInfo_Set_buffer(cef_cursor_info_t *self, void *value)
{
	self->buffer = value;
}

CEFAU3API void* CefCursorInfo_Get_buffer(cef_cursor_info_t *self)
{
	return self->buffer;
}

CEFAU3API void CefCursorInfo_Set_hotspot(cef_cursor_info_t *self, cef_point_t *value)
{
	self->hotspot = *value;
}

CEFAU3API cef_point_t* CefCursorInfo_Get_hotspot(cef_cursor_info_t *self)
{
	return &self->hotspot;
}

CEFAU3API void CefCursorInfo_Set_size(cef_cursor_info_t *self, cef_size_t *value)
{
	self->size = *value;
}

CEFAU3API cef_size_t* CefCursorInfo_Get_size(cef_cursor_info_t *self)
{
	return &self->size;
}

/* CefPDFPrintSettings
--------------------------------------------------*/

CEFAU3API void CefPDFPrintSettings_Set_margin_top(cef_pdf_print_settings_t *self, double value)
{
	self->margin_top = value;
}

CEFAU3API double CefPDFPrintSettings_Get_margin_top(cef_pdf_print_settings_t *self)
{
	return self->margin_top;
}

CEFAU3API void CefPDFPrintSettings_Set_margin_right(cef_pdf_print_settings_t *self, double value)
{
	self->margin_right = value;
}

CEFAU3API double CefPDFPrintSettings_Get_margin_right(cef_pdf_print_settings_t *self)
{
	return self->margin_right;
}

CEFAU3API void CefPDFPrintSettings_Set_margin_bottom(cef_pdf_print_settings_t *self, double value)
{
	self->margin_bottom = value;
}

CEFAU3API double CefPDFPrintSettings_Get_margin_bottom(cef_pdf_print_settings_t *self)
{
	return self->margin_bottom;
}

CEFAU3API void CefPDFPrintSettings_Set_margin_left(cef_pdf_print_settings_t *self, double value)
{
	self->margin_left = value;
}

CEFAU3API double CefPDFPrintSettings_Get_margin_left(cef_pdf_print_settings_t *self)
{
	return self->margin_left;
}

CEFAU3API void CefPDFPrintSettings_Set_page_width(cef_pdf_print_settings_t *self, int value)
{
	self->page_width = value;
}

CEFAU3API int CefPDFPrintSettings_Get_page_width(cef_pdf_print_settings_t *self)
{
	return self->page_width;
}

CEFAU3API void CefPDFPrintSettings_Set_page_height(cef_pdf_print_settings_t *self, int value)
{
	self->page_height = value;
}

CEFAU3API int CefPDFPrintSettings_Get_page_height(cef_pdf_print_settings_t *self)
{
	return self->page_height;
}

CEFAU3API void CefPDFPrintSettings_Set_scale_factor(cef_pdf_print_settings_t *self, int value)
{
	self->scale_factor = value;
}

CEFAU3API int CefPDFPrintSettings_Get_scale_factor(cef_pdf_print_settings_t *self)
{
	return self->scale_factor;
}

CEFAU3API void CefPDFPrintSettings_Set_header_footer_enabled(cef_pdf_print_settings_t *self, int value)
{
	self->header_footer_enabled = value;
}

CEFAU3API int CefPDFPrintSettings_Get_header_footer_enabled(cef_pdf_print_settings_t *self)
{
	return self->header_footer_enabled;
}

CEFAU3API void CefPDFPrintSettings_Set_selection_only(cef_pdf_print_settings_t *self, int value)
{
	self->selection_only = value;
}

CEFAU3API int CefPDFPrintSettings_Get_selection_only(cef_pdf_print_settings_t *self)
{
	return self->selection_only;
}

CEFAU3API void CefPDFPrintSettings_Set_landscape(cef_pdf_print_settings_t *self, int value)
{
	self->landscape = value;
}

CEFAU3API int CefPDFPrintSettings_Get_landscape(cef_pdf_print_settings_t *self)
{
	return self->landscape;
}

CEFAU3API void CefPDFPrintSettings_Set_backgrounds_enabled(cef_pdf_print_settings_t *self, int value)
{
	self->backgrounds_enabled = value;
}

CEFAU3API int CefPDFPrintSettings_Get_backgrounds_enabled(cef_pdf_print_settings_t *self)
{
	return self->backgrounds_enabled;
}

CEFAU3API void CefPDFPrintSettings_Set_margin_type(cef_pdf_print_settings_t *self, int value)
{
	self->margin_type = value;
}

CEFAU3API int CefPDFPrintSettings_Get_margin_type(cef_pdf_print_settings_t *self)
{
	return self->margin_type;
}

CEFAU3API void CefPDFPrintSettings_Set_header_footer_title(cef_pdf_print_settings_t *self, const wchar_t *value)
{
	self->header_footer_title = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefPDFPrintSettings_Get_header_footer_title(cef_pdf_print_settings_t *self)
{
	return self->header_footer_title.str;
}

CEFAU3API void CefPDFPrintSettings_Set_header_footer_url(cef_pdf_print_settings_t *self, const wchar_t *value)
{
	self->header_footer_url = cefstring_wcs(value);
}

CEFAU3API const wchar_t* CefPDFPrintSettings_Get_header_footer_url(cef_pdf_print_settings_t *self)
{
	return self->header_footer_url.str;
}

/* CefBoxLayoutSettings
--------------------------------------------------*/

CEFAU3API void CefBoxLayoutSettings_Set_horizontal(cef_box_layout_settings_t *self, int value)
{
	self->horizontal = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_horizontal(cef_box_layout_settings_t *self)
{
	return self->horizontal;
}

CEFAU3API void CefBoxLayoutSettings_Set_inside_border_horizontal_spacing(cef_box_layout_settings_t *self, int value)
{
	self->inside_border_horizontal_spacing = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_inside_border_horizontal_spacing(cef_box_layout_settings_t *self)
{
	return self->inside_border_horizontal_spacing;
}

CEFAU3API void CefBoxLayoutSettings_Set_inside_border_vertical_spacing(cef_box_layout_settings_t *self, int value)
{
	self->inside_border_vertical_spacing = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_inside_border_vertical_spacing(cef_box_layout_settings_t *self)
{
	return self->inside_border_vertical_spacing;
}

CEFAU3API void CefBoxLayoutSettings_Set_between_child_spacing(cef_box_layout_settings_t *self, int value)
{
	self->between_child_spacing = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_between_child_spacing(cef_box_layout_settings_t *self)
{
	return self->between_child_spacing;
}

CEFAU3API void CefBoxLayoutSettings_Set_minimum_cross_axis_size(cef_box_layout_settings_t *self, int value)
{
	self->minimum_cross_axis_size = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_minimum_cross_axis_size(cef_box_layout_settings_t *self)
{
	return self->minimum_cross_axis_size;
}

CEFAU3API void CefBoxLayoutSettings_Set_default_flex(cef_box_layout_settings_t *self, int value)
{
	self->default_flex = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_default_flex(cef_box_layout_settings_t *self)
{
	return self->default_flex;
}

CEFAU3API void CefBoxLayoutSettings_Set_main_axis_alignment(cef_box_layout_settings_t *self, int value)
{
	self->main_axis_alignment = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_main_axis_alignment(cef_box_layout_settings_t *self)
{
	return self->main_axis_alignment;
}

CEFAU3API void CefBoxLayoutSettings_Set_cross_axis_alignment(cef_box_layout_settings_t *self, int value)
{
	self->cross_axis_alignment = value;
}

CEFAU3API int CefBoxLayoutSettings_Get_cross_axis_alignment(cef_box_layout_settings_t *self)
{
	return self->cross_axis_alignment;
}

CEFAU3API void CefBoxLayoutSettings_Set_inside_border_insets(cef_box_layout_settings_t *self, cef_insets_t *value)
{
	self->inside_border_insets = *value;
}

CEFAU3API cef_insets_t* CefBoxLayoutSettings_Get_inside_border_insets(cef_box_layout_settings_t *self)
{
	return &self->inside_border_insets;
}

/* CefCompositionUnderline
--------------------------------------------------*/

CEFAU3API void CefCompositionUnderline_Set_range(cef_composition_underline_t *self, cef_range_t *value)
{
	self->range = *value;
}

CEFAU3API cef_range_t * CefCompositionUnderline_Get_range(cef_composition_underline_t *self)
{
	return &self->range;
}

CEFAU3API void CefCompositionUnderline_Set_color(cef_composition_underline_t *self, int value)
{
	self->color = value;
}

CEFAU3API int CefCompositionUnderline_Get_color(cef_composition_underline_t *self)
{
	return self->color;
}

CEFAU3API void CefCompositionUnderline_Set_background_color(cef_composition_underline_t *self, int value)
{
	self->background_color = value;
}

CEFAU3API int CefCompositionUnderline_Get_background_color(cef_composition_underline_t *self)
{
	return self->background_color;
}

CEFAU3API void CefCompositionUnderline_Set_thick(cef_composition_underline_t *self, int value)
{
	self->thick = value;
}

CEFAU3API int CefCompositionUnderline_Get_thick(cef_composition_underline_t *self)
{
	return self->thick;
}

////////////////////////////////////////////////////

/* others
--------------------------------------------------*/

// for performance, 'sizeof' be size number by compiler;
CEFAU3API size_t Cef_GetStructSize(size_t idx)
{
	switch (idx) {
		case 0: return sizeof(cef_base_ref_counted_t);
		case 1: return sizeof(cef_app_t);
		case 2: return sizeof(cef_client_t);
		case 3: return sizeof(cef_accessibility_handler_t);
		case 4: return sizeof(cef_browser_process_handler_t);
		case 5: return sizeof(cef_context_menu_handler_t);
		case 6: return sizeof(cef_dialog_handler_t);
		case 7: return sizeof(cef_display_handler_t);
		case 8: return sizeof(cef_download_handler_t);
		case 9: return sizeof(cef_drag_handler_t);
		case 10: return sizeof(cef_find_handler_t);
		case 11: return sizeof(cef_focus_handler_t);
		case 12: return sizeof(cef_geolocation_handler_t);
		case 13: return sizeof(cef_jsdialog_handler_t);
		case 14: return sizeof(cef_keyboard_handler_t);
		case 15: return sizeof(cef_life_span_handler_t);
		case 16: return sizeof(cef_load_handler_t);
		case 17: return sizeof(cef_print_handler_t);
		case 18: return sizeof(cef_render_handler_t);
		case 19: return sizeof(cef_render_process_handler_t);
		case 20: return sizeof(cef_request_context_handler_t);
		case 21: return sizeof(cef_request_handler_t);
		case 22: return sizeof(cef_resource_bundle_handler_t);

		/*
		case 23: return sizeof();
		case 24: return sizeof();
		case 25: return sizeof();
		case 26: return sizeof();
		case 27: return sizeof();
		case 28: return sizeof();
		case 29: return sizeof();
		*/
		
		case 30: return sizeof(cef_settings_t);
		case 31: return sizeof(cef_request_context_settings_t);
		case 32: return sizeof(cef_browser_settings_t);
		case 33: return sizeof(cef_urlparts_t);
		case 34: return sizeof(cef_cookie_t);
		case 35: return sizeof(cef_point_t);
		case 36: return sizeof(cef_rect_t);
		case 37: return sizeof(cef_size_t);
		case 38: return sizeof(cef_range_t);
		case 39: return sizeof(cef_insets_t);
		case 40: return sizeof(cef_draggable_region_t);
		case 41: return sizeof(cef_screen_info_t);
		case 42: return sizeof(cef_mouse_event_t);
		case 43: return sizeof(cef_key_event_t);
		case 44: return sizeof(cef_popup_features_t);
		case 45: return sizeof(cef_geoposition_t);
		case 46: return sizeof(cef_cursor_info_t);
		case 47: return sizeof(cef_pdf_print_settings_t);
		case 48: return sizeof(cef_box_layout_settings_t);
		case 49: return sizeof(cef_composition_underline_t);
		case 50: return sizeof(cef_window_info_t);
		case 51: return sizeof(cef_main_args_t);


		case 80: return sizeof(cef_browser_t);
		case 81: return sizeof(cef_browser_host_t);
	}
	sizeof(cef_pdf_print_margin_type_t);
	return 0;
}