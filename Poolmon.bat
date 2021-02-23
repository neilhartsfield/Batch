@echo off

:: Capture Poolmon snapshots every <seconds> and record them to poolmon.log
:: The switches "-p -p" will show Paged pool memory, whereas "-p" will show Non-paged pool.

:loop
echo %DATE% %TIME% >> "c:\my\poolmon.log"
"C:\Program Files (x86)\Windows Kits\10\Tools\x64\Poolmon.exe" -p -p -b -r -n c:\my\poolmon.log
ping -n <seconds> 127.0.0.1 >NULL
GOTO loop
