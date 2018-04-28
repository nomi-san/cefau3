#include "inc.h"
extern LPCSTR lpExtensionFromFile;

class JsExtension
{
public:
	JsExtension(string object) {
		this->object = object;
		this->code = "\n var "  + object + ";"
						"if (!" + object + ")"
						"    "  + object + " = {};\n";
	}

	string AddFunction(string function, string param) {
		if (function == "") return function;
		this->code += 
			"(function() {"
			"	" + this->object + "." + function + " = function(" + param + ") {"
			"		native function " + function + "();"
			"		return " + function + "(" + param + ");"
			"	};"
			"})();;\n";
		return this->code;
	}

	string AddFunction2(string func_orgi, string func_fake, string param) {
		if (func_orgi == "" || func_fake == "") return "";
		this->code +=
			"(function() {"
			"	" + this->object + "." + func_fake + " = function(" + param + ") {"
			"		native function " + func_orgi + "();"
			"		return " + func_orgi + "(" + param + ");"
			"	};"
			"})();;\n";
		return this->code;
	}

private:
	string object;
	string code;
};

void Cefau3_App::OnWebKitInitialized() {
	std::string code;
	JsExtension app("app");
	JsExtension au3("au3");
	JsExtension main("main");

//////////////////////////////////////////////////////////////////////////
	// LoadURL(<string> url)
	code += app.AddFunction("LoadURL", "url");
	// GoBack()
	code += app.AddFunction("GoBack", "");
	// GoForward()
	code += app.AddFunction("GoForward", "");
	// CanGoBack() => <bool>
	code += app.AddFunction("CanGoBack", "");
	// CanGoForward() => <bool>
	code += app.AddFunction("CanGoForward", "");
	// Reload()
	code += app.AddFunction("Reload", "");
	// StopLoad()
	code += app.AddFunction("StopLoad", "");
	// IsLoading()
	code += app.AddFunction("IsLoading", "");
//////////////////////////////////////////////////////////////////////
	// Init()
	code += au3.AddFunction("Init", "");
	// error() => <int>
	code += au3.AddFunction("error", "");
	// AutoItSetOption(<string> option, <int> value) => <int>
	code += au3.AddFunction("AutoItSetOption", "option, value");
	// ClipGet() => <string>
	code += au3.AddFunction("ClipGet", "");
	// CliptPut(<string> text)
	code += au3.AddFunction("CliptPut", "text");
	// ControlClick(<string | handle> window, <string> win_text = "", <string | handle> control, [<string> mouse_btn = "LEFT"], [<int> nclick = 1], [<int> x], [<int> y]) => <int>
	code += au3.AddFunction("ControlClick", "window, text, control, button, click, x, y");
	// IsAdmin() => <int>
	code += au3.AddFunction("IsAdmin", "");
	// ControlCommand(<string | handle> window, <string> win_text = "", <string | handle> control, <string> command, [<string> parameter]) => <string>
	code += au3.AddFunction("ControlDisable", "window, text, control, command, param");
	// ControlDisable(<string | handle> window, <string> win_text = "", <string | handle> control)
	code += au3.AddFunction("ControlDisable", "window, text, control");
	// ControlEnable(<string | handle> window, <string> win_text = "", <string | handle> control)
	code += au3.AddFunction("ControlEnable", "window, text, control");
	// ControlFocus(<string | handle> window, <string> win_text = "", <string | handle> control)
	code += au3.AddFunction("ControlFocus", "window, text, control");
	// ControlGetHandle(<string | handle> window, <string> win_text = "", <string> control) => <handle>
	code += au3.AddFunction("ControlGetHandle", "window, text, control");
	// ControlGetPos(<string | handle> window, <string> win_text = "", <string | handle> control, [<int> mode = 0]) => {<int> x, <int> x, <int> width, <int> height}
	code += au3.AddFunction("ControlGetPos", "window, text, control, mode");
	// ControlGetText(<string | handle> window, <string> win_text = "", <string | handle> control) => <string> control_text
	code += au3.AddFunction("ControlGetText", "window, text, control");
	// ControlHide(<string | handle> window, <string> win_text = "", <string | handle> control)
	code += au3.AddFunction("ControlHide", "window, text, control");
	// ControlMove(<string | handle> window, <string> win_text = "", <string | handle> control, <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int> state
	code += au3.AddFunction("ControlMove", "window, text, control, x, y, w, h");
	// ControlSend(<string | handle> window, <string> win_text = "", <string | handle> control, <string> send, [<int> mode]) => <int> state
	code += au3.AddFunction("ControlSend", "window, text, control, send, mode");
	// ControlSetText(<string | handle> window, <string> win_text = "", <string | handle> control, <string> newtext) => <int> state
	code += au3.AddFunction("ControlSetText", "window, text, control, newtext");
	// ControlShow(<string | handle> window, <string> win_text = "", <string | handle> control)
	code += au3.AddFunction("ControlShow", "window, text, control");
	// MouseClick([<string> mouse_btn = "LEFT"], [<int> x], [<int> y], [<int> nclick = 1], [<int> speed = -1]) => <int> state
	code += au3.AddFunction("MouseClick", "button, x1, y1, click, speed");
	// MouseClickDrag(<string> mouse_btn, <int> x1, <int> y1, <int> x2, <int> y2, [<int> speed = -1]) => <int> state
	code += au3.AddFunction("MouseClickDrag", "button, x1, y1, x2, y2, speed");
	// MouseClickDown([<string> mouse_btn = "LEFT"]) => <int> state
	code += au3.AddFunction("MouseClickDown", "button");
	// MouseGetCursor() => <int> cursor
	code += au3.AddFunction("MouseGetCursor", "");
	// MouseGetPos() => {int x, int y}
	code += au3.AddFunction("MouseGetPos", "x, y");
	// MouseMove(<int> x, <int> y, [<int> speed = -1]) => <int> state
	code += au3.AddFunction("MouseMove", "x, y, speed");
	// MouseUp([<string> mouse_btn = "LEFT"])
	code += au3.AddFunction("MouseUp", "button");
	// MouseWheel(<string> direction, [<int> click = 1])
	code += au3.AddFunction("MouseWheel", "direction, click");
	// Opt(<string> option, <int> value) => <int> state
	code += au3.AddFunction("Opt", "option, value");
	// PixelChecksum(<int> left, <int> top, <int> right, <int> bottom, [<int> step = 1]) => <int> bool
	code += au3.AddFunction("PixelChecksum", "left, top, right, bottom, step");
	// PixelGetColor([<int> x], [<int> y]) => <int> dec_color
	code += au3.AddFunction("PixelGetColor", "x, y");
	// PixelSearch(<int> left, <int> top, <int> right, <int> bottom, <uint> color, [<int> shade_var = 0], [<int> step = 1])
	code += au3.AddFunction("PixelSearch", "left, top, right, bottom, color, shade");
	// ProcessClose(<string> processname) => <int>
	code += au3.AddFunction("ProcessClose", "process");
	// ProcessExists(<string> processname) => <int> process_id
	code += au3.AddFunction("ProcessExists", "process");
	// ProcessSetPriority(<string> processname, <int> priority) => <int> state
	code += au3.AddFunction("ProcessSetPriority", "process, priority");
	// ProcessWait(<string> processname, [<int> timeout]) => <int>
	code += au3.AddFunction("ProcessWait", "process, timeout");
	// ProcessWaitClose(<string> processname, [<int> timeout]) => <int>
	code += au3.AddFunction("ProcessWaitClose", "process, timeout");
	// Run(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
	code += au3.AddFunction("Run", "program, dir, show");
	// RunWait(<string> program, [<string> dir = ""], [<int> show = 1]) => <int>
	code += au3.AddFunction("RunWait", "program, dir, show");
	// RunAs(<string> user, <string> domain, <string> password, <int> logon_flag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
	code += au3.AddFunction("RunAs", "user, domain, password, logon_flag, program, dir, show");
	// RunAsWait(<string> user, <string> domain, <string> password, <int> logon_flag, <string> program, [<string> dir = ""], [<int> show = 1]) => <int>
	code += au3.AddFunction("RunAsWait", "user, domain, password, logon_flag, program, dir, show");
	// Send(<string> code, [<int> mode = 0])
	code += au3.AddFunction("Send", "code, mode");
	// Shutdown(<int> flags) => <int>
	code += au3.AddFunction("Shutdown", "flags");
	// Sleep([<int> milliseconds = 10])
	code += au3.AddFunction("ToolTip", "milliseconds");
	// ToolTip(<string> tip, [<int> x], [<int> y])
	code += au3.AddFunction("ToolTip", "tip, x, y");
	// WinActivate(<string | handle> window, [<string> win_text = ""]) => <int>
	code += au3.AddFunction("WinActivate", "window, text");
	// WinActive(<string | handle> window, [<string> win_text =""]) => <int>
	code += au3.AddFunction("WinActive", "window, text");
	// WinClose(<string | handle> window, [<string> win_text = ""]) => <int>
	code += au3.AddFunction("WinClose", "window, text");
	// WinExists(<string | handle> window, [<string> win_text = ""]) => <int>
	code += au3.AddFunction("WinExists", "window, text");
	// WinGetCaretPos() => {<int> x, <int> y}
	code += au3.AddFunction("WinGetCaretPos", "");
	// WinGetClientSize(<string | handle> window, [<string> text]) => {<int> width, <int> height}
	code += au3.AddFunction("WinGetClientSize", "window, text");
	// WinGetPos(<string | handle> window, <string> win_text = "") => {<int> x, <int> y}
	code += au3.AddFunction("WinGetPos", "window, text");
	// WinGetProcess(<string | handle> window, <string> win_text = "") => <uint>
	code += au3.AddFunction("WinGetProcess", "window, text");
	// WinGetState(<string | handle> window, <string> win_text = "", <>) => <int>
	code += au3.AddFunction("WinGetState", "window, text");
	// WinGetText(<string | handle> window, <string> win_text = "", <>) => <string>
	code += au3.AddFunction("WinGetText", "window, text");
	// WinGetTitle(<string | handle> window, <string> win_text = "") => <string>
	code += au3.AddFunction("WinGetTitle", "window, text");
	// WinGetHandle(<string> window, <string> text = "") => <handle>
	code += au3.AddFunction("WinGetHandle", "window, text");
	// WinKill(<string | handle> window, [<string> win_text = ""]) => <int>
	code += au3.AddFunction("WinKill", "window, text");
	// WinMenuSelectItem(<string | handle> window, <string> win_text = "", <string> item_1, [<string> item_2], [<string> item_N], ...) => <int>
	code += au3.AddFunction("WinMenuSelectItem", "window, text, item_1, item_2, item_3, item_4, item_5, item_6, item_7, item_8");
	// WinMinimizeAll()
	code += au3.AddFunction("WinMinimizeAll", "");
	// WinMinimizeAllUndo()
	code += au3.AddFunction("WinMinimizeAllUndo", "");
	// WinMove(<string | handle> window, <string> win_text = "", <int> x, <int> y, [<int> width = -1], [<int> height = -1]) => <int>
	code += au3.AddFunction("WinMove", "window, text, x, y, w, h");
	// WinSetOnTop(<string | handle> window, <string> win_text = "", [<int> flag = 1]) => <int>
	code += au3.AddFunction("WinSetOnTop", "window, text, flag");
	// WinSetState(<string | handle> window, <string> win_text = "", <int> flag) => <int>
	code += au3.AddFunction("WinSetState", "window, text, flag");
	// WinSetTitle(<string | handle> window, <string> win_text = "", <string> newtitle) => <int>
	code += au3.AddFunction("WinSetTitle", "window, text, newtitle");
	// WinSetTrans(<string | handle> window, <string> win_text = "", <int> transparent) => <int>
	code += au3.AddFunction("WinSetTrans", "window, text, transparent");
	// WinWait(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
	code += au3.AddFunction("WinWait", "window, text, timeout");
	// WinWaitActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
	code += au3.AddFunction("WinWaitActive", "window, text, timeout");
	// WinWaitClose(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
	code += au3.AddFunction("WinWaitClose", "window, text, timeout");
	// WinWaitNotActive(<string | handle> window, <string> win_text = "", [<int> timeout = 0]) => <int>
	code += au3.AddFunction("WinWaitNotActive", "window, text, timeout");
///////////////////////////////////////////////////////////////////////////////////
	// Minimize()
	code += main.AddFunction("Minimize", "");
	// Maximize()
	code += main.AddFunction("Maximize", "");
	// Restore()
	code += main.AddFunction("Restore", "");
	// Hide()
	code += main.AddFunction("Hide", "");
	// Show()
	code += main.AddFunction("Show", "");
	// SetOntop([<int> ontop = 1])
	code += main.AddFunction("SetOntop", "ontop");
	// Print(<string | number | bool> value)
	code += main.AddFunction("Print", "value");
	// MsgBeep([<uint> rate])
	code += main.AddFunction("MsgBeep", "rate");
	// MsgBox(<string> title, <string> text, [<uint> flag = 0], [<handle> parent = 0]) => <int>
	code += main.AddFunction("MsgBox", "title, text_, flag, window");
	// Call(<uint> pointer, [<any> param])
	code += main.AddFunction("Call", "pointer, params");
	// SendMessage(<handle> window, <uint> message, <string | number> w_param, <string| number> l_param) => <int>
	code += main.AddFunction("SendMessage", "handle, message, wparam, lparam");
	// MessageBox(<handle> window, <string> text, <string> title, [<uint> flag = 0]) => <int>
	code += main.AddFunction("MessageBox", "handle, text, title, flag");
	// LoadURL(<string> url)
	code += main.AddFunction2("MainLoadURL", "LoadURL", "url");
	// GoBack()
	code += main.AddFunction2("MainGoBack", "GoBack", "");
	// GoForward()
	code += main.AddFunction2("MainGoForward", "GoForward", "");
	// CanGoBack() => <bool>
	code += main.AddFunction2("MainCanGoBack", "CanGoBack", "");
	// CanGoForward() => <bool>
	code += main.AddFunction2("MainCanGoForward", "CanGoForward", "");
	// Reload()
	code += main.AddFunction2("MainReload", "Reload", "");
	// StopLoad()
	code += main.AddFunction2("MainStopLoad", "StopLoad", "");
	// IsLoading()
	code += main.AddFunction2("MainIsLoading", "IsLoading", "");
	// ChangeTitle(<string> title)
	code += main.AddFunction("ChangeTitle", "title");
///////////////////////////////////////////////////////////////////////////////////////

	CefRegisterExtension("v8/app", code, new Cefau3_Extension(this));
}
