#include "../cefau3.h"

#include "include/capi/cef_app_capi.h"

CEFAU3API cef_app_t * CefApp_Create()
{
	size_t sz = sizeof(cef_app_t);
	cef_app_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefApp_OnBeforeCommandLineProcessing(cef_app_t *self, void* ptr)
{
	self->on_before_command_line_processing = ptr;
}

CEFAU3API void CefApp_OnRegisterCustomSchemes(cef_app_t *self, void* ptr)
{
	self->on_register_custom_schemes = ptr;
}

CEFAU3API void CefApp_GetResourceBundleHandler(cef_app_t *self, void* ptr)
{
	self->get_resource_bundle_handler = ptr;
}

CEFAU3API void CefApp_GetBrowserProcessHandler(cef_app_t *self, void* ptr)
{
	self->get_browser_process_handler = ptr;
}

CEFAU3API void CefApp_GetRenderProcessHandler(cef_app_t *self, void* ptr)
{
	self->get_render_process_handler = ptr;
}


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