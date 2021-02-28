@echo off

setlocal ENABLEDELAYEDEXPANSION

REM Define your parameter / switch
set switch=%1

REM Set the batlog up & ask for target log directory location
set /p inputpath="Set log directory (full path): "

REM make the directory path if it doesn't exist & set the batlog location
if exist "%INPUTPATH%" (SET BATLOG="%INPUTPATH%\bat.log") else (mkdir "%INPUTPATH%")
set BATLOG="%INPUTPATH%\bat.log"

REM populate batlog title
echo ************************************** >> %BATLOG%
echo       %date% %time%               		>> %BATLOG%
echo ************************************** >> %BATLOG%

:: Taking the switch in the %1 position and doing something with it

:: Option 1 - findstr from echoing !switch! / %1
REM guess the parameter / switch & set param_value accordingly.
echo %1 | findstr /I /L "1" > NUL
if !errorlevel! EQU 0 (set param_value=1) & echo %date% %time% Property value is: !param_value!

:: Option 2 - if !switch!/%1 == 2
REM if using single switch (e.g. test.bat 2), this works:
if %1==2 (set param_value=2) & echo %date% %time% Property value is: !param_value!

REM log it in the batlog
echo %date% %time% Property value is: !param_value! >> %BATLOG%
