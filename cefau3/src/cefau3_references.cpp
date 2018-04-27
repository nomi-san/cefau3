#include "inc.h"

/////////////////////////////////////////////////////
CefBrowser* WINAPI Cef_GetBrowser(Cefau3_Handler* handler)
{
	return handler->GetBrowser();
}
//////////////////////////////////////////////////////
#pragma region browser
bool WINAPI CefBrowser_CanGoBack(CefBrowser* browser)
{
	return browser->CanGoBack();
}
bool WINAPI CefBrowser_CanGoForward(CefBrowser* browser)
{
	return browser->CanGoForward();
}
void WINAPI CefBrowser_StopLoad(CefBrowser* browser)
{
	return browser->StopLoad();
}
void WINAPI CefBrowser_GoForward(CefBrowser* browser)
{
	browser->GoForward();
}
void WINAPI CefBrowser_GoBack(CefBrowser* browser)
{
	browser->GoBack();
}
bool WINAPI CefBrowser_IsLoading(CefBrowser* browser)
{
	return browser->IsLoading();
}
bool WINAPI CefBrowser_IsPopup(CefBrowser* browser)
{
	return browser->IsPopup();
}

bool WINAPI CefBrowser_HasDocument(CefBrowser* browser)
{
	return browser->HasDocument();
}

void WINAPI CefBrowser_Reload(CefBrowser* browser)
{
	browser->Reload();
}

int WINAPI CefBrowser_GetIdentifier(CefBrowser* browser)
{
	return browser->GetIdentifier();
}

void WINAPI CefBrowser_ReloadIgnoreCache(CefBrowser* browser)
{
	browser->ReloadIgnoreCache();
}

int WINAPI CefBrowser_GetFrameCount(CefBrowser* browser)
{
	return browser->GetFrameCount();
}

CefBrowserHost* WINAPI CefBrowser_GetHost(CefBrowser* browser)
{
	return browser->GetHost();
}

CefFrame* WINAPI CefBrowser_GetMainFrame(CefBrowser* browser)
{
	return browser->GetMainFrame();
}
#pragma endregion
//////////////////////////////////////////
#pragma region frame
void WINAPI CefFrame_Copy(CefFrame* frame)
{
	frame->Copy();
}

void WINAPI CefFrame_Cut(CefFrame* frame)
{
	frame->Cut();
}

void WINAPI CefFrame_Paste(CefFrame* frame)
{
	frame->Paste();
}

void WINAPI CefFrame_Delete(CefFrame* frame)
{
	frame->Delete();
}

void WINAPI CefFrame_SelectAll(CefFrame* frame)
{
	frame->SelectAll();
}

CefBrowser* WINAPI CefFrame_GetBrowser(CefFrame* frame)
{
	return frame->GetBrowser();
}

LPCWSTR WINAPI CefFrame_GetName(CefFrame* frame)
{
	return frame->GetName().ToWString().c_str();
}

int64 WINAPI CefFrame_GetIdentifier(CefFrame* frame)
{
	return frame->GetIdentifier();
}

CefFrame* WINAPI CefFrame_GetParent(CefFrame* frame)
{
	return frame->GetParent();
}

void WINAPI CefFrame_ExecuteJavaScript(CefFrame* frame, LPCWSTR url,LPCWSTR code)
{
	frame->ExecuteJavaScript(code, url, NULL);
}

LPCWSTR WINAPI CefFrame_GetText(CefFrame* frame)
{
	return frame->GetURL().ToWString().c_str();
}

void WINAPI CefFrame_ViewSource(CefFrame* frame)
{
	frame->ViewSource();
}

CefV8Context* WINAPI CefFrame_GetV8Context(CefFrame* frame)
{
	return frame->GetV8Context();
}

void WINAPI CefFrame_Undo(CefFrame* frame)
{
	frame->Undo();
}

void WINAPI CefFrame_Redo(CefFrame* frame)
{
	frame->Redo();
}

