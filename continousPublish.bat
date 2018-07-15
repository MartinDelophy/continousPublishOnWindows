@echo off

set username="username"
set password="password"
set targeturl="targetUrl"
set remoteAddress="remoteAddress"
set "targetUrlBat=%targeturl%/deploy.bat"
net use \\%remoteAddress%  %password% /user:%username% 

set /p filepath=plase input filepath:

copy %filepath%  %targeturl%


set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%
set /a mm =%mi%
set "timing=%hh%:%mm%:%ss%"

schtasks /create /s %remoteAddress% /tn "test" /tr %targetUrlBat% /u "Administrator" /p "Admin@123" /sc once /st %timing%
schtasks /run /tn "test" /s %remoteAddress% /u %username% /p %password% 
net use \\%remoteAddress% del
pause