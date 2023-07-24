@echo off

rem Nazev kniky (bez .bnl)
set "book=minikniha-lesni-zviratka"

IF NOT EXIST "bnl.yaml" (
    call :unpack
)

rem Spojeni MP3 souboru bez orezavani
call "..\merge_and_trim.cmd" media_0041 media_0044 0

rem Spojeni a prvni z nich se orizne o 300 ms od konce
call "..\merge_and_trim.cmd" media_0058 media_0061 300

rem Tento MP3 soubor se jen orizne o 300 ms od konce
call "..\trim.cmd" media_0062 300

rem Spojeni souboru zpet 
call "..\bnl_creator.pl"

rem Prejmenovani souboru
ren bnl.bnl %book%_output.bnl

rem Smazani docasnych souboru
call "..\cleanup.cmd"

exit

:unpack
rem Rozbaleni knihy
call "..\bnl_dis.pl" %book%.bnl -extract
cls
echo "Upravte tento soubor dle potreby a spustte ho znovu."
pause
exit