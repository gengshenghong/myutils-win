@echo off

call common\check-admin.cmd
if %errorlevel% neq 0 exit /B %errorLevel%

echo "go"