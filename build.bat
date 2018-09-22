@echo off

title building cefau3

set files=cefau3.c api/accessibility_handler.c api/browser.c ^
api/browser_process_handler.c api/callback.c api/command_line.c ^
api/context_menu_handler.c api/cookie.c api/dialog_handler.c ^
api/display_handler.c api/dom.c api/download_hadler.c ^
api/download_item.c api/drag_data.c api/drag_handler.c ^
api/find_handler.c api/focus_handler.c api/frame.c ^
api/geolocation.c api/geolocation_handler.c api/jsdialog_handler.c ^
api/keyboard_handler.c api/life_span_handler.c api/load_handler.c ^
api/menu_model.c api/menu_model_delegate.c api/parser.c ^
api/print_handler.c api/render_handler.c api/render_process_handler.c ^
api/request.c api/request_context_handler.c api/request_handler.c ^
api/resource_bundle_handler.c api/task.c api/types.c ^
api/types_win.c api/v8.c api/values.c base/app.c ^
base/base.c base/client.c custom/ptr.c custom/string.c

set cef_dir=./cef
set release_dir=./release
set object_dir=./release/object
set src_dir=./src

if "%1"=="tcc" (
	call :tcc_gcc tcc
) else if "%1"=="gcc" (
	call :tcc_gcc gcc
) else if "%1"=="msvc" (
	call :msvc
) else if "%1"=="clean" (
	call :clean
) else if "%1"=="" (
	echo     please insert argument!
	call :usage
) else (
	echo     invalid argument!
	call :usage
)

goto :eof

:tcc_gcc (
	set cc=%1
	call :make_dir
	
	call :clean
	for %%i in (%files%) do (
		echo %%~ni.c
		%cc% -w -c -D__GNUC__ -I%cef_dir% -o %object_dir%/%%~ni.o %src_dir%/%%i
	)
	echo cefau3.dll
	%cc% -shared -w -o %release_dir%/cefau3.dll %object_dir%/*.o -L%cef_dir% -llibcef
	echo done!
	goto :eof
)

:msvc (
	set cc=cl
	call :make_dir

	cd release\object
	%cc% /I../../cef /MT /O2 /c ../../src/*.c ../../src/api/*.c ../../src/base/*.c ../../src/custom/*.c
	cd ..
	link /DLL /OUT:cefau3.dll ../cef/libcef.lib user32.lib object/*.obj
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

	rmdir /s /q release\object
	rmdir /s /q release

	goto :eof
)

:make_dir (
	call :clean
	if not exist release mkdir release
	if not exist release\object mkdir release\object
	goto :eof
)

:usage (
	echo     usage: build [arg]
	echo         gcc     - GNU C compiler
	echo         tcc     - Tiny C compiler
	echo         msvc    - Microsoft Visual C/C++ compiler
	echo         clean   - clean all file generated
)