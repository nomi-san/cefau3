#include "app.h"
#include "string.h"

/* CefApp
--------------------------------------------------*/

static Au3Obj* CefApp_obj;

static void(CEF_CALLBACK* CefApp_OBCLP)(char*,
	void* process_type,
	struct _cef_command_line_t* command_line);

static void(CEF_CALLBACK* CefApp_ORCS)(char*,
	struct _cef_scheme_registrar_t* registrar);

static void* (__stdcall* CefApp_GRBH)(char*);
static void* (__stdcall* CefApp_GBPH)(char*);
static void* (__stdcall* CefApp_GRPH)(char*);

EXPORT(void) CefApp_Init(Au3Obj *obj, void *OBCLP, void *ORCS, void *GRBH, void *GBPH, void *GRPH)
{
	CefApp_obj = obj;

	CefApp_GRBH = GRBH;
	CefApp_GBPH = GBPH;
	CefApp_GRPH = GRPH;
}

EXPORT(Au3Obj*) CefApp_Create(CefApp *p)
{
	if (!p) {
		p = alloc(sizeof(CefApp));
		p->self.base.size = sizeof(CefApp);
	}

	AutoitSetPointerProxy(CefApp_obj, p);
	return Au3ObjClone(CefApp_obj);
}

CefHandlerElement(CefApp, on_before_command_line_processing, OBCLP, void,
	void* process_type,
	struct _cef_command_line_t* command_line)
{
	CefApp_OBCLP(
		self->OBCLP,
		CefString_Create(process_type, NULL),
		command_line // fix
	);
}

CefHandlerElement(CefApp, on_register_custom_schemes, ORCS, void)
{

}

CefHandlerElement(CefApp, get_resource_bundle_handler, GRBH, void*)
{
	return CefApp_GRBH(self->GRBH);
}

CefHandlerElement(CefApp, get_browser_process_handler, GBPH, void*)
{
	return CefApp_GBPH(self->GBPH);
}

CefHandlerElement(CefApp, get_render_process_handler, GRPH, void*)
{
	return CefApp_GRPH(self->GRPH);
}

/////////////////////////////////////////////

EXPORT(int) CefExecuteProcess(const struct _cef_main_args_t* args, cef_app_t* application)
{
	return cef_execute_process(
		args,
		application,
		NULL
	);
}

EXPORT(int) CefInitialize(const struct _cef_main_args_t* args,
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

EXPORT(void) CefShutdown()
{
	cef_shutdown();
}

EXPORT(void) CefDoMessageLoopWork()
{
	cef_do_message_loop_work();
}

EXPORT(void) CefRunMessageLoop()
{
	cef_run_message_loop();
}

EXPORT(void) CefQuitMessageLoop()
{
	cef_quit_message_loop();
}

EXPORT(void) CefSetOSModalLoop(int osModalLoop)
{
	cef_set_osmodal_loop(
		osModalLoop
	);
}

EXPORT(void) CefEnableHighDPISupport()
{
	cef_enable_highdpi_support();
}