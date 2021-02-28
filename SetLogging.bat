REM Method 1 (Short and sweet):

@echo off
setlocal ENABLEDELAYEDEXPANSION

set BATLOG=%SYSTEMROOT%\Temp\bat.log
call :LOG >> %BATLOG%
exit /B

:LOG

echo ************************************** 
echo       %date% %time%               		
echo ************************************** 

:: Rest of script here


:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM Method 2 (Pretty logging):

@echo off
setlocal ENABLEDELAYEDEXPANSION

if exist "%SYSTEMROOT%\Temp\my\" (SET BATLOG="%SYSTEMROOT%\Temp\my\bat.log") else (mkdir "%SYSTEMROOT%\Temp\my\")
set BATLOG="%SYSTEMROOT%\Temp\my\bat.log"

echo ************************************** >> %BATLOG%
echo       %date% %time%               		>> %BATLOG%
echo ************************************** >> %BATLOG%

:: Rest of script here

:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM Method 3 (take user input)

@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Set the batlog up & ask for target log directory location
set /p inputpath="Set log directory (full path): "

REM make the directory path if it doesn't exist & set the batlog location
if exist "%INPUTPATH%" (SET BATLOG="%INPUTPATH%\bat.log") else (mkdir "%INPUTPATH%")
set BATLOG="%INPUTPATH%\bat.log"

REM populate batlog title
echo ************************************** >> %BATLOG%
echo       %date% %time%               		>> %BATLOG%
echo ************************************** >> %BATLOG%

:: Rest of script here
