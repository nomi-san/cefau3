#ifndef CEFAU3_BROWSER_H
#define CEFAU3_BROWSER_H
#pragma once

#include "../cefau3.h"
#include "include/capi/cef_browser_capi.h"

/* CefBrowser
--------------------------------------------------*/

typedef cef_browser_t CefBrowser;

EXPORT(Au3Obj*) CefBrowser_Create(CefBrowser* p);

/* CefBrowserHost
--------------------------------------------------*/

typedef cef_browser_host_t CefBrowserHost;

EXPORT(Au3Obj*) CefBrowserHost_Create(CefBrowserHost* p);

#endif