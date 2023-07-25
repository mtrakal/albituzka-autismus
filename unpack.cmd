rem Rozbaleni knihy
call "..\bnl_dis.pl" %book%.bnl -extract
cls
echo "Upravte tento soubor dle potreby a spustte ho znovu."
pause
exit /b 0