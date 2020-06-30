@echo off
setlocal enabledelayedexpansion

call %*
set ERR=%ERRORLEVEL%
REM : Success
if "%ERR%"=="0" (
    powershell Remove-Item -Recurse -Force \"$env:APPDATA\..\Local\Temp\"
    powershell Remove-Item -Recurse -Force \"${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\"
    exit /b 0
)
REM : Error code 3010 is used to indicate success with a reboot required, see MsiExec.exe error messages for more information.
if "%ERR%"=="3010" (
    powershell Remove-Item -Recurse -Force \"$env:APPDATA\..\Local\Temp\"
    powershell Remove-Item -Recurse -Force \"${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\"
    exit /b 0
)
REM : Error
exit /b %ERR%
