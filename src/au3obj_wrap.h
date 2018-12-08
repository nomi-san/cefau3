#ifndef AU3OBJ_WRAP_H
#define AU3OBJ_WRAP_H

#ifdef __cplusplus
extern "C" {
#endif

#include <windows.h>

typedef void Au3Obj;

typedef void(__stdcall *AUTOITSETPTRPROXY)(Au3Obj*, void*);
typedef Au3Obj* (*AU3OBJCLONE)(Au3Obj*);

AUTOITSETPTRPROXY Au3Obj_SetPtr;
extern Au3Obj* Au3Obj_Clone(Au3Obj*); // from "au3obj/au3obj.cc"

#ifdef __cplusplus
}
#endif

#endif