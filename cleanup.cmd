@echo off
setlocal

rem Delete all .mp3 files
del /q *.mp3 2>NUL

rem Delete all .yaml files
del /q *.yaml 2>NUL

rem Delete all .dat files
del /q *.dat 2>NUL

rem Delete bnl.bnl (sometimes it persists)
del bnl.bnl 2>NUL


echo All .mp3, .yaml, and .dat files deleted from the current directory.
exit /b 0