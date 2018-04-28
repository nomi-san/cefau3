#include "inc.h"


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