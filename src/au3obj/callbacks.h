#pragma once
#include <windows.h>
#include <ObjBase.h>

class AutoItObject;
class AutoItWrapObject;
typedef BOOL (__stdcall *AUTOITFUNCTIONPROXY)(LPCWSTR,AutoItObject*);