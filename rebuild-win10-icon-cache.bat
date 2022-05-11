@echo off
call common\check-admin.cmd
if %errorlevel% neq 0 exit /B %errorLevel%

setlocal

;= rem 重建windows10的图标缓存（请使用管理员身份的cmd运行）
;= rem 关闭explorer.exe
taskkill /f /im explorer.exe

;= rem 清理系统图标缓存数据库
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"

attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer*"
cd /d "%userprofile%\AppData\Local\Microsoft\Windows\Explorer"
del iconcache_*.db /f
del thumbcache_*.db /f

;= rem 清理系统托盘记忆的图标
echo y | reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y | reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconStreams

;= rem 重启explorer.exe
start explorer

endlocal
