#include "inc.h"


//////////////////////////////////////////////
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

void WINAPI CefFrame_ExecuteJavaScript(CefFrame* frame, LPCWSTR url, LPCWSTR code)
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