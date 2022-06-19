@echo off
call "%~dp0\common\check-admin.cmd"
if %errorlevel% neq 0 exit /B %errorLevel%

defrag.exe /C /H /V
sdelete.exe c: -z
