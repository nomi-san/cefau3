#include "../cefau3.h"

#include "include/internal/cef_types_win.h"

/* CefMainArgs
--------------------------------------------------*/

CEFAU3API cef_main_args_t * CefMainArgs_Create()
{
	size_t sz = sizeof(cef_main_args_t);
	cef_main_args_t *p = calloc(1, sz);
	p->instance = GetModuleHandleA(NULL);

	return p;
}

CEFAU3API void CefMainArgs_Set_instance(cef_main_args_t *self, HINSTANCE value)
{
	self->instance = value;
}

CEFAU3API HINSTANCE CefMainArgs_Get_instance(cef_main_args_t *self)
{
	return self->instance;
}

/* CefWindowInfo
--------------------------------------------------*/

CEFAU3API cef_window_info_t * CefWindowInfo_Create()
{
	size_t sz = sizeof(cef_window_info_t);
	cef_window_info_t *p = calloc(1, sz);
	return p;
}

CEFAU3API void CefWindowInfo_Set_window_name(cef_window_info_t *self, wchar_t *value)
{
	self->window_name = cefstring_wcs(value);
}

CEFAU3API wchar_t * CefWindowInfo_Get_window_name(cef_window_info_t *self)
{
	return self->window_name.str;
}

CEFAU3API void CefWindowInfo_Set_ex_style(cef_window_info_t *self, DWORD value)
{
	self->ex_style = value;
}

CEFAU3API DWORD CefWindowInfo_Get_ex_style(cef_window_info_t *self)
{
	return self->ex_style;
}

CEFAU3API void CefWindowInfo_Set_style(cef_window_info_t *self, DWORD value)
{
	self->style = value;
}

CEFAU3API DWORD CefWindowInfo_Get_style(cef_window_info_t *self)
{
	return self->style;
}

CEFAU3API void CefWindowInfo_Set_x(cef_window_info_t *self, int value)
{
	self->x = value;
}

CEFAU3API int CefWindowInfo_Get_x(cef_window_info_t *self)
{
	return self->x;
}

CEFAU3API void CefWindowInfo_Set_y(cef_window_info_t *self, int value)
{
	self->y = value;
}

CEFAU3API int CefWindowInfo_Get_y(cef_window_info_t *self)
{
	return self->y;
}

CEFAU3API void CefWindowInfo_Set_width(cef_window_info_t *self, int value)
{
	self->width = value;
}

CEFAU3API int CefWindowInfo_Get_width(cef_window_info_t *self)
{
	return self->width;
}

CEFAU3API void CefWindowInfo_Set_height(cef_window_info_t *self, int value)
{
	self->height = value;
}

CEFAU3API int CefWindowInfo_Get_height(cef_window_info_t *self)
{
	return self->height;
}

CEFAU3API void CefWindowInfo_Set_windowless_rendering_enabled(cef_window_info_t *self, int value)
{
	self->windowless_rendering_enabled = value;
}

CEFAU3API int CefWindowInfo_Get_windowless_rendering_enabled(cef_window_info_t *self)
{
	return self->windowless_rendering_enabled;
}

CEFAU3API void CefWindowInfo_Set_parent_window(cef_window_info_t *self, HWND value)
{
	self->parent_window = value;
}

CEFAU3API HWND CefWindowInfo_Get_parent_window(cef_window_info_t *self)
{
	return self->parent_window;
}

CEFAU3API void CefWindowInfo_Set_window(cef_window_info_t *self, HWND value)
{
	self->window = value;
}

CEFAU3API HWND CefWindowInfo_Get_window(cef_window_info_t *self)
{
	return self->window;
}

CEFAU3API void CefWindowInfo_Set_menu(cef_window_info_t *self, HMENU value)
{
	self->menu = value;
}

CEFAU3API HMENU CefWindowInfo_Get_menu(cef_window_info_t *self)
{
	return self->menu;
}