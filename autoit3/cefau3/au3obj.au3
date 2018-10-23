func Au3Obj_Init()
	local static $fp_ptr = dllcallbackgetptr(dllcallbackregister("__Au3Obj_FuncProxy", "int", "wstr;idispatch"))
	local static $spp_ptr = dllcallbackgetptr(dllcallbackregister("__Au3Obj_SetPtrProxy", "none", "idispatch;ptr"))
	dllcall($__Cefau3Dll__, "none:cdecl", "Au3Obj_Init", "ptr", $fp_ptr, 'ptr', $spp_ptr)
	return @error ? 0 : 1
endfunc

func Au3Obj_Class()
	local $ret = dllcall($__Cefau3Dll__, "idispatch:cdecl", "Au3Obj_Class")
	return @error ? 0 : $ret[0]
endfunc

func Au3Obj_Create()
	local $ret = dllcall($__Cefau3Dll__, "idispatch:cdecl", "Au3Obj_Create")
	return @error ? 0 : $ret[0]
endfunc

func Au3Obj_Clone($obj)
	if not isobj($obj) then return 0
	local $ret = dllcall($__Cefau3Dll__, "idispatch:cdecl", "Au3Obj_Clone", 'idispatch', $obj)
	return @error ? 0 : $ret[0]
endfunc

func Au3Obj_AddMethod(ByRef $obj, $name, $func, $private = false)
	if not isobj($obj) then return 0
	dllcall($__Cefau3Dll__, "none:cdecl", "Au3Obj_AddMethod", "idispatch", $obj, "wstr", $name, "wstr", $func, 'dword', $private ? 2 : 0)
	return @error ? 0 : 1
endfunc

func Au3Obj_AddProperty(ByRef $obj, $name, $flag = $ELSCOPE_PUBLIC, $vData = "")
	local static $st = DllStructCreate($__Au3Obj_tagVARIANT)
	if not isobj($obj) then return 0
	local $pData = 0
	if @numparams = 4 then
		$pData = dllstructgetptr($st)
		__Au3Obj_VariantInit($pData)
		$obj.__bridge__($pData) = $vData
	endif
	dllcall($__Cefau3Dll__, "none:cdecl", "Au3Obj_AddProperty", "idispatch", $obj, "wstr", $name, 'dword', $flag, 'ptr', $pData)
	local $error = @error
	if $pData then __Au3Obj_VariantClear($pData)
	return $error ? 0 : 1
endfunc

func __Au3Obj_SetPtrProxy($self, $ptr)
	if isobj($self) then $self.__ptr = $ptr
endfunc

func __Au3Obj_FuncProxy($func, $self)
	if not isobj($self) then return 0
	local $args = $self.__params__
	if isarray($args) then
		local $ret = call($func, $args)
		if ((@error = 0xdead) and (@extended = 0xbeef)) then return 0
		$self.__error__ = @error
		$self.__result__ = $ret
		return 1
	endif
endfunc

func __Au3Obj_VariantClear($pvarg)
	local $ret = dllcall($__Cefau3Dll__, "long:cdecl", "Au3Obj_VariantClear", "ptr", $pvarg)
	return @error ? 0 : $ret[0]
endfunc

func __Au3Obj_VariantCopy($pvargDest, $pvargSrc)
	local $ret = dllcall($__Cefau3Dll__, "long:cdecl", "Au3Obj_VariantCopy", "ptr", $pvargDest, 'ptr', $pvargSrc)
	return @error ? 0 : $ret[0]
endfunc

func __Au3Obj_VariantFree($pvarg)
	local $ret = dllcall($__Cefau3Dll__, "long:cdecl", "Au3Obj_VariantClear", "ptr", $pvarg)
	If @error then return SetError(1, 0, 1)
	If $ret[0] = 0 then __Au3Obj_CoTaskMemFree($pvarg)
	return $ret[0]
endfunc

func __Au3Obj_VariantInit($pvarg)
	local $ret = dllcall($__Cefau3Dll__, "none:cdecl", "Au3Obj_VariantInit", "ptr", $pvarg)
	return @error ? 0 : 1
endfunc