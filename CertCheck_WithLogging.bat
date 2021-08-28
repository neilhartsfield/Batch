@echo off
setlocal ENABLEDELAYEDEXPANSION
setlocal ENABLEEXTENSIONS

:: Author: Neil Hartsfield
:: Last modified: 08/26/2021

:: Initialize variables
set param=%*
set maconfig=0
set cmdagent=0
REM set PROP=RECEIVED

:: Set up the BATLOG

if exist "%SYSTEMROOT%\Temp\McAfeeLogs\" (SET BATLOG="%SYSTEMROOT%\Temp\McAfeeLogs\CertCheck.log") else (mkdir "%SYSTEMROOT%\Temp\McAfeeLogs\")
set BATLOG="%SYSTEMROOT%\Temp\McAfeeLogs\CertCheck.log"
call :LOG >> %BATLOG%
exit /B

:LOG

:: Begin logging

echo ************************************** 
echo       %date% %time%               		
echo ************************************** 
echo %date% %time% - Checking for missing root certificates in accordance with McAfee KB87096

if exist "%PROGRAMFILES(X86)%" (
	echo %Date% %time% - x86 folder found
	set "progfiles=%ProgramW6432%"
	set platform=x64
) else (
	echo %Date% %time% - x86 folder not found
	set "progfiles=%PROGRAMFILES%"
	set platform=x86
)

::Find maconfig
set maconfig=0
If Exist "%PROGRAMFILES(X86)%\McAfee\Common Framework\maconfig.exe" (SET maconfig="%PROGRAMFILES(X86)%\McAfee\Common Framework\maconfig.exe")
If Exist "C:\Program Files\McAfee\Common Framework\maconfig.exe" (SET maconfig="C:\Program Files\McAfee\Common Framework\maconfig.exe")
If Exist "C:\Program Files\McAfee\Agent\maconfig.exe" (SET maconfig="C:\Program Files\McAfee\Agent\maconfig.exe")
If Exist "%PROGRAMFILES(X86)%\McAfee\Agent\maconfig.exe" (SET maconfig="%PROGRAMFILES(X86)%\McAfee\Agent\maconfig.exe")

::Find cmdagent
set cmdagent=0
If Exist "%PROGRAMFILES(X86)%\McAfee\Common Framework\cmdagent.exe" (SET cmdagent="%PROGRAMFILES(X86)%\McAfee\Common Framework\cmdagent.exe")
If Exist "C:\Program Files\McAfee\Common Framework\cmdagent.exe" (SET cmdagent="C:\Program Files\McAfee\Common Framework\cmdagent.exe")
If Exist "C:\Program Files\McAfee\Agent\cmdagent.exe" (SET cmdagent="C:\Program Files\McAfee\Agent\cmdagent.exe")
If Exist "%PROGRAMFILES(X86)%\McAfee\Agent\cmdagent.exe" (SET cmdagent="%PROGRAMFILES(X86)%\McAfee\Agent\cmdagent.exe")

:: Query all certificates blobs from KB87096 & log results

