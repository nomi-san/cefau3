#include "au3obj_wrap.h"
#include "util.h"

AUTOITSETPTRPROXY Au3Obj_SetPtr;

EXPORT(void) Au3Obj_Init2(AUTOITSETPTRPROXY fn)
{
	Au3Obj_SetPtr = fn;
}