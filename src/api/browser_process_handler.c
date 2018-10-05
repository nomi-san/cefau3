#include "../cefau3.h"

#include "include/capi/cef_browser_process_handler_capi.h"

/* CefBrowserProcessHandler
--------------------------------------------------*/

typedef struct CefBrowserProcessHandler {
	cef_browser_process_handler_t self;
	const char *OCI;
	const char *OBCPL;
	const char *ORPTC;
	const char *GPH;
	const char *OSMPW;
} CefBrowserProcessHandler;

CefHandlerCreate(CefBrowserProcessHandler);

CefHandlerSetGetFunc(CefBrowserProcessHandler, OCI);
CefHandlerSetGetFunc(CefBrowserProcessHandler, OBCPL);
CefHandlerSetGetFunc(CefBrowserProcessHandler, ORPTC);
CefHandlerSetGetFunc(CefBrowserProcessHandler, GPH);
CefHandlerSetGetFunc(CefBrowserProcessHandler, OSMPW);


CEFAU3API void  CefBrowserProcessHandler_OnContextInitialized(CefBrowserProcessHandler *self, void* ptr)
{
	self->self.on_context_initialized = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnBeforeChildProcessLaunch(CefBrowserProcessHandler *self, void* ptr)
{
	self->self.on_before_child_process_launch = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnRenderProcessThreadCreated(CefBrowserProcessHandler *self, void* ptr)
{
	self->self.on_render_process_thread_created = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_GetPrintHandler(CefBrowserProcessHandler *self, void* ptr)
{
	self->self.get_print_handler = ptr;
}

CEFAU3API void  CefBrowserProcessHandler_OnScheduleMessagePumpWork(CefBrowserProcessHandler *self, void* ptr)
{
	self->self.on_schedule_message_pump_work = ptr;
}