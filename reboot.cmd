@echo off
call "%~dp0\common\check-admin.cmd"
if %errorlevel% neq 0 exit /B %errorLevel%

shutdown.exe /r /t 0