:: AddTrust External CA Root (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\02FAF3E291435468607857694DF5E45B68851868" >nul 2>nul
set blob[0]=%errorlevel%
if %blob[0]% == 0 (
echo Certificate found: AddTrust External CA Root ^(2020^)
) else (echo *****MISSING*****: AddTrust External CA Root ^(2020^))

:: DigiCert Assured ID Root CA (2031)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\0563B8630D62D75ABBC8AB1E4BDFB5A899B24D43" >nul 2>nul
set blob[1]=%errorlevel%
if %blob[1]% == 0 (
echo Certificate found: DigiCert Assured ID Root CA ^(2031^)
) else (echo *****MISSING*****: DigiCert Assured ID Root CA ^(2031^))

:: USERTrust RSA Certification Authority (2038)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\2B8F1B57330DBBA2D07A6C51F70EE90DDAB9AD8E" >nul 2>nul
set blob[2]=%errorlevel%
if %blob[2]% == 0 (
echo Certificate found: USERTrust RSA Certification Authority ^(2038^)
) else (echo *****MISSING*****: USERTrust RSA Certification Authority ^(2038^))

:: VeriSign Universal Root Certification Authority (2037)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\3679CA35668772304D30A5FB873B0FA77BB70D54" >nul 2>nul
set blob[3]=%errorlevel%
if %blob[3]% == 0 (
echo Certificate found: VeriSign Universal Root Certification Authority ^(2037^)
) else (echo *****MISSING*****: VeriSign Universal Root Certification Authority ^(2037^))

:: VeriSign Class 3 Public Primary Certification Authority - G5 (2036)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\4EB6D578499B1CCF5F581EAD56BE3D9B6744A5E5" >nul 2>nul
set blob[4]=%errorlevel%
if %blob[4]% == 0 (
echo Certificate found: AVeriSign Class 3 Public Primary Certification Authority - G5 ^(2036^)
) else (echo *****MISSING*****: VeriSign Class 3 Public Primary Certification Authority - G5 ^(2036^))

:: Microsoft Code Verification Root (2025)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\8FBE4D070EF8AB1BCCAF2A9D5CCAE7282A2C66B3" >nul 2>nul
set blob[5]=%errorlevel%
if %blob[5]% == 0 (
echo Certificate found: Microsoft Code Verification Root ^(2025^)
) else (echo *****MISSING*****: Microsoft Code Verification Root ^(2025^))

:: GlobalSign Root CA (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\B1BC968BD4F49D622AA89A81F2150152A41D829C" >nul 2>nul
set blob[6]=%errorlevel%
if %blob[6]% == 0 (
echo Certificate found: GlobalSign Root CA ^(2028^)
) else (echo *****MISSING*****: GlobalSign Root CA ^(2028^))

:: AAA Certificate Services (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\D1EB23A46D17D68FD92564C2F1F1601764D8E349" >nul 2>nul
set blob[7]=%errorlevel%
if %blob[7]% == 0 (
echo Certificate found: AAA Certificate Services ^(2028^)
) else (echo *****MISSING*****: AAA Certificate Services ^(2028^))

:: GlobalSign (2029)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\D69B561148F01C77C54578C10926DF5B856976AD" >nul 2>nul
set blob[8]=%errorlevel%
if %blob[8]% == 0 (
echo Certificate found: GlobalSign ^(2029^)
) else (echo *****MISSING*****: GlobalSign ^(2029^))

:: UTN-USERFirst-Object (2019)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\E12DFB4B41D7D9C32B30514BAC1D81D8385E2D46" >nul 2>nul
set blob[9]=%errorlevel%
if %blob[9]% == 0 (
echo Certificate found: UTN-USERFirst-Object ^(2019^)
) else (echo *****MISSING*****: UTN-USERFirst-Object ^(2019^))

:: Intermediate Certificates

:: GlobalSign CodeSigning CA - SHA256 - G3 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\090D03435EB2A8364F79B78CB173D35E8EB63558" >nul 2>nul
set blob[10]=%errorlevel%
if %blob[10]% == 0 (
echo Certificate found: GlobalSign CodeSigning CA - SHA256 - G3 ^(2024^)
) else (echo *****MISSING*****: GlobalSign CodeSigning CA - SHA256 - G3 ^(2024^))

:: GlobalSign CodeSigning CA - SHA256 - G3 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\0BBFAB97059595E8D1EC48E89EB8657C0E5AAE71" >nul 2>nul
set blob[11]=%errorlevel%
if %blob[11]% == 0 (
echo Certificate found: GlobalSign CodeSigning CA - SHA256 - G3 ^(2024^)
) else (echo *****MISSING*****: GlobalSign CodeSigning CA - SHA256 - G3 ^(2024^))

:: McAfee Code Signing CA 2 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\17661DFBA03E6AAA09142E012D216864F01D1F5E" >nul 2>nul
set blob[12]=%errorlevel%
if %blob[12]% == 0 (
echo Certificate found: AMcAfee Code Signing CA 2 ^(2024^)
) else (echo *****MISSING*****: McAfee Code Signing CA 2 ^(2024^))

:: DigiCert SHA2 Assured ID Timestamping CA (2031)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\3BA63A6E4841355772DEBEF9CDCF4D5AF353A297" >nul 2>nul
set blob[13]=%errorlevel%
if %blob[13]% == 0 (
echo Certificate found: DigiCert SHA2 Assured ID Timestamping CA ^(2031^)
) else (echo *****MISSING*****: DigiCert SHA2 Assured ID Timestamping CA ^(2031^))

:: VeriSign Class 3 Code Signing 2010 CA (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\495847A93187CFB8C71F840CB7B41497AD95C64F" >nul 2>nul
set blob[14]=%errorlevel%
if %blob[14]% == 0 (
echo Certificate found: VeriSign Class 3 Code Signing 2010 CA ^(2020^)
) else (echo *****MISSING*****: VeriSign Class 3 Code Signing 2010 CA ^(2020^))

:: McAfee OV SSL CA 2 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\9151B539751B891401C745A9DE301CBDBADF3FB6" >nul 2>nul
set blob[15]=%errorlevel%
if %blob[15]% == 0 (
echo Certificate found: McAfee OV SSL CA 2 ^(2024^)
) else (echo *****MISSING*****: McAfee OV SSL CA 2 ^(2024^))

:: AddTrust External CA Root (2023)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\A75AC657AA7A4CDFE5F9DE393E69EFCAB659D250" >nul 2>nul
set blob[16]=%errorlevel%
if %blob[16]% == 0 (
echo Certificate found: AddTrust External CA Root ^(2023^)
) else (echo *****MISSING*****: AddTrust External CA Root ^(2023^))

:: COMODO RSA Code Signing CA (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\B69E752BBE88B4458200A7C0F4F5B3CCE6F35B47" >nul 2>nul
set blob[17]=%errorlevel%
if %blob[17]% == 0 (
echo Certificate found: COMODO RSA Code Signing CA ^(2028^)
) else (echo *****MISSING*****: COMODO RSA Code Signing CA ^(2028^))

:: GlobalSign Root CA (2021)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\CC1DEEBF6D55C2C9061BA16F10A0BFA6979A4A32" >nul 2>nul
set blob[18]=%errorlevel%
if %blob[18]% == 0 (
echo Certificate found: GlobalSign Root CA ^(2021^)
) else (echo *****MISSING*****: GlobalSign Root CA ^(2021^))

:: USERTrust RSA Certification Authority by AAA Certificate Services (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\D89E3BD43D5D909B47A18977AA9D5CE36CEE184C" >nul 2>nul
set blob[19]=%errorlevel%
if %blob[19]% == 0 (
echo Certificate found: USERTrust RSA Certification Authority by AAA Certificate Services ^(2028^)
) else (echo *****MISSING*****: USERTrust RSA Certification Authority by AAA Certificate Services ^(2028^))

:: USERTrust RSA Certification Authority (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\EAB040689A0D805B5D6FD654FC168CFF00B78BE3" >nul 2>nul
set blob[20]=%errorlevel%
if %blob[20]% == 0 (
echo Certificate found: USERTrust RSA Certification Authority ^(2020^)
) else (echo *****MISSING*****: USERTrust RSA Certification Authority ^(2020^))

:: GlobalSign CodeSigning CA - G3 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\F1E7B6C0C10DA9436ECC04FF5FC3B6916B46CF4C" >nul 2>nul
set blob[21]=%errorlevel%
if %blob[21]% == 0 (
echo Certificate found: GlobalSign CodeSigning CA - G3 ^(2024^)
) else (echo *****MISSING*****: GlobalSign CodeSigning CA - G3 ^(2024^))

:: Check if we have any missing certs from above queries
for %%a in (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21) do (
if !blob[%%a]! == 1 (goto missing)
)

echo %date% %time% - Good news, you've got all the required root certificates.
set PROP=CERTS_OKAY

::Send Properties back to ePO
:sendprops
echo !param! | findstr /I /L "tag"
if !errorlevel! EQU 0 (
	echo %date% %time% TAG parameter found
	echo !param! | findstr /I /L "tag=1"
	if !errorlevel! EQU 0 (
		SET prop_value=1
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=2"
	if !errorlevel! EQU 0 (
		SET prop_value=2
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=3"
	if !errorlevel! EQU 0 (
		SET prop_value=3
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=4"
	if !errorlevel! EQU 0 (
		SET prop_value=4
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=5"
	if !errorlevel! EQU 0 (
		SET prop_value=5
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=6"
	if !errorlevel! EQU 0 (
		SET prop_value=6
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=7"
	if !errorlevel! EQU 0 (
		SET prop_value=7
		echo %date% %time% Property value is: !prop_value!
	)
	echo !param! | findstr /I /L "tag=8"
	if !errorlevel! EQU 0 (
		SET prop_value=8
		echo %date% %time% Property value is: !prop_value!
	)
	echo %date% %time% TAG parameter found. Property value is: !prop_value!
	
	echo %date% %time% Properties value is -custom -prop!prop_value!
	
	if !maconfig! NEQ 0 (
		!maconfig! -custom -prop!prop_value! "%PROP%"
		%cmdagent% -p
		%cmdagent% -c
		%cmdagent% -e
		echo %date% %time% Status %PROP% sent to Custom Property !prop_value! in ePO
		echo %date% %time% Status sent to ePO
	) ELSE (
		echo %date% %time% Status not sent to ePO 
	)
) else (
	echo %date% %time% TAG parameter not found
)

:End
echo %date% %time% Exiting script
echo %date% %time% ----------------------------------
echo %date% %time% ----------------------------------
exit /b 0

:missing
echo %date% %time% - Sorry, you're missing some. Please see KB87096 to install the latest required root certificates.
set PROP=MISSING_CERTS
goto sendprops
