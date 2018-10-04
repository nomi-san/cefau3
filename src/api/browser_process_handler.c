#include "../cefau3.h"

#include "include/capi/cef_browser_process_handler_capi.h"

/* CefBrowserProcessHandler
--------------------------------------------------*/

CEFAU3API cef_browser_process_handler_t *  CefBrowserProcessHandler_Create()
{
	size_t sz = sizeof(cef_browser_process_handler_t);
	cef_browser_process_handler_t *p = calloc(1, sz);
	p->base.size = sz;
	return p;
}

CEFAU3API void  CefBrowserProcessHandler_OnContextInitialized(cef_browser_process_handler_t *self, void* ptr)
{
	self->on_context_initialized = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnBeforeChildProcessLaunch(cef_browser_process_handler_t *self, void* ptr)
{
	self->on_before_child_process_launch = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnRenderProcessThreadCreated(cef_browser_process_handler_t *self, void* ptr)
{
	self->on_render_process_thread_created = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_GetPrintHandler(cef_browser_process_handler_t *self, void* ptr)
{
	self->get_print_handler = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnScheduleMessagePumpWork(cef_browser_process_handler_t *self, void* ptr)
{
	self->on_schedule_message_pump_work = ptr;
}