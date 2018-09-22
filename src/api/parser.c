#include "../cefau3.h"

#include "include/capi/cef_parser_capi.h"

CEFAU3API int CefParseUrl(const wchar_t* url,
	struct _cef_urlparts_t* parts)
{
	return cef_parse_url(
		cefstring_pwcs(url), 
		parts
	);
}

CEFAU3API int CefCreateUrl(const struct _cef_urlparts_t* parts,
	wchar_t* url)
{
	return cef_create_url(
		parts, 
		cefstring_pwcs(url)
	);
}

CEFAU3API const wchar_t* CefFormatUrlForSecurityDisplay(const wchar_t* origin_url)
{
	return cef_format_url_for_security_display(cefstring_pwcs(origin_url))->str;
}

CEFAU3API const wchar_t* CefGetNimeType(const wchar_t* extension)
{
	return cef_get_mime_type(cefstring_pwcs(extension))->str;
}

CEFAU3API void CefGetExtensionForMimeType(const wchar_t* mime_type, cef_string_list_t extensions)
{
	cef_get_extensions_for_mime_type(
		cefstring_pwcs(mime_type), 
		extensions
	);
}

CEFAU3API const wchar_t* CefBase64Encode(const void* data,
	size_t data_size)
{
	return cef_base64encode(data, data_size)->str;
}

CEFAU3API struct _cef_binary_value_t* CefBase64Decode(
	const wchar_t* data)
{
	return cef_base64decode(cefstring_pwcs(data));
}

CEFAU3API const wchar_t* CefURIEncode(const wchar_t* text,
	int use_plus)
{
	return cef_uriencode(
		cefstring_pwcs(text), 
		use_plus
	)->str;
}

CEFAU3API const wchar_t* CefURIDecode(const wchar_t* text,
	int convert_to_utf8,
	cef_uri_unescape_rule_t unescape_rule)
{
	return cef_uridecode(
		cefstring_pwcs(text), 
		convert_to_utf8, 
		unescape_rule
	)->str;
}

CEFAU3API struct _cef_value_t* CefParseJson(
	const wchar_t* json_string,
	cef_json_parser_options_t options)
{
	return cef_parse_json(
		cefstring_pwcs(json_string),
		options
	);
}

CEFAU3API struct _cef_value_t* CefParseJsonAndReturnError(
	const wchar_t* json_string,
	cef_json_parser_options_t options,
	cef_json_parser_error_t* error_code_out,
	cef_string_t* error_msg_out)
{
	return cef_parse_jsonand_return_error(
		cefstring_pwcs(json_string),
		options,
		error_code_out,
		error_msg_out
	);
}

CEFAU3API const wchar_t* CefWriteJson(struct _cef_value_t* node, cef_json_writer_options_t options)
{
	return cef_write_json(node, options)->str;
}