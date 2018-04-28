#include "inc.h"
#include "cefau3_extension.h"
#include <iostream>

#define Switch(type, x) { string _switch = x;
#define CaseOne(x)			if (x == _switch)
#define Case(x)         else if(x == _switch)
#define EndSwitch       }

HWND WINAPI AU3_WinGetHandle_(const CefV8ValueList &arg);
HWND WINAPI AU3_ControlGetHandle_(const CefV8ValueList &arg);

bool Cefau3_Extension::Execute(const CefString &name, CefRefPtr<CefV8Value> object,
	const CefV8ValueList &arguments, CefRefPtr<CefV8Value> &retval, CefString &exception)
{
	Switch(string, name) 
	{
#pragma region main
		// Minimize()
		CaseOne("Minimize") {
			ShowWindow(this->app->GetHandler()->Parent(), SW_MINIMIZE);
		}
		// Maximize()
		Case("Maximize") {
			ShowWindow(this->app->GetHandler()->Parent(), SW_MAXIMIZE);
		}
		// Restore()
		Case("Restore") {
			ShowWindow(this->app->GetHandler()->Parent(), SW_RESTORE);
		}
		// Hide()
		Case("Hide") {
			ShowWindow(this->app->GetHandler()->Parent(), SW_HIDE);
		}
		// Show()
		Case("Show") {
			ShowWindow(this->app->GetHandler()->Parent(), SW_SHOW);
		}
		// SetOntop([<int> ontop = 1])
		Case("SetOntop") {
			if (!(arguments.size() == 1)) return false;
			int mode = arguments[0]->IsUndefined() ? 1 : arguments[0]->GetIntValue();
			HWND parent = this->app->GetHandler()->Parent();
			if (mode) SetWindowPos(parent, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
			else SetWindowPos(parent, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);;
			return true;
		}
		// Print(<string | number | bool> value)
		Case("Print") {
			if (!(arguments.size() == 1)) return false;
			if (arguments[0]->IsString()) std::cout << arguments[0]->GetStringValue().ToString().c_str() << std::endl;
			if (arguments[0]->IsBool())	std::cout << arguments[0]->GetBoolValue() << std::endl;
			else if (arguments[0]->IsInt()) std::cout << arguments[0]->GetIntValue() << std::endl;
			else if (arguments[0]->IsDouble()) std::cout << arguments[0]->GetDoubleValue() << std::endl;
			return true;
		}
		// MsgBeep([<uint> rate])
		Case("MsgBeep") {
			if (!(arguments.size() == 1)) return false;
			MessageBeep(arguments[0]->IsUndefined() ? 0xffffffff : arguments[0]->GetUIntValue());
			return true;
		}
		// MsgBox(<string> title, <string> text, [<uint> flag = 0], [<handle> parent = 0]) => <int>
		Case("MsgBox") {
			if (!(arguments.size() == 4)) return false;
			retval = object->CreateInt(MessageBox(
				(HWND)(arguments[3]->IsUndefined() ? 0 : arguments[3]->GetUIntValue()),
				arguments[1]->GetStringValue().ToWString().c_str(),
				arguments[0]->GetStringValue().ToWString().c_str(),
				arguments[2]->IsUndefined() ? 0 : arguments[2]->GetUIntValue()));
			return true;
		}
		// Call(<uint> pointer, [<any> param])
		Case("Call") {
			CEF_REQUIRE_UI_THREAD();
			CEF_REQUIRE_IO_THREAD();
			if (!(arguments.size() == 2)) return false;
				if (arguments[1]->IsUndefined()) {
					typedef void (__stdcall * FUNC)();
					((FUNC)arguments[0]->GetUIntValue())();
					return true;
				}
				else if (arguments[1]->IsBool()) {
					typedef void(__stdcall * FUNC)(BOOL);
					((FUNC)arguments[0]->GetUIntValue())(arguments[1]->GetBoolValue());
					return true;
				}
				else if (arguments[1]->IsInt()) {
					typedef void(__stdcall * FUNC)(INT);
					((FUNC)arguments[0]->GetUIntValue())(arguments[1]->GetIntValue());
					return true;
				}
				else if (arguments[1]->IsString()) {
					typedef void(__stdcall * FUNC)(LPCWSTR);
					((FUNC)arguments[0]->GetUIntValue())(arguments[1]->GetStringValue().ToWString().c_str());
					return true;
				}
				else if (arguments[1]->IsDouble()) {
					typedef void(__stdcall * FUNC)(double);
					((FUNC)arguments[0]->GetUIntValue())(arguments[1]->GetDoubleValue());
					return true;
				}
				else {
					typedef void(__stdcall * FUNC)(void*);
					((FUNC)arguments[0]->GetUIntValue())((void*)arguments[1]->GetUIntValue());
					return true;
				}
			return true;
		}
		// SendMessage(<handle> window, <uint> message, <string | number> w_param, <string| number> l_param) => <int>
		Case("SendMessage") {
			if (arguments.size() == 4) {
				HWND hWnd = (HWND)arguments[0]->GetUIntValue();
				UINT uMsg = arguments[1]->GetUIntValue();
				WPARAM wParam(0); LPARAM lParam(0);
				if (arguments[2]->IsInt())			wParam = (WPARAM)arguments[2]->GetUIntValue();
				else if (arguments[2]->IsString())	wParam = (WPARAM)arguments[2]->GetStringValue().ToWString().c_str();
				else if (arguments[2]->IsDouble())	wParam = (WPARAM)arguments[2]->GetDoubleValue();
				if (arguments[3]->IsUInt())			lParam = (LPARAM)arguments[3]->GetUIntValue();
				else if (arguments[3]->IsString())	lParam = (LPARAM)arguments[3]->GetStringValue().ToWString().c_str();
				else if (arguments[3]->IsDouble())	lParam = (LPARAM)arguments[3]->GetDoubleValue();
				retval = CefV8Value::CreateInt(SendMessage(hWnd, uMsg, wParam, lParam));
				return true;
			}
		}
		// MessageBox(<handle> window, <string> text, <string> title, [<uint> flag = 0]) => <int>
		Case("MessageBox") {
			if (!(arguments.size() == 4)) return false;
			retval = CefV8Value::CreateInt(MessageBoxW(
				(HWND)arguments[0]->GetUIntValue(),
				arguments[1]->GetStringValue().ToWString().c_str(),
				arguments[2]->GetStringValue().ToWString().c_str(),
				arguments[3]->IsUndefined() ? 0 : arguments[3]->GetUIntValue()));
			return true;
		}
		/*
		// DllCall(<string> dll, <string> return, <string> func, <string> param1_type, <any> param1_value, [<string> param2_type], [<any> param2_value], ...) => <any>
		Case("DllCall") {
			if (!(arguments.size() == 19)) return false;
			// -- todo --
			return true;
		}
		*/
		// LoadURL(<string> url)
		Case("MainLoadURL") {
			if (!(arguments.size() == 1)) return false;
			auto url = arguments[0]->GetStringValue();
			this->app->GetHandler()->GetBrowser()->GetMainFrame()->LoadURL(url);
			return true;
		}
		// GoBack()
		Case("MainGoBack") {
			this->app->GetHandler()->GetBrowser()->GoBack(); return true;
		}
		// GoForward()
		Case("MainGoForward") {
			this->app->GetHandler()->GetBrowser()->GoForward();	return true;
		}
		// CanGoBack() => <bool>
		Case("MainCanGoBack") {
			retval = object->CreateBool(this->app->GetHandler()->GetBrowser()->CanGoBack()); return true;
		}
		// CanGoForward() => <bool>
		Case("MainCanGoForward") {
			retval = object->CreateBool(this->app->GetHandler()->GetBrowser()->CanGoForward()); return true;
		}
		// Reload()
		Case("MainReload") {
			this->app->GetHandler()->GetBrowser()->Reload(); return true;
		}
		// StopLoad()
		Case("MainStopLoad") {
			this->app->GetHandler()->GetBrowser()->StopLoad(); return true;
		}
		// IsLoading()
		Case("MainIsLoading") {
			retval = object->CreateBool(this->app->GetHandler()->GetBrowser()->IsLoading()); return true;
		}
		// ChangeTitle(<string> title)
		Case("ChangeTitle") {
			if (!(arguments.size() == 1)) return false;
			SetWindowText(this->app->GetHandler()->Parent(), arguments[0]->GetStringValue().ToWString().c_str());
			return true;
		}
#pragma endregion

#pragma region app
		// LoadURL(<string> url)
		Case("LoadURL") {
			if (!(arguments.size() == 1)) return false;
			auto url = arguments[0]->GetStringValue();
			CefV8Context::GetCurrentContext()->GetBrowser()->GetMainFrame()->LoadURL(url);
			return true;
		}
		// GoBack()
		Case("GoBack") {
			CefV8Context::GetCurrentContext()->GetBrowser()->GoBack(); return true;
		}
		// GoForward()
		Case("GoForward") {
			CefV8Context::GetCurrentContext()->GetBrowser()->GoForward();	return true;
		}
		// CanGoBack() => <bool>
		Case("CanGoBack") {
			retval = object->CreateBool(CefV8Context::GetCurrentContext()->GetBrowser()->CanGoBack()); return true;
		}
		// CanGoForward() => <bool>
		Case("CanGoForward") {
			retval = object->CreateBool(CefV8Context::GetCurrentContext()->GetBrowser()->CanGoForward()); return true;
		}
		// Reload()
		Case("Reload") {
			CefV8Context::GetCurrentContext()->GetBrowser()->Reload(); return true;
		}
		// StopLoad()
		Case("StopLoad") {
			CefV8Context::GetCurrentContext()->GetBrowser()->StopLoad(); return true;
		}
		// IsLoading()
		Case("IsLoading") {
			retval = object->CreateBool(CefV8Context::GetCurrentContext()->GetBrowser()->IsLoading()); return true;
		}
#pragma endregion

#pragma region au3

		// Init()
		Case("Init") {
			AU3_Init(); return true;
		}
		// error() => <int>
		Case("error") {
			retval = CefV8Value::CreateInt(AU3_error()); return true;
		}
		// AutoItSetOption(<string> option, <int> value) => <int>
		Case("AutoItSetOption") {
			if (arguments.size() == 2 && arguments[0]->IsString() && arguments[1]->IsInt()) {
				retval = CefV8Value::CreateInt(AU3_AutoItSetOption(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetIntValue()));
				return true;
			}
		}
		// ClipGet() => <sttring>
		Case("ClipGet") {
			OpenClipboard(NULL);
			HANDLE hData = GetClipboardData(CF_UNICODETEXT);
			retval = CefV8Value::CreateString(!hData ? L"" : (wchar_t*)hData);
			CloseHandle(hData);
			CloseClipboard();
			return true;
		}
		// CliptPut(<string> text)
		Case("ClipPut") {
			if (arguments.size() == 1) {
				AU3_ClipPut(arguments[0]->GetStringValue().ToWString().c_str());
				return true;
			}
		}
		// ControlClick(<string | handle> window, <string> win_text = "", <string | handle> control, [<string> mouse_btn = "LEFT"], [<int> nclick = 1], [<int> x], [<int> y]) => <int>
		Case("ControlClick") {
			if (arguments.size() == 7) {
				retval = CefV8Value::CreateInt(AU3_ControlClickByHandle(
					AU3_WinGetHandle_(arguments),
					AU3_ControlGetHandle_(arguments),
					arguments[3]->GetStringValue().ToWString().c_str(),
					arguments[4]->IsUndefined() ? 1 : arguments[4]->GetIntValue(),
					arguments[5]->IsUndefined() ? AU3_INTDEFAULT : arguments[5]->GetIntValue(),
					arguments[6]->IsUndefined() ? AU3_INTDEFAULT : arguments[6]->GetIntValue()));
				return true;
			}
		}
		// IsAdmin() => <int>
		Case("IsAdmin") { retval = CefV8Value::CreateInt(AU3_IsAdmin()); return true; }
		// ControlCommand(<string | handle> window, <string> win_text = "", <string | handle> control, <string> command, [<string> parameter]) => <string>
		Case("ControlCommand") {
			if (arguments.size() == 5) {
				LPWSTR ret(0);
				AU3_ControlCommandByHandle(
					AU3_WinGetHandle_(arguments),
					AU3_ControlGetHandle_(arguments),
					arguments[3]->GetStringValue().ToWString().c_str(),
					arguments[4]->IsUndefined() ? L"" : arguments[4]->GetStringValue().ToWString().c_str(),
					ret,
					1024);
				retval = CefV8Value::CreateString(ret);
				return true;
			}
		}
		// ControlDisable(<string | handle> window, <string> win_text = "", <string | handle> control)
		Case("ControlDisable") {
			if (arguments.size() == 3) {
				EnableWindow(AU3_ControlGetHandle_(arguments), FALSE);
				return true;
			}
		}
		// ControlEnable(<string | handle> window, <string> win_text = "", <string | handle> control)
		Case("ControlEnable") {
			if (arguments.size() == 3) {
				EnableWindow(AU3_ControlGetHandle_(arguments), TRUE);
				return true;
			}
		}
		// ControlFocus(<string | handle> window, <string> win_text = "", <string | handle> control)
		Case("ControlFocus") {
			if (arguments.size() == 3) {
				AU3_ControlFocusByHandle(
					AU3_WinGetHandle_(arguments),
					AU3_ControlGetHandle_(arguments));
				return true;
			}
		}
		// ControlGetHandle(<string | handle> window, <string> win_text = "", <string> control) => <handle>
		Case("ControlGetHandle") {
			if (arguments.size() == 3) {
				HWND hWnd(0);
				if (arguments[0]->IsString()) {
					hWnd = AU3_WinGetHandle(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->GetStringValue().ToWString().c_str());
				}
				else {
					hWnd = (HWND)arguments[0]->GetUIntValue();
				}
				retval = CefV8Value::CreateUInt((UINT)AU3_ControlGetHandle(
					hWnd,
					arguments[2]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// ControlGetPos(<string | handle> window, <string> win_text = "", <string | handle> control, [<int> mode = 0]) => {<int> x, <int> x, <int> width, <int> height}
		Case("ControlGetPos") {
			if (arguments.size() == 4) {
				auto hControl = AU3_ControlGetHandle_(arguments);
				RECT rc{ 0 }; GetWindowRect(hControl, &rc);
				rc.right = rc.right - rc.left;
				rc.bottom = rc.bottom - rc.top;
				auto retrc = CefV8Value::CreateObject(NULL, NULL);
				if (arguments[3]->GetIntValue()) {
					POINT pt{ rc.left, rc.top };
					ClientToScreen(GetDesktopWindow(), &pt);
					rc.left = pt.x;
					rc.right = pt.y;
				}
				retrc->SetValue("x", CefV8Value::CreateInt(rc.left), V8_PROPERTY_ATTRIBUTE_NONE);
				retrc->SetValue("y", CefV8Value::CreateInt(rc.top), V8_PROPERTY_ATTRIBUTE_NONE);
				retrc->SetValue("width", CefV8Value::CreateInt(rc.right), V8_PROPERTY_ATTRIBUTE_NONE);
				retrc->SetValue("height", CefV8Value::CreateInt(rc.bottom), V8_PROPERTY_ATTRIBUTE_NONE);
				retval = retrc;
				return true;
			}
		}
		// ControlGetText(<string | handle> window, <string> win_text = "", <string | handle> control) => <string> control_text
		Case("ControlGetText") {
			if (arguments.size() == 3) {
				LPWSTR text(0); GetWindowText(AU3_ControlGetHandle_(arguments), text, 1024);
				retval = CefV8Value::CreateString(text);
				return true;
			}
		}
		// ControlHide(<string | handle> window, <string> win_text = "", <string | handle> control)
		Case("ControlHide") {
			if (arguments.size() == 3) {
				ShowWindow(AU3_ControlGetHandle_(arguments), SW_HIDE);
				return true;
			}
		}
		// ControlMove(<string | handle> window, <string> win_text = "", <string | handle> control, <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int> state
		Case("ControlMove") {
			if (arguments.size() == 7) {
				HWND handle = AU3_ControlGetHandle_(arguments);
				retval = CefV8Value::CreateInt(AU3_ControlMoveByHandle(
					GetParent(handle), handle,
					arguments[3]->GetIntValue(),
					arguments[4]->GetIntValue(),
					arguments[5]->IsUndefined() ? -1 : arguments[5]->GetIntValue(),
					arguments[6]->IsUndefined() ? -1 : arguments[5]->GetIntValue()
				));
			}
		}
		// ControlSend(<string | handle> window, <string> win_text = "", <string | handle> control, <string> send, [<int> mode]) => <int> state
		Case("ControlSend") {
			if (arguments.size() == 6) {
				retval = CefV8Value::CreateInt(AU3_ControlSendByHandle(
					AU3_WinGetHandle_(arguments),
					AU3_ControlGetHandle_(arguments),
					arguments[4]->GetStringValue().ToWString().c_str(),
					arguments[5]->IsUndefined() ? 0 : arguments[5]->GetIntValue()));
			}
		}
		// ControlSetText(<string | handle> window, <string> win_text = "", <string | handle> control, <string> newtext) => <int> state
		Case("ControlSetText") {
			if (arguments.size() == 4) {
				retval = CefV8Value::CreateInt(AU3_ControlSetTextByHandle(
					AU3_WinGetHandle_(arguments),
					AU3_ControlGetHandle_(arguments),
					arguments[3]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// ControlShow(<string | handle> window, <string> win_text = "", <string | handle> control)
		Case("ControlShow") {
			if (arguments.size() == 3) {
				ShowWindow(AU3_ControlGetHandle_(arguments), SW_SHOW);
				return true;
			}
		}
		// MouseClick([<string> mouse_btn = "LEFT"], [<int> x], [<int> y], [<int> nclick = 1], [<int> speed = -1]) => <int> state
		Case("MouseClick") {
			if (arguments.size() == 5) {
				retval = CefV8Value::CreateInt(AU3_MouseClick(
					arguments[0]->GetStringValue() == "" ? L"LEFT" : arguments[0]->GetStringValue().ToWString().c_str(),
					(arguments[1]->IsUndefined() || arguments[1]->IsNull()) ? AU3_INTDEFAULT : arguments[1]->GetIntValue(),
					(arguments[2]->IsUndefined() || arguments[2]->IsNull()) ? AU3_INTDEFAULT : arguments[2]->GetIntValue(),
					arguments[3]->IsUndefined() ? 1 : arguments[3]->GetIntValue(),
					arguments[4]->IsUndefined() ? -1 : arguments[4]->GetIntValue()));
				return true;
			}
		}
		// MouseClickDrag(<string> mouse_btn, <int> x1, <int> y1, <int> x2, <int> y2, [<int> speed = -1]) => <int> state
		Case("MouseClickDrag") {
			if (arguments.size() == 6 && arguments[0]->IsString()) {
				retval = CefV8Value::CreateInt(
					AU3_MouseClickDrag(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->GetIntValue(),
						arguments[1]->GetIntValue(),
						arguments[3]->GetIntValue(),
						arguments[4]->GetIntValue(),
						arguments[5]->IsUndefined() ? -1 : arguments[4]->GetIntValue()));
				return true;
			}
		}
		// MouseClickDown([<string> mouse_btn = "LEFT"]) => <int> state
		Case("MouseClickDown") {
			if (arguments.size() == 1 && arguments[0]->IsString()) {
				AU3_MouseDown(arguments[0]->IsUndefined() ? L"LEFT" : (arguments[0]->GetStringValue() == "" ? L"LEFT" : arguments[0]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// MouseGetCursor() => <int> cursor
		Case("MouseGetCursor") {
			retval = CefV8Value::CreateInt(AU3_MouseGetCursor());
			return true;
		}
		// MouseGetPos() => {int x, int y}
		Case("MouseGetPos") {
			//POINT pt; AU3_MouseGetPos(&pt);
			POINT pt; GetCursorPos(&pt);
			auto point = CefV8Value::CreateObject(NULL, NULL);
			point->SetValue("x", CefV8Value::CreateInt(pt.x), V8_PROPERTY_ATTRIBUTE_NONE);
			point->SetValue("y", CefV8Value::CreateInt(pt.y), V8_PROPERTY_ATTRIBUTE_NONE);
			retval = point;
			return true;
		}
		// MouseMove(<int> x, <int> y, [<int> speed = -1]) => <int> state
		Case("MouseMove") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_MouseMove(
					arguments[0]->GetIntValue(),
					arguments[1]->GetIntValue(),
					arguments[2]->IsUndefined() ? -1 : arguments[2]->GetIntValue()));
				return true;
			}
		}
		// MouseUp([<string> mouse_btn = "LEFT"])
		Case("MouseUp") {
			if (arguments.size() == 1 && arguments[0]->IsString()) {
				AU3_MouseUp(arguments[0]->IsUndefined() ? L"LEFT" : (arguments[0]->GetStringValue() == "" ? L"LEFT" : arguments[0]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// MouseWheel(<string> direction, [<int> click = 1])
		Case("MouseWheel") {
			if (arguments.size() == 2) {
				AU3_MouseWheel(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->IsUndefined() ? 1 : arguments[1]->GetIntValue());
				return true;
			}
		}
		// Opt(<string> option, <int> value) => <int> state
		Case("Opt") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateInt(AU3_Opt(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetIntValue()));
				return true;
			}
		}
		// PixelChecksum(<int> left, <int> top, <int> right, <int> bottom, [<int> step = 1]) => <int> bool
		Case("PixelChecksum") {
			if (arguments.size() == 5) {
				RECT rc = { arguments[0]->GetIntValue(), arguments[1]->GetIntValue(), arguments[2]->GetIntValue(),arguments[3]->GetIntValue() };
				retval = CefV8Value::CreateUInt(AU3_PixelChecksum(
					&rc, arguments[4]->IsUndefined() ? 1 : arguments[4]->GetUIntValue()));
				return true;
			}
		}
		// PixelGetColor([<int> x], [<int> y]) => <int> dec_color
		Case("PixelGetColor") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsUndefined()) {
					POINT pt{ 0 }; GetCursorPos(&pt);
					retval = CefV8Value::CreateInt(AU3_PixelGetColor(pt.x, pt.y));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_PixelGetColor(arguments[0]->GetIntValue(), arguments[1]->GetIntValue()));
				}
				return true;
			}
		}
		// PixelSearch(<int> left, <int> top, <int> right, <int> bottom, <uint> color, [<int> shade_var = 0], [<int> step = 1])
		Case("PixelSearch") {
			if (arguments.size() == 6) {
				RECT rc = { arguments[0]->GetIntValue(), arguments[1]->GetIntValue(), arguments[2]->GetIntValue(),arguments[3]->GetIntValue() };
				POINT pt{ 0 };
				AU3_PixelSearch(
					&rc,
					arguments[4]->GetUIntValue(),
					arguments[5]->GetUIntValue(),
					arguments[6]->GetUIntValue(),
					&pt);
				auto point = CefV8Value::CreateObject(NULL, NULL);
				point->SetValue("x", CefV8Value::CreateInt(pt.x), V8_PROPERTY_ATTRIBUTE_NONE);
				point->SetValue("y", CefV8Value::CreateInt(pt.y), V8_PROPERTY_ATTRIBUTE_NONE);
				retval = point;
				return true;
			}
		}
		// ProcessClose(<string> processname) => <int>
		Case("ProcessClose") {
			if (arguments.size() == 1) {
				retval = CefV8Value::CreateInt(AU3_ProcessClose(arguments[0]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// ProcessExists(<string> processname) => <int> process_id
		Case("ProcessExists") {
			if (arguments.size() == 1) {
				retval = CefV8Value::CreateInt(AU3_ProcessExists(arguments[0]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// ProcessSetPriority(<string> processname, <int> priority) => <int> state
		Case("ProcessSetPriority") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateInt(AU3_ProcessSetPriority(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetIntValue()));
				return true;
			}
		}
		// ProcessWait(<string> processname, [<int> timeout]) => <int>
		Case("ProcessWait") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateInt(AU3_ProcessWait(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->IsUndefined() ? 0 : arguments[1]->GetIntValue()));
				return true;
			}
		}
		// ProcessWaitClose(<string> processname, [<int> timeout]) => <int>
		Case("ProcessWaitClose") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateInt(AU3_ProcessWaitClose(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetIntValue()));
				return true;
			}
		}
		// Run(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
		Case("Run") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_Run(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str(),
					arguments[2]->IsUndefined() ? SW_SHOWNORMAL : arguments[2]->GetIntValue()
				));
				return true;
			}
		}
		// RunWait(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
		Case("RunWait") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_RunWait(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str(),
					arguments[2]->IsUndefined() ? SW_SHOWNORMAL : arguments[2]->GetIntValue()
				));
				return true;
			}
		}
		// RunAs(<string> user, <string> domain, <string> password, <int> logonflag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
		Case("RunAs") {
			if (arguments.size() == 7) {
				retval = CefV8Value::CreateInt(AU3_RunAs(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetStringValue().ToWString().c_str(),
					arguments[2]->GetStringValue().ToWString().c_str(),
					arguments[3]->GetIntValue(),
					arguments[4]->GetStringValue().ToWString().c_str(),
					arguments[5]->IsUndefined() ? L"" : arguments[5]->GetStringValue().ToWString().c_str(),
					arguments[6]->IsUndefined() ? SW_SHOWNORMAL : arguments[6]->GetIntValue()
				));
				return true;
			}
		}
		// RunAsWait(<string> user, <string> domain, <string> password, <int> logon_flag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
		Case("RunAsWait") {
			if (arguments.size() == 7) {
				retval = CefV8Value::CreateInt(AU3_RunAsWait(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->GetStringValue().ToWString().c_str(),
					arguments[2]->GetStringValue().ToWString().c_str(),
					arguments[3]->GetIntValue(),
					arguments[4]->GetStringValue().ToWString().c_str(),
					arguments[5]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str(),
					arguments[6]->IsUndefined() ? SW_SHOWNORMAL : arguments[2]->GetIntValue()
				));
				return true;
			}
		}
		// Send(<string> code, [<int> mode = 0])
		Case("Send") {
			if (arguments.size() == 2) {
				AU3_Send(arguments[0]->GetStringValue().ToWString().c_str(), arguments[1]->GetIntValue());
				return true;
			}
		}
		// Shutdown(<int> flags) => <int>
		Case("Shutdown") {
			if (arguments.size() == 1) {
				retval = CefV8Value::CreateInt(AU3_Shutdown(arguments[0]->GetIntValue()));
				return true;
			}
		}
		// Sleep([<int> milliseconds = 10])
		Case("Sleep") {
			if (arguments.size() == 1) {
				Sleep(arguments[0]->IsUndefined() ? 10 : arguments[0]->GetIntValue());
				return true;
			}
		}
		// ToolTip(<string> tip, [<int> x], [<int> y])
		Case("ToolTip") {
			if (arguments.size() == 3) {
				AU3_ToolTip(
					arguments[0]->GetStringValue().ToWString().c_str(),
					arguments[1]->IsUndefined() ? AU3_INTDEFAULT : arguments[1]->GetIntValue(),
					arguments[2]->IsUndefined() ? AU3_INTDEFAULT : arguments[2]->GetIntValue());
				return true;
			}
		}
		// WinActivate(<string | handle> window, [<string> win_text = ""]) => <int>
		Case("WinActivate") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsString()) {
					retval = CefV8Value::CreateInt(AU3_WinActivate(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str()));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_WinActivateByHandle(
						(HWND)arguments[0]->GetUIntValue()));
				}
				return true;
			}
		}
		// WinActive(<string | handle> window, [<string> win_text =""]) => <int>
		Case("WinActive") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsString()) {
					retval = CefV8Value::CreateInt(AU3_WinActive(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str()));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_WinActiveByHandle(
						(HWND)arguments[0]->GetUIntValue()));
				}
				return true;
			}
		}
		// WinClose(<string | handle> window, [<string> win_text = ""]) => <int>
		Case("WinClose") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsString()) {
					retval = CefV8Value::CreateInt(AU3_WinClose(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str()));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_WinCloseByHandle(
						(HWND)arguments[0]->GetUIntValue()));
				}
				return true;
			}
		}
		// WinExists(<string | handle> window, [<string> win_text = ""]) => <int>
		Case("WinExists") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsString()) {
					retval = CefV8Value::CreateInt(AU3_WinExists(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str()));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_WinExistsByHandle(
						(HWND)arguments[0]->GetUIntValue()));
					return true;
				}
				return true;
			}
		}
		// WinGetCaretPos() => {<int> x, <int> y}
		Case("WinGetCaretPos") {
			POINT pt; AU3_WinGetCaretPos(&pt);
			auto point = CefV8Value::CreateObject(NULL, NULL);
			point->SetValue("x", CefV8Value::CreateInt(pt.x), V8_PROPERTY_ATTRIBUTE_NONE);
			point->SetValue("y", CefV8Value::CreateInt(pt.x), V8_PROPERTY_ATTRIBUTE_NONE);
			retval = point;
			return true;
		}
		// WinGetClientSize(<string | handle> window, [<string> text]) => {<int> width, <int> height}
		Case("WinGetClientSize") {
			if (arguments.size() == 2) {
				RECT rc; GetClientRect(AU3_WinGetHandle_(arguments), &rc);
				auto rect = CefV8Value::CreateObject(NULL, NULL);
				rect->SetValue("width", CefV8Value::CreateInt(rc.right), V8_PROPERTY_ATTRIBUTE_NONE);
				rect->SetValue("height", CefV8Value::CreateInt(rc.bottom), V8_PROPERTY_ATTRIBUTE_NONE);
				retval = rect;
				return true;
			}
		}
		// WinGetPos(<string | handle> window, <string> win_text = "") => {<int> x, <int> y}
		Case("WinGetPos") {
			if (arguments.size() == 2) {
				RECT rc; GetWindowRect(AU3_WinGetHandle_(arguments), &rc);
				auto rect = CefV8Value::CreateObject(NULL, NULL);
				rect->SetValue("x", CefV8Value::CreateInt(rc.left), V8_PROPERTY_ATTRIBUTE_NONE);
				rect->SetValue("y", CefV8Value::CreateInt(rc.top), V8_PROPERTY_ATTRIBUTE_NONE);
				retval = rect;
				return true;
			}
		}
		// WinGetProcess(<string | handle> window, <string> win_text = "") => <uint>
		Case("WinGetProcess") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateUInt(AU3_WinGetProcessByHandle(AU3_WinGetHandle_(arguments)));
				return true;
			}
		}
		// WinGetState(<string | handle> window, <string> win_text = "", <>) => <int>
		Case("WinGetState") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateInt(AU3_WinGetStateByHandle(AU3_WinGetHandle_(arguments)));
				return true;
			}
		}
		// WinGetText(<string | handle> window, <string> win_text = "", <>) => <string>
		Case("WinGetText") {
			if (arguments.size() == 2) {
				LPWSTR text(0); AU3_WinGetTextByHandle(AU3_WinGetHandle_(arguments), text, 1024);
				retval = CefV8Value::CreateString(text);
				return true;
			}
		}
		// WinGetTitle(<string | handle> window, <string> win_text = "") => <string>
		Case("WinGetTitle") {
			if (arguments.size() == 2) {
				LPWSTR text(0); AU3_WinGetTitleByHandle(AU3_WinGetHandle_(arguments), text, 1024);
				retval = CefV8Value::CreateString(text);
				return true;
			}
		}
		// WinGetHandle(<string> window, <string> text = "") => <handle>
		Case("WinGetHandle") {
			if (arguments.size() == 2) {
				retval = CefV8Value::CreateUInt((UINT)AU3_WinGetHandle_(arguments));
				return true;
			}
		}
		// WinKill(<string | handle> window, [<string> win_text = ""]) => <int>
		Case("WinKill") {
			if (arguments.size() == 2) {
				if (arguments[0]->IsString()) {
					retval = CefV8Value::CreateInt(AU3_WinKill(
						arguments[0]->GetStringValue().ToWString().c_str(),
						arguments[1]->IsUndefined() ? L"" : arguments[1]->GetStringValue().ToWString().c_str()));
				}
				else {
					retval = CefV8Value::CreateInt(AU3_WinKillByHandle(
						(HWND)arguments[0]->GetUIntValue()));
				}
				return true;
			}
		}
		// WinMenuSelectItem(<string | handle> window, <string> win_text = "", <string> item_1, [<string> item_2], [<string> item_N], ...) => <int>
		Case("WinMenuSelectItem") {
			if (arguments.size() == 10) {
				retval = CefV8Value::CreateInt(AU3_WinMenuSelectItemByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->GetStringValue().ToWString().c_str(),
					arguments[3]->IsUndefined() ? L"" : arguments[3]->GetStringValue().ToWString().c_str(),
					arguments[4]->IsUndefined() ? L"" : arguments[4]->GetStringValue().ToWString().c_str(),
					arguments[5]->IsUndefined() ? L"" : arguments[5]->GetStringValue().ToWString().c_str(),
					arguments[6]->IsUndefined() ? L"" : arguments[6]->GetStringValue().ToWString().c_str(),
					arguments[7]->IsUndefined() ? L"" : arguments[7]->GetStringValue().ToWString().c_str(),
					arguments[8]->IsUndefined() ? L"" : arguments[8]->GetStringValue().ToWString().c_str(),
					arguments[9]->IsUndefined() ? L"" : arguments[9]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// WinMinimizeAll()
		Case("WinMinimizeAll") {
			AU3_WinMinimizeAll();
			return true;
		}
		// WinMinimizeAllUndo()
		Case("WinMinimizeAllUndo") {
			AU3_WinMinimizeAllUndo();
			return true;
		}
		// WinMove(<string | handle> window, <string> win_text = "", <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int>
		Case("WinMove") {
			if (arguments.size() == 6) {
				retval = CefV8Value::CreateInt(AU3_WinMoveByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->GetIntValue(),
					arguments[3]->GetIntValue(),
					arguments[4]->IsUndefined() ? -1 : arguments[3]->GetIntValue(),
					arguments[5]->IsUndefined() ? -1 : arguments[3]->GetIntValue()));
			}
		}
		// WinSetOnTop(<string | handle> window, <string> win_text = "", [<int> flag = 1]) => <int>
		Case("WinSetOnTop") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinSetOnTopByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->IsUndefined() ? 1 : arguments[1]->GetIntValue()));
				return true;
			}
		}
		// WinSetState(<string | handle> window, <string> win_text = "", <int> flag) => <int>
		Case("WinSetState") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinSetStateByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->GetIntValue()));
				return true;
			}
		}
		// WinSetTitle(<string | handle> window, <string> win_text = "", <string> newtitle) => <int>
		Case("WinSetTitleByHandle") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinSetTitleByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->GetStringValue().ToWString().c_str()));
				return true;
			}
		}
		// WinSetTrans(<string | handle> window, <string> win_text = "", <int> transparent) => <int>
		Case("WinSetTrans") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinSetTransByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->GetIntValue()));
				return true;
			}
		}
		// WinWait(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
		Case("WinWaitByHandle") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinWaitByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->IsUndefined() ? 0 : arguments[1]->GetIntValue()));
				return true;
			}
		}
		// WinWaitActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
		Case("WinWaitActive") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinWaitActiveByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->IsUndefined() ? 0 : arguments[2]->GetIntValue()));
				return true;
			}
		}
		// WinWaitClose(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
		Case("WinWaitClose") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinWaitCloseByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[1]->IsUndefined() ? 0 : arguments[1]->GetIntValue()));
				return true;
			}
		}
		// WinWaitNotActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
		Case("WinWaitNotActive") {
			if (arguments.size() == 3) {
				retval = CefV8Value::CreateInt(AU3_WinWaitNotActiveByHandle(
					AU3_WinGetHandle_(arguments),
					arguments[2]->IsUndefined() ? 0 : arguments[2]->GetIntValue()));
				return true;
			}
		}
#pragma endregion
	}	
	EndSwitch

	return false;
}

// <string | handle>, <string>
HWND WINAPI AU3_WinGetHandle_(const CefV8ValueList &arg)
{
	if (arg[0]->IsString()) {
		return AU3_WinGetHandle(
			arg[0]->GetStringValue().ToWString().c_str(),
			arg[1]->GetStringValue().ToWString().c_str());
	}
	else {
		return (HWND)arg[0]->GetUIntValue();
	}
}

// <string | handle>, <string>, <string>
HWND WINAPI AU3_ControlGetHandle_(const CefV8ValueList &arg)
{
	HWND hParent(0);
	if (arg[0]->IsString()) {
		HWND hParent = AU3_WinGetHandle(
			arg[0]->GetStringValue().ToWString().c_str(),
			arg[1]->GetStringValue().ToWString().c_str());
	}
	else {
		hParent = (HWND)arg[0]->GetUIntValue();
	}
	return AU3_ControlGetHandle(hParent, arg[2]->GetStringValue().ToWString().c_str());
}