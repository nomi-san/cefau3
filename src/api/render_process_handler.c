#include "../cefau3.h"

#include "include/capi/cef_render_process_handler_capi.h"

/* CefRenderProcessHandler
--------------------------------------------------*/

typedef struct CefRenderProcessHandler {
	cef_render_process_handler_t self;
	const char *ORTC;
	const char *OWKI;
	const char *OBC;
	const char *OBD;
	const char *GLH;
	const char *OBN;
	const char *OCC;
	const char *OCR;
	const char *OUE;
	const char *OFNC;
	const char *OPMR;
} CefRenderProcessHandler;

CefHandlerCreate(CefRenderProcessHandler);

CefHandlerFunc(CefRenderProcessHandler, on_render_thread_created, ORTC);
CefHandlerFunc(CefRenderProcessHandler, on_web_kit_initialized, OWKI);
CefHandlerFunc(CefRenderProcessHandler, on_browser_created, OBC);
CefHandlerFunc(CefRenderProcessHandler, on_browser_destroyed, OBD);
CefHandlerFunc(CefRenderProcessHandler, get_load_handler, GLH);
CefHandlerFunc(CefRenderProcessHandler, on_context_created, OCC);
CefHandlerFunc(CefRenderProcessHandler, on_context_released, OCR);
CefHandlerFunc(CefRenderProcessHandler, on_uncaught_exception, OUE);
CefHandlerFunc(CefRenderProcessHandler, on_focused_node_changed, OFNC);
CefHandlerFunc(CefRenderProcessHandler, on_process_message_received, OPMR);