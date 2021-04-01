@echo off

rem ---------------------------
rem -- get path for shortcut --
rem ---------------------------
setlocal ENABLEDELAYEDEXPANSION
set directory=%cd%
set empty=
set directory=%directory:\libs=!empty!%
set icon=%directory%\libs\steph-shot.ico

rem -----------------------------
rem -- create desktop shortcut --
rem -----------------------------
nircmd.exe shortcut "%directory%\steph-shot.cmd" "~$folder.desktop$" "Steph-Shot" "" "%icon%" "" "min" "" "Ctrl+Shift+A"

exit