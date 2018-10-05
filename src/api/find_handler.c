#include "../cefau3.h"

#include "include/capi/cef_find_handler_capi.h"

/* CefFindHandler
--------------------------------------------------*/

typedef struct CefFindHandler {
	cef_find_handler_t self;
	const char *OFR;
} CefFindHandler;

CefHandlerCreate(CefFindHandler);

CefHandlerSetGetFunc(CefFindHandler, OFR);

CEFAU3API void CefFindHandler_OnFindResult(CefFindHandler* self, void *ptr)
{
	self->self.on_find_result = ptr;
}