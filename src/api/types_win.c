#include "types_win.h"

/* CefMainArgs
--------------------------------------------------*/

static Au3Obj* CefMainArgs_obj;

EXPORT(void) CefMainArgs_Init(Au3Obj *obj)
{
	CefMainArgs_obj = obj;
}

EXPORT(Au3Obj*) CefMainArgs_Create(CefMainArgs *p)
{
	if (!p) {
		p = alloc(sizeof(CefMainArgs));
		p->instance = GetModuleHandleA((const char*)0);
	}

	AutoitSetPointerProxy(CefMainArgs_obj, p);
	return Au3ObjClone(CefMainArgs_obj);
}

EXPORT(void) CefMainArgs_Set_instance(cef_main_args_t *self, HINSTANCE value)
{
	self->instance = value;
}

EXPORT(HINSTANCE) CefMainArgs_Get_instance(cef_main_args_t *self)
{
	return self->instance;
}

/* CefWindowInfo
--------------------------------------------------*/

static Au3Obj* CefWindowInfo_obj;

EXPORT(void) CefWindowInfo_Init(Au3Obj *obj)
{
	CefWindowInfo_obj = obj;
}

EXPORT(Au3Obj*) CefWindowInfo_Create(CefWindowInfo *p)
{
	if (!p)
		p = alloc(sizeof(CefWindowInfo));

	AutoitSetPointerProxy(CefWindowInfo_obj, p);
	return Au3ObjClone(CefWindowInfo_obj);
}

// $winInfo.pos($x, $y, $width, $height)

EXPORT(void) CefWindowInfo_pos(cef_window_info_t *self, int x, int y, int with, int height)
{
	self->x = x;
	self->y = y;
	self->width = with;
	self->height = height;
}

//=====//

EXPORT(void) CefWindowInfo_Set_window_name(cef_window_info_t *self, wchar_t *value)
{
	self->window_name = cefstring_wcs(value);
}

EXPORT(wchar_t *) CefWindowInfo_Get_window_name(cef_window_info_t *self)
{
	return self->window_name.str;
}

EXPORT(void) CefWindowInfo_Set_ex_style(cef_window_info_t *self, DWORD value)
{
	self->ex_style = value;
}

EXPORT(DWORD) CefWindowInfo_Get_ex_style(cef_window_info_t *self)
{
	return self->ex_style;
}

EXPORT(void) CefWindowInfo_Set_style(cef_window_info_t *self, DWORD value)
{
	self->style = value;
}

EXPORT(DWORD) CefWindowInfo_Get_style(cef_window_info_t *self)
{
	return self->style;
}

EXPORT(void) CefWindowInfo_Set_x(cef_window_info_t *self, int value)
{
	self->x = value;
}

EXPORT(int) CefWindowInfo_Get_x(cef_window_info_t *self)
{
	return self->x;
}

EXPORT(void) CefWindowInfo_Set_y(cef_window_info_t *self, int value)
{
	self->y = value;
}

EXPORT(int) CefWindowInfo_Get_y(cef_window_info_t *self)
{
	return self->y;
}

EXPORT(void) CefWindowInfo_Set_width(cef_window_info_t *self, int value)
{
	self->width = value;
}

EXPORT(int) CefWindowInfo_Get_width(cef_window_info_t *self)
{
	return self->width;
}

EXPORT(void) CefWindowInfo_Set_height(cef_window_info_t *self, int value)
{
	self->height = value;
}

EXPORT(int) CefWindowInfo_Get_height(cef_window_info_t *self)
{
	return self->height;
}

EXPORT(void) CefWindowInfo_Set_windowless_rendering_enabled(cef_window_info_t *self, int value)
{
	self->windowless_rendering_enabled = value;
}

EXPORT(int) CefWindowInfo_Get_windowless_rendering_enabled(cef_window_info_t *self)
{
	return self->windowless_rendering_enabled;
}

EXPORT(void) CefWindowInfo_Set_parent_window(cef_window_info_t *self, HWND value)
{
	self->parent_window = value;
}

EXPORT(HWND) CefWindowInfo_Get_parent_window(cef_window_info_t *self)
{
	return self->parent_window;
}

EXPORT(void) CefWindowInfo_Set_window(cef_window_info_t *self, HWND value)
{
	self->window = value;
}

EXPORT(HWND) CefWindowInfo_Get_window(cef_window_info_t *self)
{
	return self->window;
}

EXPORT(void) CefWindowInfo_Set_menu(cef_window_info_t *self, HMENU value)
{
	self->menu = value;
}

EXPORT(HMENU) CefWindowInfo_Get_menu(cef_window_info_t *self)
{
	return self->menu;
}