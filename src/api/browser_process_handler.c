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

CefHandlerFunc(CefBrowserProcessHandler, on_context_initialized, OCI);
CefHandlerFunc(CefBrowserProcessHandler, on_before_child_process_launch, OBCPL);
CefHandlerFunc(CefBrowserProcessHandler, on_render_process_thread_created, ORPTC);
CefHandlerFunc(CefBrowserProcessHandler, get_print_handler, GPH);
CefHandlerFunc(CefBrowserProcessHandler, on_schedule_message_pump_work, OSMPW);