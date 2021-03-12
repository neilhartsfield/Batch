@echo off


SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

:: Init variables
set "execution_path=%PROGRAMDATA%\My\"
set platform=0


:: Establish the batlog
if exist "%SYSTEMROOT%\Temp\my\" (SET BATLOG="%SYSTEMROOT%\Temp\my\bat.log") else (mkdir "%SYSTEMROOT%\Temp\my\")
set BATLOG="%SYSTEMROOT%\Temp\my\bat.log"
set current_path=%~dp0

echo ************************************** >> %BATLOG%
echo *     %date% %time%     * >> %BATLOG%
echo ************************************** >> %BATLOG%
echo %date% %time% - Current working directory = !current_path! >> %BATLOG%

:: Set a clear execution path
if exist %execution_path% (rmdir %execution_path% /s /q & mkdir %execution_path%) else (mkdir %execution_path%)

:: Determine 32bit vs 64bit
if exist "%PROGRAMFILES(X86)%" (
	echo %Date% %time% - x86 folder FOUND >> %BATLOG%
	set "progfiles=%ProgramW6432%"
	set platform=x64
) else (
	echo %Date% %time% - x86 folder NOT FOUND >> %BATLOG%
	set "progfiles=%PROGRAMFILES%"
	set platform=x86
)
echo %date% %time% - System platform = %platform% >> %BATLOG%


echo ************************************** >> %BATLOG%
echo *		Exiting              * >> %BATLOG%
echo *     %date% %time%     * >> %BATLOG%
echo ************************************** >> %BATLOG%

exit /b
