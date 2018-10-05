#include "../cefau3.h"

#include "include/capi/cef_app_capi.h"

/* CefApp
--------------------------------------------------*/

typedef struct CefApp {
	cef_app_t self;
	const char *OBCLP;
	const char *ORCS;
	const char *GRBH;
	const char *GBPH;
	const char *GRPH;
} CefApp;

CefHandlerCreate(CefApp);

CefHandlerFunc(CefApp, on_before_command_line_processing, OBCLP);
CefHandlerFunc(CefApp, on_register_custom_schemes, ORCS);
CefHandlerFunc(CefApp, get_resource_bundle_handler, GRBH);
CefHandlerFunc(CefApp, get_browser_process_handler, GBPH);
CefHandlerFunc(CefApp, get_render_process_handler, GRPH);

/////////////////////////////////////////////

CEFAU3API int CefExecuteProcess(const struct _cef_main_args_t* args, cef_app_t* application)
{
	return cef_execute_process(
		args,
		application,
		NULL
	);
}

CEFAU3API int CefInitialize(const struct _cef_main_args_t* args,
	const struct _cef_settings_t* settings,
	cef_app_t* application)
{
	return cef_initialize(
		args,
		settings,
		application,
		NULL
	);
}

CEFAU3API void CefShutdown()
{
	cef_shutdown();
}

CEFAU3API void CefDoMessageLoopWork()
{
	cef_do_message_loop_work();
}

CEFAU3API void CefRunMessageLoop()
{
	cef_run_message_loop();
}

CEFAU3API void CefQuitMessageLoop()
{
	cef_quit_message_loop();
}

CEFAU3API void CefSetOSModalLoop(int osModalLoop)
{
	cef_set_osmodal_loop(
		osModalLoop
	);
}

CEFAU3API void CefEnableHighDPISupport()
{
	cef_enable_highdpi_support();
}