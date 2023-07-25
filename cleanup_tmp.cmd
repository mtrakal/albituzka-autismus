@echo off
setlocal

rem Delete all temp .mp3 files
del /q *_original.mp3 2>NUL
del /q *_trimmed.mp3 2>NUL

exit /b 0