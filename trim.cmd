@echo off
setlocal

rem Function to trim MP3 files
:main
if "%~2"=="" (
    echo Usage: %~nx0 file_1 trimLength
    exit /b 1
)
set "file_1=%~1"
set "trimLength=%~2"

if not exist "%file_1%_original.mp3" (
    echo File "%file_1%_original.mp3" not found.
    exit /b 1
)

set "pscommand=ffmpeg -i %file_1%_original.mp3 -t ([string]([int]([float](ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %file_1%_original.mp3)*1000-%trimLength%))+'ms') -c copy %file_1%_trimmed.mp3"

rem Trim the %file_1%.mp3 file using ffmpeg
if %trimLength% EQU 0 (
    copy %file_1%_original.mp3 %file_1%_trimmed.mp3
) else (
    call :trim
)

rem Move the trimmed files and overwrite the original file
move /Y %file_1%_trimmed.mp3 "%file_1%.mp3"

echo Files trimmed successfully.
exit /b 0

rem Trim the %file_1%.mp3 file using ffmpeg
:trim
set "pscommand=ffmpeg -i %file_1%_original.mp3 -t ([string]([int]([float](ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %file_1%_original.mp3)*1000-%trimLength%))+'ms') -c copy %file_1%_trimmed.mp3"
powershell -command "%pscommand%"