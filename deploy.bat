@echo off
taskkill /f /im java.exe
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
set "filename=targetname.jar"
java -jar %filename%
pause