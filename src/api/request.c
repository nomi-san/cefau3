#include "../cefau3.h"

#include "include/capi/cef_request_capi.h"

/* CefRequest
--------------------------------------------------*/

CEFAU3API int CefRequest_IsReadOnly(struct _cef_request_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API const wchar_t* CefRequest_GetUrl(struct _cef_request_t* self)
{
	return self->get_url(self)->str;
}

CEFAU3API void CefRequest_SetUrl(struct _cef_request_t* self,
	const wchar_t* url)
{
	self->set_url(self, cefstring_pwcs(url));
}

CEFAU3API const wchar_t* CefRequest_GetMethod(struct _cef_request_t* self)
{
	return self->get_method(self)->str;
}

CEFAU3API void CefRequest_SetMethod(struct _cef_request_t* self,
	const wchar_t* method)
{
	self->set_method(self, cefstring_pwcs(method));
}

CEFAU3API void CefRequest_SetReferrer(struct _cef_request_t* self,
	const wchar_t* referrer_url,
	cef_referrer_policy_t policy)
{
	self->set_referrer(self, cefstring_pwcs(referrer_url), policy);
}

CEFAU3API const wchar_t* CefRequest_GetReferrerUrl(
	struct _cef_request_t* self)
{
	return self->get_referrer_url(self)->str;
}

CEFAU3API cef_referrer_policy_t CefRequest_GetReferrerPolicy(
	struct _cef_request_t* self)
{
	return self->get_referrer_policy(self);
}

CEFAU3API struct _cef_post_data_t* CefRequest_GetPostData(
	struct _cef_request_t* self)
{
	return self->get_post_data(self);
}

CEFAU3API void CefRequest_SetPostData(struct _cef_request_t* self,
	struct _cef_post_data_t* postData)
{
	self->set_post_data(self, postData);
}

CEFAU3API void CefRequest_GetHeaderMap(struct _cef_request_t* self,
	cef_string_multimap_t headerMap)
{
	self->get_header_map(self, headerMap);
}

CEFAU3API void CefRequest_SetHeaderMap(struct _cef_request_t* self,
	cef_string_multimap_t headerMap)
{
	self->set_header_map(self, headerMap);
}

CEFAU3API void CefRequest_Set(struct _cef_request_t* self,
	const wchar_t* url,
	const wchar_t* method,
	struct _cef_post_data_t* postData,
	cef_string_multimap_t headerMap)
{
	self->set(self, cefstring_pwcs(url), cefstring_pwcs(method), postData, headerMap);
}

CEFAU3API int CefRequest_GetFlags(struct _cef_request_t* self)
{
	return self->get_flags(self);
}

CEFAU3API void CefRequest_SetFlags(struct _cef_request_t* self, int flags)
{
	self->set_flags(self, flags);
}

CEFAU3API const wchar_t* CefRequest_GetFirstPartyForCookies(
	struct _cef_request_t* self)
{
	return self->get_first_party_for_cookies(self)->str;
}

CEFAU3API void CefRequest_SetFirstPartyForCookies(struct _cef_request_t* self,
	const wchar_t* url)
{
	self->set_first_party_for_cookies(self, cefstring_pwcs(url));
}

CEFAU3API cef_resource_type_t CefRequest_GetResourceType(
	struct _cef_request_t* self)
{
	return self->get_resource_type(self);
}

CEFAU3API cef_transition_type_t CefRequest_GetTransitionType(
	struct _cef_request_t* self)
{
	return self->get_transition_type(self);
}

CEFAU3API uint64 CefRequest_GetIdentifier(struct _cef_request_t* self)
{
	return self->get_identifier(self);
}

///////////////////////////////////////////

CEFAU3API cef_request_t* CefRequest_create()
{
	return cef_request_create();
}

/* CefPostData
--------------------------------------------------*/

CEFAU3API int CefPostData_IsReadOnly(struct _cef_post_data_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API int CefPostData_HasExcludedElements(struct _cef_post_data_t* self)
{
	return self->has_excluded_elements(self);
}

CEFAU3API size_t CefPostData_GetElementCount(struct _cef_post_data_t* self)
{
	return self->get_element_count(self);
}

CEFAU3API void CefPostData_GetElements(struct _cef_post_data_t* self,
	size_t* elementsCount,
	struct _cef_post_data_element_t** elements)
{
	self->get_elements(self, elementsCount, elements);
}

CEFAU3API int CefPostData_RemoveElement(struct _cef_post_data_t* self,
	struct _cef_post_data_element_t* element)
{
	return self->remove_element(self, element);
}

CEFAU3API int CefPostData_AddElement(struct _cef_post_data_t* self,
	struct _cef_post_data_element_t* element)
{
	return self->add_element(self, element);
}

CEFAU3API void CefPostData_RemoveElements(struct _cef_post_data_t* self)
{
	self->remove_elements(self);
}

//////////////////////////////////

CEFAU3API cef_post_data_t* CefPostData_Create()
{
	return cef_post_data_create();
}

/* CefPostDataElement
--------------------------------------------------*/

CEFAU3API int CefPostDataElement_IsReadOnly(struct _cef_post_data_element_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API void CefPostDataElement_SetToEmpty(struct _cef_post_data_element_t* self)
{
	self->set_to_empty(self);
}

CEFAU3API void CefPostDataElement_SetToFile(struct _cef_post_data_element_t* self,
	const wchar_t* fileName)
{
	self->set_to_file(self, cefstring_pwcs(fileName));
}

CEFAU3API void CefPostDataElement_SetToBytes(struct _cef_post_data_element_t* self,
	size_t size,
	const void* bytes)
{
	self->set_to_bytes(self, size, bytes);
}

CEFAU3API cef_postdataelement_type_t CefPostDataElement_GetType(
	struct _cef_post_data_element_t* self)
{
	return self->get_type(self);
}

CEFAU3API cef_string_userfree_t CefPostDataElement_GetFile(
	struct _cef_post_data_element_t* self)
{
	return self->get_file(self);
}

CEFAU3API size_t CefPostDataElement_GetBytesCount(struct _cef_post_data_element_t* self)
{
	return self->get_bytes_count(self);
}

CEFAU3API size_t CefPostDataElement_GetBytes(struct _cef_post_data_element_t* self,
	size_t size,
	void* bytes)
{
	return self->get_bytes(self, size, bytes);
}

CEFAU3API cef_post_data_element_t* CefPostDataElement_Create()
{
	return cef_post_data_element_create();
}