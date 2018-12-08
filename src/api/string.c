#include "./string.h"

/* CefString
--------------------------------------------------*/

Au3Obj* CefString_obj;

EXPORT(void) CefString_Init(Au3Obj* obj)
{
	CefString_obj = obj;
}

EXPORT(Au3Obj*) CefString_Create(CefString* p, wchar_t *wcs)
{
	if (!p)
		p = cef_string_userfree_alloc();

	if (p && wcs)
		cef_string_from_wide(wcs, wcslen(wcs), p);

	AutoitSetPointerProxy(CefString_obj, p);
	return Au3ObjClone(CefString_obj);
}

EXPORT(void) CefString_Set(cef_string_t *self, const wchar_t* wcs)
{
	self->str = (wchar_t*)wcs;
	self->length = wcslen(wcs);
}

EXPORT(void) CefString_Free(cef_string_userfree_t s)
{
	if (s) {
		cef_string_userfree_free(s);
		s = NULL;
	}
}

EXPORT(wchar_t *) CefString_Read(cef_string_t *s)
{
	return s->str;
}

EXPORT(size_t) CefString_Len(cef_string_t *s)
{
	return s->length;
}

EXPORT(void) CefString_Clear(cef_string_t *s)
{
	cef_string_clear(s);
}

EXPORT(cef_string_t *) CefString_Copy(cef_string_t *s)
{
	cef_string_t *_s = cef_string_userfree_alloc();
	cef_string_utf16_set(s->str, s->length, s, 1);
	return _s;
}

/* CefStringList
--------------------------------------------------*/

Au3Obj* CefStringList_obj;

EXPORT(void) CefStringList_Init(Au3Obj* obj)
{
	CefStringList_obj = obj;
}

EXPORT(Au3Obj*) CefStringList_Create(CefStringList p)
{
	if (!p)
		p = cef_string_list_alloc();

	AutoitSetPointerProxy(CefStringList_obj, p);
	return Au3ObjClone(CefStringList_obj);
}

EXPORT(size_t) CefStringList_Size(cef_string_list_t list)
{
	return cef_string_list_size(list);
}

EXPORT(const wchar_t*) CefStringList_Read(cef_string_list_t list,
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

EXPORT(void) CefStringList_Append(cef_string_list_t list,
	const wchar_t* value)
{
	cef_string_list_append(
		list,
		cefstring_pwcs(value)
	);
}

EXPORT(void) CefStringList_Clear(cef_string_list_t list)
{
	cef_string_list_clear(list);
}

EXPORT(void) CefStringList_Free(cef_string_list_t list)
{
	cef_string_list_free(list);
}

EXPORT(cef_string_list_t) CefStringList_Copy(cef_string_list_t list)
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

/* CefStringMap
--------------------------------------------------*/

static Au3Obj* CefStringMap_obj;

EXPORT(void) CefStringMap_Init(Au3Obj *obj)
{
	CefStringMap_obj = obj;
}

EXPORT(Au3Obj*) CefStringMap_Create(CefStringMap *p)
{
	if (!p)
		p = cef_string_map_alloc();

	Au3Obj_SetPtr(CefStringMap_obj, p);
	return Au3Obj_Clone(CefStringMap_obj);
}

EXPORT(int) CefStringMap_Append(CefStringMap *map, const wchar_t *key, const wchar_t *value) {
	return cef_string_map_append(
		map,
		cefstring_pwcs(key),
		cefstring_pwcs(value)
	);
}

EXPORT(void) CefStringMap_Clear(CefStringMap *map)
{
	cef_string_map_clear(map);
}

EXPORT(const wchar_t*) CefStringMap_Find(CefStringMap *map, const wchar_t *key)
{
	cef_string_t value = { 0 };
	cef_string_map_find(
		map,
		cefstring_pwcs(key),
		&value
	);

	return value.str;
}

EXPORT(void) CefStringMap_Free(CefStringMap *map)
{
	if (map)
		cef_string_map_free(map);
}

EXPORT(const wchar_t*) CefStringMap_Key(CefStringMap *map, size_t index)
{
	cef_string_t key = { 0 };
	cef_string_map_key(
		map,
		index,
		&key
	);

	return key.str;
}

EXPORT(size_t) CefStringMap_Size(CefStringMap *map)
{
	return cef_string_map_size(map);
}