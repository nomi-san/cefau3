#include "inc.h"

/////////////////////////////////////////
LPCWSTR WINAPI CefContextMenuParam_GetFrameUrl(CefContextMenuParams* menuparam)
{
	return menuparam->GetFrameUrl().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetLinkUrl(CefContextMenuParams* menuparam)
{
	return menuparam->GetLinkUrl().ToWString().c_str();
}

int WINAPI CefContextMenuParam_GetXCoord(CefContextMenuParams* menuparam)
{
	return menuparam->GetXCoord();
}

int WINAPI CefContextMenuParam_GetYCoord(CefContextMenuParams* menuparam)
{
	return menuparam->GetYCoord();
}

/*
LPCWSTR WINAPI CefContextMenuParam_GetTitleText(CefContextMenuParams* menuparam)
{
	return menuparam->GetTitleText().ToWString().c_str();
}
*/

LPCWSTR WINAPI CefContextMenuParam_GetPageUrl(CefContextMenuParams* menuparam)
{
	return menuparam->GetPageUrl().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetSourceUrl(CefContextMenuParams* menuparam)
{
	return menuparam->GetSourceUrl().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetUnfilteredLinkUrl(CefContextMenuParams* menuparam)
{
	return menuparam->GetUnfilteredLinkUrl().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetSelectionText(CefContextMenuParams* menuparam)
{
	return menuparam->GetSelectionText().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetMisspelledWord(CefContextMenuParams* menuparam)
{
	return menuparam->GetMisspelledWord().ToWString().c_str();
}

LPCWSTR WINAPI CefContextMenuParam_GetFrameCharset(CefContextMenuParams* menuparam)
{
	return menuparam->GetFrameCharset().ToWString().c_str();
}

bool WINAPI CefContextMenuParam_HasImageContents(CefContextMenuParams* menuparam)
{
	return menuparam->HasImageContents();
}

bool WINAPI CefContextMenuParam_IsCustomMenu(CefContextMenuParams* menuparam)
{
	return menuparam->IsCustomMenu();
}

bool WINAPI CefContextMenuParam_IsEditable(CefContextMenuParams* menuparam)
{
	return menuparam->IsEditable();
}

bool WINAPI CefContextMenuParam_IsSpellCheckEnabled(CefContextMenuParams* menuparam)
{
	return menuparam->IsSpellCheckEnabled();
}

bool WINAPI CefContextMenuParam_IsPepperMenu(CefContextMenuParams* menuparam)
{
	return menuparam->IsPepperMenu();
}
////////////////////////////////////

bool WINAPI CefMenuModel_AddCheckItem(CefMenuModel* model, int cmdID, LPCWSTR string)
{
	return model->AddCheckItem(cmdID, string);
}

bool WINAPI CefMenuModel_AddItem(CefMenuModel* model, int cmdID, LPCWSTR string)
{
	return model->AddItem(cmdID, string);
}

bool WINAPI CefMenuModel_AddRadioItem(CefMenuModel* model, int cmdID, LPCWSTR string, int groudID)
{
	return model->AddRadioItem(cmdID, string, groudID);
}

bool WINAPI CefMenuModel_AddSeparator(CefMenuModel* model)
{
	return model->AddSeparator();
}

bool WINAPI CefMenuModel_AddSubMenu(CefMenuModel* model, int cmdID, LPCWSTR string)
{
	return model->AddSubMenu(cmdID, string);
}

bool WINAPI CefMenuModel_Clear(CefMenuModel* model)
{
	return model->Clear();
}

bool WINAPI CefMenuModel_IsChecked(CefMenuModel* model, int cmdID)
{
	return model->IsChecked(cmdID);
}

bool WINAPI CefMenuModel_IsCheckedAt(CefMenuModel* model, int index)
{
	return model->IsCheckedAt(index);
}

bool WINAPI CefMenuModel_IsEnabled(CefMenuModel* model, int cmdID)
{
	return model->IsEnabled(cmdID);
}

bool WINAPI CefMenuModel_IsEnabledAt(CefMenuModel* model, int index)
{
	return model->IsEnabledAt(index);
}

/*
bool WINAPI CefMenuModel_IsSubMenu(CefMenuModel* model)
{
	return model->IsSubMenu();
}
*/

bool WINAPI CefMenuModel_IsVisible(CefMenuModel* model, int cmdID)
{
	return model->IsVisible(cmdID);
}

bool WINAPI CefMenuModel_IsVisibleAt(CefMenuModel* model, int index)
{
	return model->IsVisibleAt(index);
}

int WINAPI CefMenuModel_GetCommandIdAt(CefMenuModel* model, int index)
{
	return model->GetCommandIdAt(index);
}

int WINAPI CefMenuModel_GetCount(CefMenuModel* model)
{
	return model->GetCount();
}

int WINAPI CefMenuModel_GetGroupId(CefMenuModel* model, int cmdID)
{
	return model->GetGroupId(cmdID);
}

int WINAPI CefMenuModel_GetGroupIdAt(CefMenuModel* model, int index)
{
	return model->GetGroupIdAt(index);
}

int WINAPI CefMenuModel_GetIndexOf(CefMenuModel* model, int cmdID)
{
	return model->GetIndexOf(cmdID);
}

LPCWSTR WINAPI CefMenuModel_GetLabel(CefMenuModel* model, int cmdID)
{
	return model->GetLabel(cmdID).ToWString().c_str();
}

LPCWSTR WINAPI CefMenuModel_GetLabelAt(CefMenuModel* model, int index)
{
	return model->GetLabelAt(index).ToWString().c_str();
}

CefMenuModel* WINAPI CefMenuModel_GetSubMenu(CefMenuModel* model, int cmdID)
{
	return model->GetSubMenu(cmdID);
}

CefMenuModel* WINAPI CefMenuModel_GetSubMenuAt(CefMenuModel* model, int index)
{
	return model->GetSubMenuAt(index);
}

bool WINAPI CefMenuModel_SetChecked(CefMenuModel* model, int cmdID, bool check)
{
	return model->SetChecked(cmdID, check);
}

bool WINAPI CefMenuModel_SetCheckedAt(CefMenuModel* model, int index, bool check)
{
	return model->SetCheckedAt(index, check);
}

bool WINAPI CefMenuModel_SetCommandIdAt(CefMenuModel* model, int index, int cmdID)
{
	return model->SetCommandIdAt(index, cmdID);
}

bool WINAPI CefMenuModel_SetEnabled(CefMenuModel* model, int cmdID, bool enable)
{
	return model->SetEnabled(cmdID, enable);
}

bool WINAPI CefMenuModel_SetEnabledAt(CefMenuModel* model, int index, bool enable)
{
	return model->SetEnabledAt(index, enable);
}

bool WINAPI CefMenuModel_SetGroupId(CefMenuModel* model, int cmdID, int groudID)
{
	return model->SetGroupId(cmdID, groudID);
}

bool WINAPI CefMenuModel_SetGroupIdAt(CefMenuModel* model, int index, int groudID)
{
	return model->SetGroupIdAt(index, groudID);
}

bool WINAPI CefMenuModel_SetLabel(CefMenuModel* model, int cmdID, LPCWSTR label)
{
	return model->SetLabel(cmdID, label);
}

bool WINAPI CefMenuModel_SetLabelAt(CefMenuModel* model, int index, LPCWSTR label)
{
	return model->SetLabelAt(index, label);
}

bool WINAPI CefMenuModel_SetVisible(CefMenuModel* model, int cmdID, bool visible)
{
	return model->SetVisible(cmdID, visible);
}

bool WINAPI CefMenuModel_SetVisibleAt(CefMenuModel* model, int index, bool visible)
{
	return model->SetVisibleAt(index, visible);
}