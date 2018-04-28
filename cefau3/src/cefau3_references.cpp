#include "inc.h"


/////////////////////////////////////////////////////
CefBrowser* WINAPI Cef_GetBrowser(Cefau3_Handler* handler)
{
	return handler->GetBrowser();
}
////////////////////////////////////////////////

#pragma region for add extension, but it problem =]]
/*/////////////////////////////////////////////////////////////
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

bool WINAPI CefV8Value_IsBool(CefV8Value* value)
{
	return value->IsBool();
}

bool WINAPI CefV8Value_GetBoolValue(CefV8Value* value)
{
	return value->GetBoolValue();
}

CefV8Value* WINAPI CefV8Value_CreateInt(int value)
{
	return CefV8Value::CreateInt(value);
}

bool WINAPI CefV8Value_IsInt(CefV8Value* value)
{
	return value->IsInt();
}

int WINAPI CefV8Value_GetIntValue(CefV8Value* value)
{
	return value->GetIntValue();
}

CefV8Value* WINAPI CefV8Value_CreateUInt(unsigned int value)
{
	return CefV8Value::CreateUInt(value);
}

bool WINAPI CefV8Value_IsUInt(CefV8Value* value)
{
	return value->IsUInt();
}

unsigned int WINAPI CefV8Value_GetUIntValue(CefV8Value* value)
{
	return value->GetUIntValue();
}

CefV8Value* WINAPI CefV8Value_CreateString(LPCWSTR value)
{
	return CefV8Value::CreateString(value);
}

bool WINAPI CefV8Value_IsString(CefV8Value* value)
{
	return value->IsString();
}

LPCWSTR WINAPI CefV8Value_GetStringValue(CefV8Value* value)
{
	return value->GetStringValue().ToWString().c_str();
}

CefV8Value* WINAPI CefV8Value_CreateDouble(double value)
{
	return CefV8Value::CreateDouble(value);
}

bool WINAPI CefV8Value_IsDouble(CefV8Value* value)
{
	return value->IsDouble();
}

double WINAPI CefV8Value_GetDoubleValue(CefV8Value* value)
{
	return value->GetDoubleValue();
}

CefV8Value* WINAPI CefV8Value_CreateNull()
{
	return CefV8Value::CreateNull();
}

bool WINAPI CefV8Value_IsNull(CefV8Value* value)
{
	return value->IsNull();
}

CefV8Value* WINAPI CefV8Value_CreateUndefined()
{
	return CefV8Value::CreateUndefined();
}

bool WINAPI CefV8Value_IsUndefined(CefV8Value* value)
{
	return value->IsUndefined();
}

CefV8Value* WINAPI CefV8Value_CreateObject()
{
	return CefV8Value::CreateObject(NULL, NULL);
}

bool WINAPI CefV8Value_IsObject(CefV8Value* value)
{
	return value->IsObject();
}

bool WINAPI CefV8Value_SetValue(CefV8Value* value, LPCSTR key, CefV8Value* &val)
{
	return value->SetValue(key, val, V8_PROPERTY_ATTRIBUTE_NONE);
}

bool WINAPI CefV8Value_SetValueKey(CefV8Value* value, int key, CefV8Value* &val)
{
	return value->SetValue(key, val);
}

bool WINAPI CefV8Value_SetValueKey(CefV8Value* value, LPCSTR key, CefV8Value* &val)
{
	return value->SetValue(key, val, V8_PROPERTY_ATTRIBUTE_NONE);
}

////////////////////////////////////////////////////

int WINAPI CefV8ValueList_Size(const CefV8ValueList &arg)
{
	return arg.size();
}

CefV8Value* WINAPI CefV8ValueList_Get(const CefV8ValueList &arg, int n)
{
	return arg[n];
}

bool WINAPI CefV8ValueList_IsArray(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsArray();
}

bool WINAPI CefV8ValueList_IsBool(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsBool();
}

bool WINAPI CefV8ValueList_IsInt(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsInt();
}

bool WINAPI CefV8ValueList_IsDouble(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsDouble();
}

bool WINAPI CefV8ValueList_IsFunction(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsFunction();
}

bool WINAPI CefV8ValueList_IsNull(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsNull();
}

bool WINAPI CefV8ValueList_IsObject(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsObject();
}

bool WINAPI CefV8ValueList_IsString(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsString();
}

bool WINAPI CefV8ValueList_IsUInt(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsUInt();
}

bool WINAPI CefV8ValueList_IsUndefined(const CefV8ValueList &arg, int n)
{
	return arg[n]->IsUndefined();
}

int WINAPI CefV8ValueList_GetArrayLength(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetArrayLength();
}

int WINAPI CefV8ValueList_GetBoolValue(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetBoolValue();
}

double WINAPI CefV8ValueList_GetDoubleValue(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetDoubleValue();
}

LPCWSTR WINAPI CefV8ValueList_GetFunctionName(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetFunctionName().ToWString().c_str();
}

int WINAPI CefV8ValueList_GetIntValue(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetIntValue();
}

LPCWSTR WINAPI CefV8ValueList_GetStringValue(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetStringValue().ToWString().c_str();
}

unsigned int WINAPI CefV8ValueList_GetUIntValue(const CefV8ValueList &arg, int n)
{
	return arg[n]->GetUIntValue();
}

CefV8Value* WINAPI CefV8ValueList_GetValue(const CefV8ValueList &arg, int n, int index)
{
	return arg[n]->GetValue(index);
}

CefV8Value* WINAPI CefV8ValueList_GetValueKey(const CefV8ValueList &arg, int n, LPCSTR key)
{
	return arg[n]->GetValue(key);
}

bool WINAPI CefV8ValueList_SetValue(const CefV8ValueList &arg, int n, int index, CefV8Value* value)
{
	return arg[n]->SetValue(index, value);
}

bool WINAPI CefV8ValueList_SetValueKey(const CefV8ValueList &arg, int n, LPCSTR key, CefV8Value* value)
{
	return arg[n]->SetValue(key, value, V8_PROPERTY_ATTRIBUTE_NONE);
}

CefV8Value* WINAPI CefV8ValueList_CreateArray(const CefV8ValueList &arg, int n, int len)
{
	return arg[n]->CreateArray(len);
}

CefV8Value* WINAPI CefV8ValueList_CreateBool(const CefV8ValueList &arg, int n, bool val)
{
	return arg[n]->CreateBool(val);
}

CefV8Value* WINAPI CefV8ValueList_CreateDouble(const CefV8ValueList &arg, int n, double val)
{
	return arg[n]->CreateDouble(val);
}

CefV8Value* WINAPI CefV8ValueList_CreateInt(const CefV8ValueList &arg, int n, int val)
{
	return arg[n]->CreateInt(val);
}

CefV8Value* WINAPI CefV8ValueList_CreateNull(const CefV8ValueList &arg, int n)
{
	return arg[n]->CreateNull();
}

CefV8Value* WINAPI CefV8ValueList_CreateObject(const CefV8ValueList &arg, int n)
{
	return arg[n]->CreateObject(NULL, NULL);
}

CefV8Value* WINAPI CefV8ValueList_CreateString(const CefV8ValueList &arg, int n, LPCSTR val)
{
	return arg[n]->CreateString(val);
}

CefV8Value* WINAPI CefV8ValueList_CreateUInt(const CefV8ValueList &arg, int n, unsigned int val)
{
	return arg[n]->CreateUInt(val);
}

CefV8Value* WINAPI CefV8ValueList_CreateUInt(const CefV8ValueList &arg, int n)
{
	return arg[n]->CreateUndefined();
}
*/
#pragma endregion