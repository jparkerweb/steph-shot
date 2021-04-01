@echo off
SETLOCAL

rem ----------------------------------
rem -- create destination directory --
rem ----------------------------------
if exist %USERPROFILE%\Downloads\Steph-Shots (
	echo off
) else (
	mkdir %USERPROFILE%\Downloads\Steph-Shots && echo %USERPROFILE%\Downloads\Steph-Shots created
)

rem --------------------------------------------------------------
rem -- get argument and test if capture is for screen or window --
rem --------------------------------------------------------------
set arg1=%1
set arg2=%2

if "%arg1%"=="" (
	set arg1="2000"
)

set res=false
if not "%arg2%"=="" (
	if "%arg2%"=="window" (
		set res=true
	)
)

set sshotpath="%USERPROFILE%\Downloads\Steph-Shots\~$currdate.MMddyyyy$-~$currtime.HHmmss$.png"
if "%res%"=="true" (
	rem --------------------
	rem -- capture window --
	rem --------------------
	libs\nircmd.exe savescreenshotwin %sshotpath%
) else (
	rem --------------------
	rem -- capture screen --
	rem --------------------
	libs\nircmd.exe savescreenshot %sshotpath%
)

rem -----------------------------------
rem -- copy saved image to clipboard --
rem -----------------------------------
libs\nircmd.exe clipboard copyimage %sshotpath%

rem -----------------------------------------
rem -- let user know screen shot was taken --
rem -----------------------------------------
echo Screen Shot taken
libs\nircmd.exe trayballoon "Steph Shot" "Screenshot was saved: %sshotpath%" "shell32.dll,15" %arg1%

exit