@echo off

rem Nazev kniky (bez .bnl)
set "book=minikniha-lesni-zviratka"

IF NOT EXIST "bnl.yaml" (
    call "..\unpack.cmd"
    exit
)

rem Prejmenovani MP3 souboru na docasne 
call "..\rename.cmd"

rem les
call "..\merge_and_trim.cmd" media_0041 media_0044 0
rem veverka
call "..\merge_and_trim.cmd" media_0058 media_0061 0
rem medvěd
call "..\merge_and_trim.cmd" media_0062 media_0065 0
rem housenka
call "..\merge_and_trim.cmd" media_0076 media_0079 0
rem sova (Hedvika)
call "..\merge_and_trim.cmd" media_0083 media_0086 1100
rem sovička (Evička)
call "..\merge_and_trim.cmd" media_0087 media_0086 900
rem vlk (Arnošt)
call "..\merge_and_trim.cmd" media_0098 media_0101 1200
rem divočák (Hugo)
call "..\merge_and_trim.cmd" media_0105 media_0108 1100
rem myška
call "..\merge_and_trim.cmd" media_0115 media_0118 0
rem sojka
call "..\merge_and_trim.cmd" media_0126 media_0129 900
rem zajíc (Slávek)
call "..\merge_and_trim.cmd" media_0135 media_0138 1100
rem zajíc (Ládík)
call "..\merge_and_trim.cmd" media_0145 media_0138 1200
rem liška (Eliška)
call "..\merge_and_trim.cmd" media_0148 media_0151 1100
rem ptáček
call "..\merge_and_trim.cmd" media_0152 media_0155 0
rem letící ptáček
call "..\merge_and_trim.cmd" media_0156 media_0159 0
rem žába
call "..\merge_and_trim.cmd" media_0163 media_0166 0
rem jelen (Čestmír)
call "..\merge_and_trim.cmd" media_0167 media_0170 1300
rem ježek (jenda)
call "..\merge_and_trim.cmd" media_0177 media_0180 800
rem kuna (Dorotka)
call "..\merge_and_trim.cmd" media_0192 media_0195 950
rem mravenec
call "..\merge_and_trim.cmd" media_0205 media_0208 0
rem mraveniště
call "..\merge_and_trim.cmd" media_0209 media_0208 0
rem jeřabina
rem call "..\merge_and_trim.cmd" media_0210 media_0208 0
rem mravenčí vajíčka
rem call "..\merge_and_trim.cmd" media_0212 media_0208 0
rem nora
rem call "..\merge_and_trim.cmd" media_0213 media_0216 0
rem jezevec (Alfréd)
call "..\merge_and_trim.cmd" media_0217 media_0216 1100

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