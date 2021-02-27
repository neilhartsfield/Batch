@echo off 


:: Author: Neil Hartsfield
:: Date 02/27/2021

:: Standalone Post-Install script for Solidcore

:: Examples
REM <installer-file> /s /v" /qn UNLICVER=1 POSTINSTALL=\"C:\\My Dir\\THISSCRIPT.bat\""

REM <installer-file> /s /v" /qn SERIALNUMBER=xxxx-xxxx-xxxx-xxxx-xxxx POSTINSTALL=\"C:\\My Dir\\THISSCRIPT.bat\""

@echo off
set LOGFILE=c:\my\log.txt
call :LOG > %LOGFILE%
exit /B

:LOG

:: Make sure we have necessary files, reg keys, and services running.
if exist "C:\Program Files\McAfee\Solidcore\" (SET /A a = 1) else (SET /A a = 0)
if exist "%SystemRoot%\Windows\System32\drivers\swin.sys" (SET /A b = 1) else (SET /A b = 0)

reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\swin 2>nul >nul
if %ERRORLEVEL% EQU 0 (SET /A c = 1) else (SET /A c = 0)
IF %ERRORLEVEL% EQU 1 echo %time%   ERROR: HKLM\SYSTEM\CurrentControlSet\Services\swin registry key missing.


SC QUERY scsrvc > NUL
IF ERRORLEVEL 1060 (SET /A d = 0) else (SET /A d = 1)
IF ERRORLEVEL 1060 echo %time%   ERROR: Solidcore service not running.

:: Make sure it's all there.
SET /A result = %a% + %b% + %c% + %d%
if %result%==4 (goto sadmin) else (goto oops)


:: Set up Solidcore
:sadmin
echo Enabling Solidcore...
sadmin enable >> %LOGFILE%
timeout /t 2 /nobreak > NUL
echo Putting Solidcore in Update mode...
sadmin bu
timeout /t 2 /nobreak > NUL
echo Disabling Memory Protection...
sadmin features disable mp
timeout /t 2 /nobreak > NUL
goto end

:oops
echo %time%   FAILED: Solidcore criteria missing.
timeout /t 2 /nobreak > NUL
exit b /0

:end
echo %time%   SUCCESS: Finished!
sadmin status
timeout /t 10 /nobreak > NUL

