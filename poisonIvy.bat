@echo off
cd %~dp0
setlocal enabledelayedexpansion
:START
set userInput=reset
CLS
call :begin MAIN-MENU
ECHO\1. Privacy Things
ECHO\2. Storage Things
ECHO\3. Tweaker Things
ECHO\4. Network Things
ECHO\
ECHO\9. Exit
ECHO\
set /p userInput=PICK YOUR POISON: 

if /i "%userInput%"=="1" (
  goto PRIVACY
) else if /i "%userInput%"=="2" (
  goto STORAGE
) else if /i "%userInput%"=="3" (
  goto TWEAKER
) else if /i "%userInput%"=="4" (
  goto NETWORK
) else if /i "%userInput%"=="9" (
  exit
) else (
  ECHO/
  ECHO/Invalid
  ECHO/
  PAUSE
  goto START
)
goto START

:PRIVACY
set userInput=reset
call :begin PRIVACY-MENU
ECHO\1. Install Registry Hacks
ECHO\     - A set of registry keys to block windows ads ^& telemetry, Need Reboot.
ECHO\
ECHO\2. SophiApp Privacy Toolbox
ECHO\     - Tool to remove Microsoft Telemetry safely.
ECHO\
ECHO\3. O^&O SHUTUP 10++ Anti-Spy Tool
ECHO\     - Advanced anti-spy tool for the truly paranoid.
ECHO\
ECHO\4. O^&O App Buster
ECHO\     - Remove Pre-Install Windows Apps.
ECHO\
ECHO\
ECHO\9. MAIN MENU
ECHO\
set /p userInput=PICK YOUR POISON: 
if /i "%userInput%"=="1" (
  reg import .\resources\ads_remover.reg
  PAUSE
) else if /i "%userInput%"=="2" (
  start .\resources\SophiApp.exe
  PAUSE
) else if /i "%userInput%"=="3" (
  start .\resources\OOSU10.exe
  PAUSE
) else if /i "%userInput%"=="4" (
  start .\resources\OOAPB.exe
  PAUSE
) else if /i "%userInput%"=="9" (
  goto START
) else (
  ECHO/
  ECHO/Invalid Selection.
  ECHO/
  PAUSE
  goto PRIVACY
)
goto PRIVACY

:STORAGE
set userInput=reset
call :begin STORAGE-MENU
ECHO\1. TreeSize Utility
ECHO\    - Scan disk for large files ^& remove them.
ECHO\
ECHO\2. CHKDSK
ECHO\    - Windows Disk Scanner. Needs Reboot.
ECHO\
ECHO\3. DISM Repairs
ECHO\    - Scan corrupted windows files ^& repair.
ECHO\
ECHO\
ECHO\9. MAIN MENU
ECHO\
set /p userInput=PICK YOUR POISON: 
if /i "%userInput%"=="1" (
  start .\resources\TreeSizeFree.exe
  PAUSE
) else if /i "%userInput%"=="2" (
  chkdsk /f /r
  PAUSE
) else if /i "%userInput%"=="3" (
  DISM /Online /Cleanup-Image /ScanHealth
  DISM /Online /Cleanup-Image /RestoreHealth
  PAUSE
) else if /i "%userInput%"=="9" (
  goto START
) else (
  ECHO/
  ECHO/Invalid Selection.
  ECHO/
  PAUSE
  goto STORAGE
)
goto STORAGE

:TWEAKER
set userInput=reset
call :begin TWEAKER-MENU
ECHO\1. Ultimate Windows Tweaker 5
ECHO\2. WinAero Tweaker
ECHO\
ECHO\9. MAIN MENU
ECHO\
set /p userInput=PICK YOUR POISON: 
if /i "%userInput%"=="1" (
  start .\resources\UWT5.exe
  PAUSE
) else if /i "%userInput%"=="2" (
  start .\resources\WinaeroTweaker.exe
  PAUSE
) else if /i "%userInput%"=="9" (
  goto START
) else (
  ECHO/
  ECHO/Invalid Selection.
  ECHO/
  PAUSE
  goto TWEAKER
)
goto TWEAKER

:NETWORK
set userInput=reset
call :begin NETWORK-MENU
ECHO\1. Advanced IP Scanner
ECHO\2. Update Group Policy
ECHO\3. Reset Windows Update Cache
ECHO\4. Reset Network Connection

ECHO\
ECHO\9. MAIN MENU
ECHO\
set /p userInput=PICK YOUR POISON: 
if /i "%userInput%"=="1" (
  start .\resources\advanced_ip_scanner.exe
  PAUSE
) else if /i "%userInput%"=="2" (
  gpupdate /force
  PAUSE
) else if /i "%userInput%"=="3" (
  net stop wuauserv
  net stop bits
  rmdir /s /q %Windir%\SoftwareDistribution\Download
  net start wuauserv
  net start bits
  PAUSE
) else if /i "%userInput%"=="4" (
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
  PAUSE
) else if /i "%userInput%"=="9" (
  goto START
) else (
  ECHO/
  ECHO/Invalid Selection.
  ECHO/
  PAUSE
  goto NETWORK
)
goto NETWORK



:begin
SETLOCAL ENABLEDELAYEDEXPANSION
TITLE EXECUTION_POLICY_MUST_BE_UNRESTRICTED
CLS
ECHO/#############################################################
ECHO/                    EAZY-PEAZY TOOL KIT
ECHO/#############################################################
ECHO ( %1 )
ECHO/-----------------
ENDLOCAL