#include "../cefau3.h"

#include "include/capi/cef_callback_capi.h"

/* CefCallback
--------------------------------------------------*/

CEFAU3API void CefCallback_Continue(struct _cef_callback_t* self)
{
	self->cont(self);
}

CEFAU3API void CefCallback_Cancel(struct _cef_callback_t* self)
{
	self->cancel(self);
}

/* CefCompletionCallback
--------------------------------------------------*/

CEFAU3API cef_completion_callback_t * CefCompletionCallback_Create()
{
	size_t sz = sizeof(cef_completion_callback_t);
	cef_completion_callback_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefCompletionCallback_OnComplete(struct _cef_completion_callback_t* self, void *p)
{
	self->on_complete = p;
}