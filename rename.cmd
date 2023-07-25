@echo off
setlocal

rem Rename all MP3 files to _original
for %%F in (*.mp3) do (
    ren "%%F" "%%~nF_original.mp3"
)

exit /b 0