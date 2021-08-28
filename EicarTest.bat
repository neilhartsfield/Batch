@echo off

:: Since we cannot use this string to generate a test file because characters will get escaped during batch processing
:: Actual : X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
:: Escape : X5O!P%%@AP[4\PZX54(P^^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*

cd %~dp0
echo X5O!P%%@AP[4\PZX54(P^^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* > eicartest.txt