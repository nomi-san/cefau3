#include "../cefau3.h"

#include "include/capi/cef_menu_model_delegate_capi.h"

/* CefMenuModelDelegate
--------------------------------------------------*/

CEFAU3API void CefMenuDelegate_ExecuteCommand(struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model,
	int command_id,
	cef_event_flags_t event_flags)
{
	self->execute_command(self, menu_model, command_id, event_flags);
}

CEFAU3API void CefMenuDelegate_MouseOutsideMenu(
	struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model,
	const cef_point_t* screen_point)
{
	self->mouse_outside_menu(self, menu_model, screen_point);
}

CEFAU3API void CefMenuDelegate_UnhandledOpenSubmenu(
	struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model,
	int is_rtl)
{
	self->unhandled_open_submenu(self, menu_model, is_rtl);
}

CEFAU3API void CefMenuDelegate_UnhandledCloseSubmenu(
	struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model,
	int is_rtl)
{
	self->unhandled_close_submenu(self, menu_model, is_rtl);
}

CEFAU3API void CefMenuDelegate_MenuWillShow(struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model)
{
	self->menu_will_show(self, menu_model);
}

CEFAU3API void CefMenuDelegate_MenuClosed(struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model)
{
	self->menu_closed(self, menu_model);
}

CEFAU3API int CefMenuDelegate_FormatLabel(struct _cef_menu_model_delegate_t* self,
	struct _cef_menu_model_t* menu_model,
	wchar_t* label)
{
	return self->format_label(self, menu_model, cefstring_pwcs(label));
}