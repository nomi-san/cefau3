#include "../cefau3.h"

#include "include/capi/cef_find_handler_capi.h"

/* CefFindHandler
--------------------------------------------------*/

CEFAU3API cef_find_handler_t * CefFindHandler_Create()
{
	size_t sz = sizeof(cef_find_handler_t);
	cef_find_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void CefFindHandler_OnFindResult(struct _cef_find_handler_t* self, void *ptr)
{
	self->on_find_result = ptr;
}