@echo off

;= rem check admin permission
net session >nul 2>&1
if %errorLevel% == 0 (
  echo "Success: admin permission confirmed!"
  exit /B 0
) else (
  echo "Failure: admin permission required!"
  exit /B 1
)
