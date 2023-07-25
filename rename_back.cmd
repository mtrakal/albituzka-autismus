@echo off
setlocal enabledelayedexpansion

rem Rename all MP3 files back to standard name
for %%F in (*_original.mp3) do (
    set str=%%~nF
    set str=!str:_original=!
    ren "%%F" !str!.mp3 2>NUL"
)

exit /b 0