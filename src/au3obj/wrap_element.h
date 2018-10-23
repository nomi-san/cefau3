#pragma once
#include <ObjBase.h>

class AutoItWrapElement
{
public:
	AutoItWrapElement(void);
	AutoItWrapElement(wchar_t* ,wchar_t* ,unsigned long );
	~AutoItWrapElement(void);
	unsigned long GetIndex();
	void SetIndex(unsigned long );
	LPWSTR* GetTypes();
	UINT specparamcount;
	void SetTypes(wchar_t*);
	wchar_t* GetName();
	void SetName(wchar_t*);
private:
    wchar_t* name;
	LPWSTR* types;
    wchar_t* swtypes;
	unsigned long index;
};
