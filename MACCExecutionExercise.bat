@echo off

echo $url = "https://raw.githubusercontent.com/neilhartsfield/PowerShell/main/Get-Eicar_Random.ps1" > runme2.ps1
echo $getmod = Invoke-WebRequest -Uri $url -OutFile .\tmp.ps1 >> runme2.ps1
echo start-sleep -seconds 2 >> runme2.ps1
echo .\tmp.ps1 >> runme2.ps1
echo start-sleep -milliseconds 50 >> runme2.ps1
echo del .\tmp.ps1 >> runme2.ps1
echo start-sleep -seconds 5 >> runme2.ps1

timeout /t 1 /nobreak >nul

start powershell -ep bypass -command ".\runme2.ps1"

timeout /t 10 /nobreak >nul

del runme2.ps1
