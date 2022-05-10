@echo off
;= rem reference to: https://github.com/retorillo/dos-cd
;= rem 1. change cd to chdir, so you can set alias 'cd=cdplus.cmd %*' simply

setlocal
set args=%*
if "%args%" == "" (
  chdir
  exit /B
)
if "%args%" == "-" (
  if EXIST "%USERPROFILE%\_lastcd" (
    endlocal
    for /F %%i in ('type "%USERPROFILE%\_lastcd"') DO (
        echo %CD% > "%USERPROFILE%\_lastcd"
        chdir /D "%%i"
    )
  )
  exit /B
)
if "%args:~0,1%" == "~" (
  echo %CD% > "%USERPROFILE%\_lastcd"
  endlocal ^
    & chdir /D "%USERPROFILE%%args:~1%"
  exit /B
)
echo %CD% > "%USERPROFILE%\_lastcd"
endlocal ^
  & chdir /D "%args%"