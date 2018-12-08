#include "../cefau3.h"

#include "include/capi/cef_display_handler_capi.h"

#include "browser.h"
#include "frame.h"
#include "string.h"

/* CefDisplayHandler
--------------------------------------------------*/

typedef struct CefDisplayHandler {
	cef_display_handler_t self;
	char *OAC;
	char *OTC;
	char *OFUC;
	char *OFMC;
	char *OT;
	char *OSM;
	char *OCM;
} CefDisplayHandler;

static Au3Obj* CefDisplayHandler_obj;

static void (CEF_CALLBACK* CefDisplayHandler_OAC) (const char*,
	Au3Obj* browser,
	Au3Obj* frame,
	Au3Obj* url);

static void (CEF_CALLBACK* CefDisplayHandler_OTC) (const char*,
	Au3Obj* browser,
	Au3Obj* title);

static void (CEF_CALLBACK* CefDisplayHandler_OFUC) (const char*,
	Au3Obj* browser,
	Au3Obj* icon_urls);

static void (CEF_CALLBACK* CefDisplayHandler_OFMC) (const char*,
	Au3Obj* browser,
	int fullscreen);

static int (CEF_CALLBACK* CefDisplayHandler_OT) (const char*,
	Au3Obj* browser,
	Au3Obj* text);

static void (CEF_CALLBACK* CefDisplayHandler_OSM) (const char*,
	Au3Obj* browser,
	Au3Obj* value);

static int (CEF_CALLBACK* CefDisplayHandler_OCM) (const char*,
	Au3Obj* browser,
	Au3Obj* message,
	Au3Obj* source,
	int line);

EXPORT(void) CefDisplayHandler_Init(Au3Obj* obj, void* OAC, void* OTC, void* OFUC, void* OFMC, void* OT, void* OSM, void* OCM)
{
	CefDisplayHandler_obj = obj;

	CefDisplayHandler_OAC = OAC;
	CefDisplayHandler_OTC = OTC;
	CefDisplayHandler_OFUC = OFUC;
	CefDisplayHandler_OFMC = OFMC;
	CefDisplayHandler_OT = OT;
	CefDisplayHandler_OSM = OSM;
	CefDisplayHandler_OCM = OCM;
}

EXPORT(Au3Obj*) CefDisplayHandler_Create(CefDisplayHandler* p)
{
	if (!p) {
		p = alloc(sizeof(CefDisplayHandler));
		p->self.base.size = sizeof(CefDisplayHandler);
	}

	AutoitSetPointerProxy(CefDisplayHandler_obj, p);
	return Au3ObjClone(CefDisplayHandler_obj);
}

CefHandlerElement(CefDisplayHandler, on_address_change, OAC, void,
	CefBrowser* browser,
	CefFrame* frame,
	const CefString* url)
{
	CefDisplayHandler_OAC(
		self->OAC,
		CefBrowser_Create(browser),
		CefFrame_Create(frame),
		CefString_Create(url, nil)
	);
}

CefHandlerElement(CefDisplayHandler, on_title_change, OTC, void,
	CefBrowser* browser,
	const CefString* title)
{
	CefDisplayHandler_OTC(
		self->OTC,
		CefBrowser_Create(browser),
		CefString_Create(title, nil)
	);
}

CefHandlerElement(CefDisplayHandler, on_favicon_urlchange, OFUC, void,
	CefBrowser* browser,
	CefStringList icon_urls)
{
	CefDisplayHandler_OFUC(
		self->OFUC,
		CefBrowser_Create(browser),
		CefStringList_Create(icon_urls)
	);
}

CefHandlerElement(CefDisplayHandler, on_fullscreen_mode_change, OFMC, void,
	CefBrowser* browser,
	int fullscreen)
{
	CefDisplayHandler_OFMC(
		self->OFMC,
		CefBrowser_Create(browser),
		fullscreen
	);
}

CefHandlerElement(CefDisplayHandler, on_tooltip, OT, int,
	CefBrowser* browser,
	CefString* text)
{
	return CefDisplayHandler_OT(
		self->OT,
		CefBrowser_Create(browser),
		CefString_Create(text, nil)
	);
}

CefHandlerElement(CefDisplayHandler, on_status_message, OSM, void,
	CefBrowser* browser,
	const CefString* value)
{
	CefDisplayHandler_OSM(
		self->OSM,
		CefBrowser_Create(browser),
		CefString_Create(value, nil)
	);
}

CefHandlerElement(CefDisplayHandler, on_console_message, OCM, int,
	CefBrowser* browser,
	const CefString* message,
	const CefString* source,
	int line)
{
	return CefDisplayHandler_OCM(
		self->OCM,
		CefBrowser_Create(browser),
		CefString_Create(message, nil),
		CefString_Create(source, nil),
		line
	);
}