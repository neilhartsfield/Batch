@echo off

:: Purpose of batch file
:: Neil Hartsfield

SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

:: Init variables
SET "execution_path=%PROGRAMDATA%\My\"
SET platform=0


:: Establish the batlog
if exist "%SYSTEMROOT%\Temp\my\" (SET BATLOG="%SYSTEMROOT%\Temp\my\bat.log") else (mkdir "%SYSTEMROOT%\Temp\my\")
set BATLOG="%SYSTEMROOT%\Temp\my\bat.log"
set current_path=%~dp0

echo ************************************** >> %BATLOG%
echo       %date% %time%               		>> %BATLOG%
echo ************************************** >> %BATLOG%
echo %date% %time% - Current working directory = !current_path! >> %BATLOG%

:: Set a clear execution path
if exist %execution_path% (rmdir %execution_path% /s /q & mkdir %execution_path%) else (mkdir %execution_path%)

:: Determine 32bit vs 64bit

if exist "%PROGRAMFILES(X86)%" (
    echo %Date% %time% - x86 folder found >> %BATLOG%
	  set "progfiles=%ProgramW6432%"
	  set platform=x64
) else (
  	echo %Date% %time% - x86 folder not found >> %BATLOG%
	  set "progfiles=%PROGRAMFILES%"
	  set platform=x86
)
echo %date% %time% - System platform is %platform% >> %BATLOG%
