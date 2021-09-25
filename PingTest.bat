@echo off
set Address=www.google.com
set LogDir=C:\pingtest
md %LogDir%
%SystemRoot%\explorer.exe "%LogDir%"
echo PingTest script to monitor network connection.  Control-C to exit.
echo Tests connection by pinging %Address%.  Logs to %LogDir%\logfile.log.
echo %date% %time% Initial tracert (trace route) to %Address% >> %LogDir%\logfile.log
tracert %Address% >> %LogDir%\logfile.log
:Loop
REM  5 second delay
PING -n 5 -w 1 127.0.0.1>nul
echo %date% %time% Pinging %Address%
echo %date% %time% Pinging %Address% >> %LogDir%\logfile.log
%SystemRoot%\system32\ping.exe -n 1 %Address% | %SystemRoot%\system32\find.exe "TTL=" > NUL
if %ERRORLEVEL% EQU 0 goto :Loop
echo %date% %time% PING ERROR - Tracing route to %Address%
echo %date% %time% PING ERROR - Tracing route to %Address% >> %LogDir%\logfile.log
tracert %Address% >> %LogDir%\logfile.log
goto Loop