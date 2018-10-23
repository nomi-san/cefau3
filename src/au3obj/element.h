#pragma once
#include <ObjBase.h>

class AutoItElement
{
public:
	AutoItElement(void);
	AutoItElement(wchar_t* name,VARIANT*);
	~AutoItElement(void);
	enum TYPE
	{
		NOTHING, 
		METHOD,
		PROPERTY
	};
	TYPE GetType() const;
	void SetType(TYPE new_type);
	enum SCOPE
	{
		PUBLIC,
		READONLY,
		PRIVATE
	};
	SCOPE GetScope() const;
	void SetScope(SCOPE new_scope);
	void SetData(LPCWSTR);
	void SetData(VARIANT*);
	VARIANT* GetData();
	wchar_t* GetName();
	void SetName(wchar_t*);
private:
	wchar_t* name;
	VARIANT data;
	TYPE type;
	SCOPE scope;
};
