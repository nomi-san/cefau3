#cs
	file: types/ptr.au3
	author: wuuyi123
#ce

Global $tag_IntPtr = 'ptr'
Global $tag_LongPtr = 'ptr'
Global $tag_DoublePtr = 'ptr'

; int_ptr

func IntPtr_Set($self, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'IntPtr_Set', 'ptr', $self, 'int', $value)
endfunc

func IntPtr_Get($self)
	local $ret = dllcall($__Cefau3Dll__, 'int', 'IntPtr_Set', 'ptr')
	return @error ? 0 : $ret[0]
endfunc

; long_ptr

func LongPtr_Set($self, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'LongPtr_Set', 'ptr', $self, 'long', $value)
endfunc

func LongPtr_Get($self)
	local $ret = dllcall($__Cefau3Dll__, 'long', 'LongPtr_Set', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc

; double_ptr

func DoublePtr_Set($self, $value)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'DoublePtr_Set', 'ptr', $self, 'double', $value)
endfunc

func DoublePtr_Get($self)
	local $ret = dllcall($__Cefau3Dll__, 'double:cdecl', 'DoublePtr_Set', 'ptr', $self)
	return @error ? 0 : $ret[0]
endfunc