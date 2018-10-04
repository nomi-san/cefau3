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

CefCreation(CefRenderProcessHandler);

CefHandlerSetGetFunc(CefRenderProcessHandler, ORTC);
CefHandlerSetGetFunc(CefRenderProcessHandler, OWKI);
CefHandlerSetGetFunc(CefRenderProcessHandler, OBC);
CefHandlerSetGetFunc(CefRenderProcessHandler, OBD);
CefHandlerSetGetFunc(CefRenderProcessHandler, GLH);
CefHandlerSetGetFunc(CefRenderProcessHandler, OBN);
CefHandlerSetGetFunc(CefRenderProcessHandler, OCC);
CefHandlerSetGetFunc(CefRenderProcessHandler, OCR);
CefHandlerSetGetFunc(CefRenderProcessHandler, OUE);
CefHandlerSetGetFunc(CefRenderProcessHandler, OFNC);
CefHandlerSetGetFunc(CefRenderProcessHandler, OPMR);

CEFAU3API void CefRenderProcessHandler_OnRenderThreadCreated(CefRenderProcessHandler *self, void* p)
{
	self->self.on_render_thread_created = p;
}

CEFAU3API void CefRenderProcessHandler_OnWebKitInitialized(CefRenderProcessHandler *self, void* p)
{
	self->self.on_web_kit_initialized = p;
}

CEFAU3API void CefRenderProcessHandler_OnBrowserCreated(CefRenderProcessHandler *self, void* p)
{
	self->self.on_browser_created = p;
}

CEFAU3API void CefRenderProcessHandler_OnBrowserDestroyed(CefRenderProcessHandler *self, void* p)
{
	self->self.on_browser_destroyed = p;
}

CEFAU3API void CefRenderProcessHandler_GetLoadHandler(CefRenderProcessHandler *self, void* p)
{
	self->self.get_load_handler = p;
}

CEFAU3API void CefRenderProcessHandler_OnBeforeNavigation(CefRenderProcessHandler *self, void* p)
{
	self->self.on_before_navigation = p;
}

CEFAU3API void CefRenderProcessHandler_OnContextCreated(CefRenderProcessHandler *self, void* p)
{
	self->self.on_context_created = p;
}

CEFAU3API void CefRenderProcessHandler_OnContextReleased(CefRenderProcessHandler *self, void* p)
{
	self->self.on_context_released = p;
}

CEFAU3API void CefRenderProcessHandler_OnUncaughtException(CefRenderProcessHandler *self, void* p)
{
	self->self.on_uncaught_exception = p;
}

CEFAU3API void CefRenderProcessHandler_OnFocusedNodeChanged(CefRenderProcessHandler *self, void* p)
{
	self->self.on_focused_node_changed = p;
}

CEFAU3API void CefRenderProcessHandler_OnProcessMessageReceived(CefRenderProcessHandler *self, void* p)
{
	self->self.on_process_message_received = p;
}