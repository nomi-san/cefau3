#cs
	file: base/base.au3
	author: wuuyi123
#ce

#include-once


global $tag_CefBase = 'uint Size;ptr AddRef;ptr Release;ptr HasOneRef;'

#cs
#include '../autoitobject.au3'

_autoitobject_startup()

$a = _autoitobject_create()

_autoitobject_addmethod($a, 'abc', '__abc')

$a.abc = 9

msgbox(0, '', $a.abc)

func __abc($self, $a = 0)
	if @numparams == 1 then return 9
	msgbox(0, '', $a)
endfunc
#ce