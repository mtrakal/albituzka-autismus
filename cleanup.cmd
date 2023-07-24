@echo off
setlocal

rem Delete all .mp3 files
del /q *.mp3

rem Delete all .yaml files
del /q *.yaml

rem Delete all .dat files
del /q *.dat

echo All .mp3, .yaml, and .dat files deleted from the current directory.
exit /b 0