void WINAPI CefFrame_LoadURL(CefFrame* frame, LPCWSTR url)
{
	frame->LoadURL(url);
}
#pragma endregion
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

LPCWSTR WINAPI CefContextMenuParam_GetTitleText(CefContextMenuParams* menuparam)
{
	return menuparam->GetTitleText().ToWString().c_str();
}

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

bool WINAPI CefMenuModel_IsSubMenu(CefMenuModel* model)
{
	return model->IsSubMenu();
}

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
//////////////////////////////////////////////////////////////////////////////////
void WINAPI CefDragData_AddFile(CefDragData* dragdata, LPCWSTR path, LPCWSTR display_name)
{
	dragdata->AddFile(path, display_name);
}

LPCWSTR WINAPI CefDragData_GetFileName(CefDragData* dragdata)
{
	return dragdata->GetFileName().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetFragmentBaseURL(CefDragData* dragdata)
{
	return dragdata->GetFragmentBaseURL().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetFragmentHtml(CefDragData* dragdata)
{
	return dragdata->GetFragmentHtml().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetFragmentText(CefDragData* dragdata)
{
	return dragdata->GetFragmentText().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetLinkMetadata(CefDragData* dragdata)
{
	return dragdata->GetLinkMetadata().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetLinkTitle(CefDragData* dragdata)
{
	return dragdata->GetLinkTitle().ToWString().c_str();
}

LPCWSTR WINAPI CefDragData_GetLinkURL(CefDragData* dragdata)
{
	return dragdata->GetLinkURL().ToWString().c_str();
}
////////////////////////////////////////////////

bool WINAPI CefV8Context_Enter(CefV8Context* v8context)
{
	return v8context->Enter();
}

bool WINAPI CefV8Context_InContext(CefV8Context* v8context)
{
	return v8context->InContext();
}

CefBrowser* WINAPI CefV8Context_GetBrowser(CefV8Context* v8context)
{
	return v8context->GetBrowser();
}

CefV8Context* WINAPI CefV8Context_GetCurrentContext(CefV8Context* v8context)
{
	return v8context->GetCurrentContext();
}

CefV8Context* WINAPI CefV8Context_GetEnteredContext(CefV8Context* v8context)
{
	return v8context->GetEnteredContext();
}

CefFrame* WINAPI CefV8Context_GetFrame(CefV8Context* v8context)
{
	return v8context->GetFrame();
}

CefV8Value* WINAPI CefV8Context_GetGlobal(CefV8Context* v8context)
{
	return v8context->GetGlobal();
}
/////////////////////////////////////////////////////////////
CefV8Value* WINAPI CefV8Value_CreateBool(bool value)
{
	return CefV8Value::CreateBool(value);
}

CefV8Value* WINAPI CefV8Value_CreateInt(int value)
{
	return CefV8Value::CreateInt(value);
}

CefV8Value* WINAPI CefV8Value_CreateUInt(unsigned int value)
{
	return CefV8Value::CreateUInt(value);
}

CefV8Value* WINAPI CefV8Value_CreateString(LPCWSTR value)
{
	return CefV8Value::CreateString(value);
}

CefV8Value* WINAPI CefV8Value_CreateDouble(double value)
{
	return CefV8Value::CreateDouble(value);
}

CefV8Value* WINAPI CefV8Value_CreateDouble()
{
	return CefV8Value::CreateNull();
}

CefV8Value* WINAPI CefV8Value_CreateUndefined()
{
	return CefV8Value::CreateUndefined();
}

CefV8Value* WINAPI CefV8Value_CreateObject()
{
	return CefV8Value::CreateObject(NULL, NULL);
}

void WINAPI CefV8Value_SetValue(CefV8Value* value, LPCSTR key, CefV8Value* &val)
{
	value->SetValue(key, val, V8_PROPERTY_ATTRIBUTE_NONE);
}