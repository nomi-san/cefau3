#include "wrap_element.h"
#include "dll.h"

AutoItWrapElement::AutoItWrapElement(void): types(NULL),name(NULL),index((DWORD)-1), specparamcount(0), swtypes(NULL)
{
}

AutoItWrapElement::AutoItWrapElement(wchar_t* new_name,wchar_t* new_types,unsigned long new_index)
{
	this->SetName(new_name);
	this->SetTypes(new_types);
	this->index = new_index;
}

AutoItWrapElement::~AutoItWrapElement(void)
{
	if (this->name) delete [] this->name;
	if (this->specparamcount)
	{
		delete [] this->swtypes;
        delete [] this->types; // line above clears what's inside too
	}
}

wchar_t* AutoItWrapElement::GetName()
{
	return this->name;
}

void AutoItWrapElement::SetName(wchar_t* new_name)
{
	if (this->name) delete [] this->name;
	this->name = new wchar_t[lstrlenW(new_name)+1];
	lstrcpyW(this->name,new_name);
}

LPWSTR* AutoItWrapElement::GetTypes()
{
	return this->types;
}

void AutoItWrapElement::SetTypes(wchar_t* wtypes)
{
	if (this->specparamcount)
	{
		delete [] this->swtypes;
        delete [] this->types; // line above clears what's inside too
	}
	INT iparams=0;
	INT len=0;
	while (wtypes[len]!='\0') // till null-terminator encountered
	{
		if (wtypes[len]==';')
		{
			if (wtypes[len+1]!='\0')
			{
				++iparams; // one more param detected
			}
			else
			{
				wtypes[len]='\0'; // replacing ';\0' with '\0\0' if that's occurred
			}
		}
		++len;
	}
	if (len) ++iparams; // real number of params is +1
	// If there are params specified make and fill array of string pointers
	if (iparams)
	{
		this->specparamcount=iparams;
		this->swtypes = new wchar_t[len+1];
        lstrcpyW(this->swtypes, wtypes);
		this->types = new LPWSTR[iparams];
		types[0] = this->swtypes;
		INT iparam=1;
		INT i=0;
		while (this->swtypes[i]!='\0') // till null-terminator encountered
		{
			if (this->swtypes[i]==';')
			{
				this->swtypes[i]='\0'; // replacing with null-terminator (separator)
				types[iparam] = this->swtypes+i+1; // moving pointer forward and set it to types
				++iparam;
			}
			++i;
		}
	}
	else
	{
		this->specparamcount=0;
	}
}

unsigned long AutoItWrapElement::GetIndex()
{
	return this->index;
}

void AutoItWrapElement::SetIndex(unsigned long new_index)
{
	this->index = new_index;
}
