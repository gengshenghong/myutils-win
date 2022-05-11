@echo off

setlocal

set /p var=Are You Sure to SHUTDOWN?[Y/N]: 

if "%var%" == "Y" goto go
if "%var%" == "y" goto go

endlocal

echo Failure: confirm required!
exit /B 1

:go
echo Success: confirmed!
shutdown.exe /s /t 0

