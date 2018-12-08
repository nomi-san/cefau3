#include "../cefau3.h"

#include "include/capi/cef_values_capi.h"

/* CefValue
--------------------------------------------------*/

CEFAU3API int CefValue_IsValid(struct _cef_value_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefValue_IsOwned(struct _cef_value_t* self)
{
	return self->is_owned(self);
}

CEFAU3API int CefValue_IsReadOnly(struct _cef_value_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API int CefValue_IsSame(struct _cef_value_t* self,
	struct _cef_value_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefValue_IsEqual(struct _cef_value_t* self,
	struct _cef_value_t* that)
{
	return self->is_equal(self, that);
}

CEFAU3API struct _cef_value_t* CefValue_Copy(struct _cef_value_t* self)
{
	return self->copy(self);
}

CEFAU3API cef_value_type_t CefValue_GetType(struct _cef_value_t* self)
{
	return self->get_type(self);
}

CEFAU3API int CefValue_GetBool(struct _cef_value_t* self)
{
	return self->get_bool(self);
}

CEFAU3API int CefValue_GetInt(struct _cef_value_t* self)
{
	return self->get_int(self);
}

CEFAU3API double CefValue_GetDouble(struct _cef_value_t* self)
{
	return self->get_double(self);
}

CEFAU3API const wchar_t * CefValue_GetString(struct _cef_value_t* self)
{
	return self->get_string(self)->str;
}

CEFAU3API struct _cef_binary_value_t* CefValue_GetBinary(
	struct _cef_value_t* self)
{
	return self->get_binary(self);
}

CEFAU3API struct _cef_dictionary_value_t* CefValue_GetDictionary(
	struct _cef_value_t* self)
{
	return self->get_dictionary(self);
}

CEFAU3API struct _cef_list_value_t* CefValue_GetList(struct _cef_value_t* self)
{
	return self->get_list(self);
}

CEFAU3API int CefValue_SetNull(struct _cef_value_t* self)
{
	return self->set_null(self);
}

CEFAU3API int CefValue_SetBool(struct _cef_value_t* self, int value)
{
	return self->set_bool(self, value);
}

CEFAU3API int CefValue_SetInt(struct _cef_value_t* self, int value)
{
	return self->set_int(self, value);
}

CEFAU3API int CefValue_SetDouble(struct _cef_value_t* self, double value)
{
	return self->set_double(self, value);
}

CEFAU3API int CefValue_SetString(struct _cef_value_t* self,
	const wchar_t* value)
{
	return self->set_string(self, cefstring_pwcs(value));
}

CEFAU3API int CefValue_SetBinary(struct _cef_value_t* self,
	struct _cef_binary_value_t* value)
{
	return self->set_binary(self, value);
}

CEFAU3API int CefValue_SetDictionary(struct _cef_value_t* self,
	struct _cef_dictionary_value_t* value)
{
	return self->set_dictionary(self, value);
}

CEFAU3API int CefValue_SetList(struct _cef_value_t* self,
	struct _cef_list_value_t* value)
{
	return self->set_list(self, value);
}

CEFAU3API cef_value_t * CefValue_Create()
{
	return cef_value_create();
}

/* CefBinaryValue
--------------------------------------------------*/

CEFAU3API int CefBinaryValue_IsValid(struct _cef_binary_value_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefBinaryValue_IsOwned(struct _cef_binary_value_t* self)
{
	return self->is_owned(self);
}

CEFAU3API int CefBinaryValue_IsSame(struct _cef_binary_value_t* self,
	struct _cef_binary_value_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefBinaryValue_IsEqual(struct _cef_binary_value_t* self,
	struct _cef_binary_value_t* that)
{
	return self->is_equal(self, that);
}

CEFAU3API struct _cef_binary_value_t* CefBinaryValue_Copy(
	struct _cef_binary_value_t* self)
{
	return self->copy(self);
}

CEFAU3API size_t CefBinaryValue_GetSize(struct _cef_binary_value_t* self)
{
	return self->get_size(self);
}

CEFAU3API size_t CefBinaryValue_GetData(struct _cef_binary_value_t* self,
	void* buffer,
	size_t buffer_size,
	size_t data_offset)
{
	return self->get_data(
		self,
		buffer,
		buffer_size,
		data_offset
	);
}

CEFAU3API cef_binary_value_t * CefBinaryValue_Create(const void* data,
	size_t data_size)
{
	return cef_binary_value_create(data, data_size);
}

CEFAU3API int CefDictionaryValue_IsValid(struct _cef_dictionary_value_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefDictionaryValue_IsOwned(struct _cef_dictionary_value_t* self)
{
	return self->is_owned(self);
}

CEFAU3API int CefDictionaryValue_IsReadOnly(struct _cef_dictionary_value_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API int CefDictionaryValue_IsSame(struct _cef_dictionary_value_t* self,
	struct _cef_dictionary_value_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefDictionaryValue_IsEqual(struct _cef_dictionary_value_t* self,
	struct _cef_dictionary_value_t* that)
{
	return self->is_equal(self, that);
}

CEFAU3API cef_dictionary_value_t* CefDictionaryValue_Copy(
	struct _cef_dictionary_value_t* self,
	int exclude_empty_children)
{
	return self->copy(self, exclude_empty_children);
}

CEFAU3API size_t CefDictionaryValue_GetSize(struct _cef_dictionary_value_t* self)
{
	return self->get_size(self);
}

CEFAU3API int CefDictionaryValue_Clear(struct _cef_dictionary_value_t* self)
{
	return self->clear(self);
}

CEFAU3API int CefDictionaryValue_HasKey(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->has_key(self, cefstring_pwcs(key));
}

CEFAU3API int CefDictionaryValue_GetKeys(struct _cef_dictionary_value_t* self,
	cef_string_list_t keys)
{
	return self->get_keys(self, keys);
}

CEFAU3API int CefDictionaryValue_Remove(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->remove(self, cefstring_pwcs(key));
}

CEFAU3API cef_value_type_t CefDictionaryValue_GetType(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_type(self, cefstring_pwcs(key));
}

CEFAU3API cef_value_t* CefDictionaryValue_GetValue(
	struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_value(self, cefstring_pwcs(key));
}

CEFAU3API int CefDictionaryValue_GetBool(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_bool(self, cefstring_pwcs(key));
}

CEFAU3API int CefDictionaryValue_GetInt(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_int(self, cefstring_pwcs(key));
}

CEFAU3API double CefDictionaryValue_GetDouble(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_double(self, cefstring_pwcs(key));
}

CEFAU3API cef_string_userfree_t CefDictionaryValue_GetString(
	struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_string(self, cefstring_pwcs(key));
}

CEFAU3API cef_binary_value_t* CefDictionaryValue_GetBinary(
	struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_binary(self, cefstring_pwcs(key));
}

CEFAU3API cef_dictionary_value_t* CefDictionaryValue_GetDictionary(
	struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_dictionary(self, cefstring_pwcs(key));
}

CEFAU3API cef_list_value_t* CefDictionaryValue_GetList(
	struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->get_list(self, cefstring_pwcs(key));
}

CEFAU3API int CefDictionaryValue_SetValue(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	struct _cef_value_t* value)
{
	return self->set_value(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetNull(struct _cef_dictionary_value_t* self,
	const wchar_t* key)
{
	return self->set_null(self, cefstring_pwcs(key));
}

CEFAU3API int CefDictionaryValue_SetBool(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	int value)
{
	return self->set_bool(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetInt(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	int value)
{
	return self->set_int(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetDouble(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	double value)
{
	return self->set_double(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetString(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	const cef_string_t* value)
{
	return self->set_string(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetBinary(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	struct _cef_binary_value_t* value)
{
	return self->set_binary(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetDictionary(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	struct _cef_dictionary_value_t* value)
{
	return self->set_dictionary(self, cefstring_pwcs(key), value);
}

CEFAU3API int CefDictionaryValue_SetList(struct _cef_dictionary_value_t* self,
	const wchar_t* key,
	struct _cef_list_value_t* value)
{
	return self->set_list(self, cefstring_pwcs(key), value);
}

CEFAU3API cef_dictionary_value_t * CefDictionaryValue_Create()
{
	return cef_dictionary_value_create();
}

/* CefListValue
--------------------------------------------------*/

CEFAU3API int CefListValue_IsValid(struct _cef_list_value_t* self)
{
	return self->is_valid(self);
}

CEFAU3API int CefListValue_IsOwned(struct _cef_list_value_t* self)
{
	return self->is_owned(self);
}

CEFAU3API int CefListValue_IsReadOnly(struct _cef_list_value_t* self)
{
	return self->is_read_only(self);
}

CEFAU3API int CefListValue_IsSame(struct _cef_list_value_t* self,
	struct _cef_list_value_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefListValue_IsEqual(struct _cef_list_value_t* self,
	struct _cef_list_value_t* that)
{
	return self->is_equal(self, that);
}

CEFAU3API struct _cef_list_value_t* CefListValue_Copy(struct _cef_list_value_t* self)
{
	return self->copy(self);
}

CEFAU3API int CefListValue_SetSize(struct _cef_list_value_t* self, size_t size)
{
	return self->set_size(self, size);
}

CEFAU3API size_t CefListValue_GetSize(struct _cef_list_value_t* self)
{
	return self->get_size(self);
}

CEFAU3API int CefListValue_Clear(struct _cef_list_value_t* self)
{
	return self->clear(self);
}

CEFAU3API int CefListValue_Remove(struct _cef_list_value_t* self, size_t index)
{
	return self->remove(self, index);
}

CEFAU3API cef_value_type_t CefListValue_GetType(struct _cef_list_value_t* self,
	size_t index)
{
	return self->get_type(self, index);
}

CEFAU3API struct _cef_value_t* CefListValue_GetValue(struct _cef_list_value_t* self,
	size_t index)
{
	return self->get_value(self, index);
}

CEFAU3API int CefListValue_GetBool(struct _cef_list_value_t* self, size_t index)
{
	return self->get_bool(self, index);
}

CEFAU3API int CefListValue_GetInt(struct _cef_list_value_t* self, size_t index)
{
	return self->get_int(self, index);
}

CEFAU3API double CefListValue_GetDouble(struct _cef_list_value_t* self,
	size_t index)
{
	return self->get_double(self, index);
}

CEFAU3API const wchar_t *	CefListValue_GetString(struct _cef_list_value_t* self, size_t index)
{
	return self->get_string(self, index)->str;
}

CEFAU3API struct _cef_binary_value_t * CefListValue_GetBinary(struct _cef_list_value_t* self, size_t index)
{
	return self->get_binary(self, index);
}

CEFAU3API struct _cef_dictionary_value_t* CefListValue_GetDictionary(
	struct _cef_list_value_t* self,
	size_t index)
{
	return self->get_dictionary(self, index);
}

CEFAU3API struct _cef_list_value_t *  	CefListValue_GetList(struct _cef_list_value_t* self, size_t index)
{
	return self->get_list(self, index);
}

CEFAU3API int CefListValue_SetValue(struct _cef_list_value_t* self,
	size_t index,
	struct _cef_value_t* value)
{
	return self->set_value(self, index, value);
}

CEFAU3API int CefListValue_SetNull(struct _cef_list_value_t* self, size_t index)
{
	return self->set_null(self, index);
}

CEFAU3API int CefListValue_SetBool(struct _cef_list_value_t* self,
	size_t index,
	int value)
{
	return self->set_bool(self, index, value);
}

CEFAU3API int CefListValue_SetInt(struct _cef_list_value_t* self,
	size_t index,
	int value)
{
	return self->set_int(self, index, value);
}

CEFAU3API int CefListValue_SetDouble(struct _cef_list_value_t* self,
	size_t index,
	double value)
{
	return self->set_double(self, index, value);
}

CEFAU3API int CefListValue_SetString(struct _cef_list_value_t* self,
	size_t index,
	const wchar_t* value)
{
	return self->set_string(self, index, cefstring_pwcs(value));
}

CEFAU3API int CefListValue_SetBinary(struct _cef_list_value_t* self,
	size_t index,
	struct _cef_binary_value_t* value)
{
	return self->set_binary(self, index, value);
}

CEFAU3API int CefListValue_SetDictionary(struct _cef_list_value_t* self,
	size_t index,
	struct _cef_dictionary_value_t* value)
{
	return self->set_dictionary(self, index, value);
}

CEFAU3API int CefListValue_SetList(struct _cef_list_value_t* self,
	size_t index,
	struct _cef_list_value_t* value)
{
	return self->set_list(self, index, value);
}