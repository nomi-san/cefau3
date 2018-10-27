#include "../cefau3.h"
#include "include/capi/cef_life_span_handler_capi.h"
#include "browser.h"

/* CefLifeSpanHandler
--------------------------------------------------*/

typedef struct CefLifeSpanHandler {
	cef_life_span_handler_t self;
	char *OBP;
	char *OAC;
	char *DC;
	char *OBC;
} CefLifeSpanHandler;

Au3Obj* CefLifeSpanHandler_obj;
int	(CEF_CALLBACK* CefLifeSpanHandler_OBP) (const char*,
	Au3Obj* browser,
	Au3Obj* frame,
	Au3Obj* target_url,
	Au3Obj* target_frame_name,
	int target_disposition,
	int user_gesture,
	Au3Obj* popupFeatures,
	Au3Obj* windowInfo,
	Au3Obj** client,
	Au3Obj* settings,
	int* no_javascript_access
);
void (CEF_CALLBACK* CefLifeSpanHandler_OAC) (const char*, Au3Obj*);
int	(CEF_CALLBACK* CefLifeSpanHandler_DC) (const char*, Au3Obj*);
void (CEF_CALLBACK* CefLifeSpanHandler_OBC) (const char*, Au3Obj*);

EXPORT(void) CefLifeSpanHandler_Init(Au3Obj* obj, void* OBP, void* OAC, void* DC, void* OBC)
{ 
	CefLifeSpanHandler_obj = obj;

	CefLifeSpanHandler_OBP = OBP;
	CefLifeSpanHandler_OAC = OAC;
	CefLifeSpanHandler_DC = DC;
	CefLifeSpanHandler_OBC = OBC;
}

EXPORT(Au3Obj*) CefLifeSpanHandler_Create(CefLifeSpanHandler* p)
{
	if (!p) {
		p = alloc(sizeof(CefLifeSpanHandler));
		p->self.base.size = sizeof(CefLifeSpanHandler);
	}
	AutoitSetPointerProxy(CefLifeSpanHandler_obj, p);
	return Au3ObjClone(CefLifeSpanHandler_obj);
}

CefHandlerElement(CefLifeSpanHandler, on_before_popup, OBP, int, 
	struct _cef_browser_t* browser,
	struct _cef_frame_t* frame,
	const cef_string_t* target_url,
	const cef_string_t* target_frame_name,
	cef_window_open_disposition_t target_disposition,
	int user_gesture,
	const struct _cef_popup_features_t* popupFeatures,
	struct _cef_window_info_t* windowInfo,
	struct _cef_client_t** client,
	struct _cef_browser_settings_t* settings,
	int* no_javascript_access)
{
	return 0;
}

CefHandlerElement(CefLifeSpanHandler, on_after_created, OAC, void, CefBrowser* browser)
{
	CefLifeSpanHandler_OAC(self->OAC, CefBrowser_Create(browser));
}

CefHandlerElement(CefLifeSpanHandler, do_close, DC, int, CefBrowser* browser)
{
	return CefLifeSpanHandler_DC(self->DC, CefBrowser_Create(browser));
}

CefHandlerElement(CefLifeSpanHandler, on_before_close, OBC, void, CefBrowser* browser)
{
	CefLifeSpanHandler_OBC(self->OBC, CefBrowser_Create(browser));
}