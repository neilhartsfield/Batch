@echo off
set Address=google.com
set LogDir=C:\pingtest
md %LogDir%

echo PingTest script to monitor network connection.  Control-C to exit.
echo Tests connection by pinging %Address%.  Logs to %LogDir%\logfile.log
echo %date% %time% - Initial tracert (trace route) to %Address% >> %LogDir%\logfile.log
tracert %Address% >> %LogDir%\logfile.log

:Loop
echo %date% %time% - Pinging %Address%
echo %date% %time% - Pinging %Address% >> %LogDir%\logfile.log
PING -n 5 127.0.0.1>nul
%SystemRoot%\system32\ping.exe -n 1 %Address% | %SystemRoot%\system32\find.exe "TTL=" > NUL >> %LogDir%\logfile.log
if %ERRORLEVEL% EQU 0 goto :Loop
echo %date% %time% - %Address% unreachable
echo Trace route %Address% at %date% %time% >> %LogDir%\logfile.log
tracert %Address% >> %LogDir%\logfile.log
goto Loop
