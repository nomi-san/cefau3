@echo off

title building cefau3

set files_1=cefau3.c ^
au3obj_wrap.c ^
api/accessibility_handler.c ^
api/drag_data.c ^
api/ptr.c ^
api/app.c ^
api/drag_handler.c ^
api/render_handler.c ^
api/find_handler.c ^
api/render_process_handler.c ^
api/base.c ^
api/focus_handler.c ^
api/request.c ^
api/browser.c ^
api/frame.c ^
api/request_context_handler.c ^
api/request_handler.c ^
api/browser_process_handler.c ^
api/geolocation.c ^
api/resource_bundle_handler.c ^
api/callback.c ^
api/geolocation_handler.c ^
api/string.c ^
api/client.c ^
api/jsdialog_handler.c ^
api/keyboard_handler.c ^
api/task.c ^
api/command_line.c ^
api/life_span_handler.c ^
api/types.c ^
api/context_menu_handler.c ^
api/load_handler.c ^
api/types_win.c ^
api/cookie.c ^
api/menu_model.c ^
api/dialog_handler.c ^
api/menu_model_delegate.c ^
api/v8.c ^
api/display_handler.c ^
api/parser.c ^
api/dom.c ^
api/print_handler.c ^
api/values.c ^
api/download_hadler.c ^
api/process_message.c ^
api/download_item.c

set files_2=au3obj/au3obj.cc ^
au3obj/element.cc ^
au3obj/object.cc ^
au3obj/object_class.cc

set cef_dir=./cef
set release_dir=./release
set object_dir=./release/object
set src_dir=./src

if "%1"=="mingw" (
	call :mingw
) else if "%1"=="msvc" (
	call :msvc
) else if "%1"=="clean" (
	call :clean
) else if "%1"=="sln" (
	call :solution
) else if "%1"=="" (
	echo please insert argument!
	call :usage
) else (
	echo invalid argument!
	call :usage
)

goto :eof

:mingw (
	set cc=gcc
	set cppc=g++

	if not exist release mkdir release
	if not exist release\object mkdir release\object

	call :clean
	
	for %%i in (%files_1%) do (
		echo %%~ni.c
		%cc% -w -c -D__GNUC__ -I%cef_dir% -o %object_dir%/%%~ni.o %src_dir%/%%i
	)

	for %%j in (%files_2%) do (
		echo %%~nj.cc
		%cppc% -w -c -o %object_dir%/%%~nj.o %src_dir%/%%j
	)

	echo cefau3.dll
	%cppc% -shared -w -o %release_dir%/cefau3.dll %object_dir%/*.o -loleaut32 -luuid -L%cef_dir% -llibcef 
	echo done!
	goto :eof
)

:msvc (
	set cc=cl
	call :clean

	if not exist release mkdir release
	if not exist release\object mkdir release\object

	cd release\object
	%cc% /I../../cef /MT /O2 /c ../../src/*.c ../../src/api/*.c ../../src/base/*.c ../../src/custom/*.c
	cd ..
	link /DLL /OUT:cefau3.dll ../cef/libcef.lib user32.lib object/*.obj
	goto :eof
)

:solution (
	if exist vs\cefau3.sln (
		echo Visual Studio solution exist.
		goto :eof
	)
	if not exist vs mkdir vs
	goto :eof
)

:clean (
	if exist release\object\*.* del /Q /F release\object\*.*
	if exist release\*.def del release\*.def
	if exist release\*.dll del release\*.dll
	if exist release\*.lib del release\*.lib

	if exist release\*.exp del release\*.exp
	if exist release\*.pdb del release\*.pdb
	if exist release\*.iobj del release\*.iobj
	if exist release\*.ipdb del release\*.ipdb

	goto :eof
)

:usage (
	echo usage: build [arg]
	echo     mingw   - GNU C/C++ compiler
	echo     msvc    - Microsoft Visual C/C++ compiler
	echo     sln     - create Visual Studio solution
	echo     clean   - clean all file generated
)