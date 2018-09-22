#include "../cefau3.h"

#include "include/capi/cef_render_process_handler_capi.h"

/* CefRenderProcessHandler
--------------------------------------------------*/

CEFAU3API cef_render_process_handler_t * CefRenderProcessHandler_Create()
{
	size_t sz = sizeof(cef_render_process_handler_t);
	cef_render_process_handler_t *p = calloc(1, sz);
	p->base.size = sz;

	return p;
}

CEFAU3API void CefRenderProcessHandler_OnRenderThreadCreated(cef_render_process_handler_t *self, void* ptr)
{
	self->on_render_thread_created = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnWebKitInitialized(cef_render_process_handler_t *self, void* ptr)
{
	self->on_web_kit_initialized = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnBrowserCreated(cef_render_process_handler_t *self, void* ptr)
{
	self->on_browser_created = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnBrowserDestroyed(cef_render_process_handler_t *self, void* ptr)
{
	self->on_browser_destroyed = ptr;
}

CEFAU3API void CefRenderProcessHandler_GetLoadHandler(cef_render_process_handler_t *self, void* ptr)
{
	self->get_load_handler = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnBeforeNavigation(cef_render_process_handler_t *self, void* ptr)
{
	self->on_before_navigation = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnContextCreated(cef_render_process_handler_t *self, void* ptr)
{
	self->on_context_created = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnContextReleased(cef_render_process_handler_t *self, void* ptr)
{
	self->on_context_released = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnUncaughtException(cef_render_process_handler_t *self, void* ptr)
{
	self->on_uncaught_exception = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnFocusedNodeChanged(cef_render_process_handler_t *self, void* ptr)
{
	self->on_focused_node_changed = ptr;
}

CEFAU3API void CefRenderProcessHandler_OnProcessMessageReceived(cef_render_process_handler_t *self, void* ptr)
{
	self->on_process_message_received = ptr;
}