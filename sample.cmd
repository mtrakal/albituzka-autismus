@echo off

rem Nazev kniky (bez .bnl)
set "book=minikniha-lesni-zviratka"

IF NOT EXIST "bnl.yaml" (
    call "..\unpack.cmd"
    exit
)
rem Prejmenovani MP3 souboru na docasne 
call "..\rename.cmd"

rem Spojeni MP3 souboru bez orezavani
call "..\merge_and_trim.cmd" media_0041 media_0044 0

rem Spojeni a prvni z nich se orizne o 300 ms od konce
call "..\merge_and_trim.cmd" media_0058 media_0061 300

rem Tento MP3 soubor se jen orizne o 300 ms od konce
call "..\trim.cmd" media_0062 300

rem Prejmenovani zpet docasnych souboru na puvodni
call "..\rename_back.cmd"

rem Smazani docasnych (originalnich a editovanych) souboru
call "..\cleanup_tmp.cmd"

rem Spojeni MP3 souboru zpet do BNL knihy
call "..\bnl_creator.pl"

rem Prejmenovani souboru s knihou
move /Y bnl.bnl %book%_output.bnl

rem Smazani docasnych souboru
call "..\cleanup.cmd"