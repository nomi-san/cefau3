#include "../cefau3.h"

#include "include/internal/cef_types.h"
#include "include/internal/cef_string.h"
#include "include/internal/cef_string_list.h"

/* CefString
--------------------------------------------------*/

CEFAU3API cef_string_t * CefString_Create(wchar_t *wcs)
{
	cef_string_t *p = cef_string_userfree_alloc();
	cef_string_from_wide(wcs, wcslen(wcs), p);
	return p;
}

CEFAU3API void CefString_Set(cef_string_t *self, const wchar_t* wcs)
{
	self->str = (wchar_t*)wcs;
	self->length = wcslen(wcs);
}

CEFAU3API void CefString_Free(cef_string_userfree_t s)
{
	if (s) {
		cef_string_userfree_free(s);
		s = NULL;
	}
}

CEFAU3API wchar_t * CefString_Read(cef_string_t *s)
{
	return s->str;
}

CEFAU3API size_t CefString_Len(cef_string_t *s)
{
	return s->length;
}

CEFAU3API void CefString_Clear(cef_string_t *s)
{
	cef_string_clear(s);
}

CEFAU3API cef_string_t * CefString_Copy(cef_string_t *s)
{
	cef_string_t *_s = cef_string_userfree_alloc();
	cef_string_utf16_set(s->str, s->length, s, 1);
	return _s;
}

/* CefStringList
--------------------------------------------------*/

CEFAU3API cef_string_list_t CefStringList_Create()
{
	return cef_string_list_alloc();
}

CEFAU3API size_t CefStringList_Size(cef_string_list_t list)
{
	return cef_string_list_size(list);
}

CEFAU3API const wchar_t* CefStringList_Read(cef_string_list_t list,
	size_t index)
{
	cef_string_t s = { 0 };
	cef_string_list_value(
		list,
		index,
		&s
	);
	const wchar_t* wcs = _wcsdup(s.str);
	return wcs;
}

CEFAU3API void CefStringList_Append(cef_string_list_t list,
	const wchar_t* value)
{
	cef_string_list_append(
		list,
		cefstring_pwcs(value)
	);
}

CEFAU3API void CefStringList_Clear(cef_string_list_t list)
{
	cef_string_list_clear(list);
}

CEFAU3API void CefStringList_Free(cef_string_list_t list)
{
	cef_string_list_free(list);
}

CEFAU3API cef_string_list_t CefStringList_Copy(cef_string_list_t list)
{
	return cef_string_list_copy(list);
}


///////////// local

cef_string_t cefstring_cs(const char *cs)
{
	cef_string_t s = { 0 };
	cef_string_from_utf8(
		cs, 
		strlen(cs), 
		&s
	);
	return s;
}

cef_string_t cefstring_wcs(const wchar_t *wcs)
{
	cef_string_t s = { 0 };
	cef_string_from_wide(
		wcs, 
		wcslen(wcs), 
		&s
	);
	return s;
}