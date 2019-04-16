@echo off
color 02
:::Choice
::cls
::set /P q=Enter The Appropriate Hotkey(Connected WifiList="l",Recovery="r"):
::if /I "%q%" EQU "l" goto :wifilist
::if /I "%q%" EQU "r" goto :recovery
::if /I "%q%" EQU "e" goto :exit
::goto :Choice

:wifilist
set "SSID="
cls
echo .........................................................................
netsh wlan show profile | findstr "All User Profiles"
goto :recovery

:recovery
echo .........................................................................
set /P SSID=Enter Desired Wifi Name to Recover Password!: 
netsh wlan show profile "%SSID%" key=clear | findstr "Key Content found"
pause
goto :wifilist
