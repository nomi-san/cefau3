#include "element.h"
#include "dll.h"

AutoItElement::AutoItElement(void): type(NOTHING),name(NULL)
{
	VariantInit(&data);
}

AutoItElement::AutoItElement(wchar_t* name,VARIANT *src)
{
	SetName(name);
	VariantCopy(&data,src);
}

AutoItElement::~AutoItElement(void)
{
	if (name) delete [] name;
	VariantClear(&data);
}

wchar_t* AutoItElement::GetName()
{
	return this->name;
}

VARIANT* AutoItElement::GetData()
{
	return &this->data;
}

AutoItElement::TYPE AutoItElement::GetType() const
{
	return this->type;
}

void AutoItElement::SetType(AutoItElement::TYPE new_type)
{
	this->type = new_type;
}

AutoItElement::SCOPE AutoItElement::GetScope() const
{
	return this->scope;
}

void AutoItElement::SetScope(AutoItElement::SCOPE new_scope)
{
	this->scope = new_scope;
}


void AutoItElement::SetData(LPCWSTR new_data)
{
	if (this->data.vt!=VT_EMPTY) VariantClear(&this->data);
	this->data.vt = VT_BSTR;

	this->data.bstrVal = SysAllocString(new_data);
}

void AutoItElement::SetData(VARIANT *new_variant)
{
	VariantCopy(&this->data,new_variant);
}

void AutoItElement::SetName(wchar_t* new_name)
{
	if (name) delete [] name;
	this->name = new wchar_t[lstrlenW(new_name)+1];
	lstrcpyW(name,new_name);
}
