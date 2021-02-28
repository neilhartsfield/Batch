

REM Method 1 (Pretty logging):

@echo off
If Exist "%SYSTEMROOT%\temp\mcafeelogs\" (set BATLOG="%SYSTEMROOT%\Temp\my\log.log")
	else (
	mkdir "%SYSTEMROOT%\Temp\my\"
	set BATLOG="%SYSTEMROOT%\Temp\my\log.log"
)

echo ************************************** >> %BATLOG%
echo       %date% %time%               		>> %BATLOG%
echo ************************************** >> %BATLOG%

:: Rest of script here

:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM Method 2 (Short and sweet):

@echo off
set BATLOG=%SYSTEMROOT%\Temp\bat.log
call :LOG >> %BATLOG%
exit /B

:LOG

:: Rest of script here
