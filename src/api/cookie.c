#include "../cefau3.h"

#include "include/capi/cef_cookie_capi.h"

/* CefCookieManager
--------------------------------------------------*/

CEFAU3API void CefCookieManager_SetSupportedSchemes(
	struct _cef_cookie_manager_t* self,
	cef_string_list_t schemes,
	struct _cef_completion_callback_t* callback)
{
	self->set_supported_schemes(self,
		schemes,
		callback
	);
}

CEFAU3API int CefCookieManager_VisitAllCookies(struct _cef_cookie_manager_t* self,
	struct _cef_cookie_visitor_t* visitor)
{
	return self->visit_all_cookies(self, visitor);
}

CEFAU3API int CefCookieManager_VisitUrlCookies(struct _cef_cookie_manager_t* self,
	const wchar_t* url,
	int includeHttpOnly,
	struct _cef_cookie_visitor_t* visitor)
{
	return self->visit_url_cookies(self,
		cefstring_pwcs(url),
		includeHttpOnly,
		visitor
	);
}

CEFAU3API int CefCookieManager_SetCookie(struct _cef_cookie_manager_t* self,
	const wchar_t* url,
	const struct _cef_cookie_t* cookie,
	struct _cef_set_cookie_callback_t* callback)
{
	return self->set_cookie(self,
		cefstring_pwcs(url),
		cookie,
		callback
	);
}

CEFAU3API int CefCookieManager_DeleteCookies(
	struct _cef_cookie_manager_t* self,
	const wchar_t* url,
	const wchar_t* cookie_name,
	struct _cef_delete_cookies_callback_t* callback)
{
	return self->delete_cookies(self,
		cefstring_pwcs(url),
		cefstring_pwcs(cookie_name),
		callback
	);
}

CEFAU3API int CefCookieManager_SetStoragePath(
	struct _cef_cookie_manager_t* self,
	const wchar_t* path,
	int persist_session_cookies,
	struct _cef_completion_callback_t* callback)
{
	return self->set_storage_path(
		self,
		cefstring_pwcs(path),
		persist_session_cookies,
		callback
	);
}

CEFAU3API int CefCookieManager_FlushStore(struct _cef_cookie_manager_t* self,
	struct _cef_completion_callback_t* callback)
{
	return self->flush_store(self, callback);
}

CEFAU3API cef_cookie_manager_t* CefCookieManager_GetGlobalManager(
	struct _cef_completion_callback_t* callback)
{
	return cef_cookie_manager_get_global_manager(callback);
}

CEFAU3API cef_cookie_manager_t* CefCookieManager_CreateManager(
	const wchar_t* path,
	int persist_session_cookies,
	struct _cef_completion_callback_t* callback)
{
	return cef_cookie_manager_create_manager(
		cefstring_pwcs(path),
		persist_session_cookies,
		callback
	);
}

/* CefCookieVisitor
--------------------------------------------------*/

CEFAU3API int CefCookieVisitor_Visit(struct _cef_cookie_visitor_t* self,
	const struct _cef_cookie_t* cookie,
	int count,
	int total,
	int* deleteCookie)
{
	return self->visit(self, cookie, count, total, deleteCookie);
}


/* CefSetCookieCallback
--------------------------------------------------*/

CEFAU3API cef_set_cookie_callback_t * CefSetCookieCallback_Create()
{
	size_t sz = sizeof(cef_set_cookie_callback_t);
	cef_set_cookie_callback_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefSetCookieCallback_OnComplete(cef_set_cookie_callback_t *self, void *p)
{
	self->on_complete = p;
}

/* CefDeleteCookiesCallback
--------------------------------------------------*/

CEFAU3API cef_delete_cookies_callback_t * CefDeleteCookiesCallback_Create()
{
	size_t sz = sizeof(cef_delete_cookies_callback_t);
	cef_delete_cookies_callback_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefDeleteCookiesCallback_OnComplete(cef_delete_cookies_callback_t *self, void *p)
{
	self->on_complete = p;
}