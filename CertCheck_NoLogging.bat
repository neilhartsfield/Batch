@echo off
setlocal ENABLEDELAYEDEXPANSION

:: Author - Neil Hartsfield
:: Last modified - 08/25/2021

:: Query all certificates blobs from KB87096

:: AddTrust External CA Root (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\02FAF3E291435468607857694DF5E45B68851868" >nul 2>nul
set blob[0]=%errorlevel%

:: DigiCert Assured ID Root CA (2031)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\0563B8630D62D75ABBC8AB1E4BDFB5A899B24D43" >nul 2>nul
set blob[1]=%errorlevel%

:: USERTrust RSA Certification Authority (2038)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\2B8F1B57330DBBA2D07A6C51F70EE90DDAB9AD8E" >nul 2>nul
set blob[2]=%errorlevel%

:: VeriSign Universal Root Certification Authority (2037)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\3679CA35668772304D30A5FB873B0FA77BB70D54" >nul 2>nul
set blob[3]=%errorlevel%

:: VeriSign Class 3 Public Primary Certification Authority - G5 (2036)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\4EB6D578499B1CCF5F581EAD56BE3D9B6744A5E5" >nul 2>nul
set blob[4]=%errorlevel%

:: Microsoft Code Verification Root (2025)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\8FBE4D070EF8AB1BCCAF2A9D5CCAE7282A2C66B3" >nul 2>nul
set blob[5]=%errorlevel%

:: GlobalSign Root CA (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\B1BC968BD4F49D622AA89A81F2150152A41D829C" >nul 2>nul
set blob[6]=%errorlevel%

:: AAA Certificate Services (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\D1EB23A46D17D68FD92564C2F1F1601764D8E349" >nul 2>nul
set blob[7]=%errorlevel%

:: GlobalSign (2029)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\D69B561148F01C77C54578C10926DF5B856976AD" >nul 2>nul
set blob[8]=%errorlevel%

:: UTN-USERFirst-Object (2019)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\E12DFB4B41D7D9C32B30514BAC1D81D8385E2D46" >nul 2>nul
set blob[9]=%errorlevel%

:: Intermediate Certificates

:: GlobalSign CodeSigning CA - SHA256 - G3 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\090D03435EB2A8364F79B78CB173D35E8EB63558" >nul 2>nul
set blob[10]=%errorlevel%

:: GlobalSign (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\0BBFAB97059595E8D1EC48E89EB8657C0E5AAE71" >nul 2>nul
set blob[11]=%errorlevel%

:: McAfee Code Signing CA 2 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\17661DFBA03E6AAA09142E012D216864F01D1F5E" >nul 2>nul
set blob[12]=%errorlevel%

:: DigiCert SHA2 Assured ID Timestamping CA (2031)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\3BA63A6E4841355772DEBEF9CDCF4D5AF353A297" >nul 2>nul
set blob[13]=%errorlevel%

:: VeriSign Class 3 Code Signing 2010 CA (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\495847A93187CFB8C71F840CB7B41497AD95C64F" >nul 2>nul
set blob[14]=%errorlevel%

:: McAfee OV SSL CA 2 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\9151B539751B891401C745A9DE301CBDBADF3FB6" >nul 2>nul
set blob[15]=%errorlevel%

:: AddTrust External CA Root (2023)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\A75AC657AA7A4CDFE5F9DE393E69EFCAB659D250" >nul 2>nul
set blob[16]=%errorlevel%

:: COMODO RSA Code Signing CA (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\B69E752BBE88B4458200A7C0F4F5B3CCE6F35B47" >nul 2>nul
set blob[17]=%errorlevel%

:: GlobalSign Root CA (2021)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\CC1DEEBF6D55C2C9061BA16F10A0BFA6979A4A32" >nul 2>nul
set blob[18]=%errorlevel%

:: USERTrust RSA Certification Authority by AAA Certificate Services (2028)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\D89E3BD43D5D909B47A18977AA9D5CE36CEE184C" >nul 2>nul
set blob[19]=%errorlevel%

:: USERTrust RSA Certification Authority (2020)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\EAB040689A0D805B5D6FD654FC168CFF00B78BE3" >nul 2>nul
set blob[20]=%errorlevel%

:: GlobalSign CodeSigning CA - G3 (2024)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates\F1E7B6C0C10DA9436ECC04FF5FC3B6916B46CF4C" >nul 2>nul
set blob[21]=%errorlevel%

:: Check if we have any missing certs from above queries
for %%a in (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21) do (
if !blob[%%a]! == 0 (goto allgood) else (goto missing)
)

:allgood
echo You've got all the required root certificates.
goto End

:missing
echo You're missing root certs.

:End
exit /b 0
