@echo off
net session >nul 2>&1 || (echo. & echo Run Script As Admin & echo. & pause & exit)
set "EXIST=0"
taskkill /im "msedge.exe" /f  >nul 2>&1
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\" (
for /f "delims=" %%a in ('dir /b "C:\Program Files (x86)\Microsoft\Edge\Application\"') do (
cd /d "C:\Program Files (x86)\Microsoft\Edge\Application\%%a\Installer\" >nul 2>&1
if exist "setup.exe" (
set "EXIST=1"
echo - Removing Microsoft Edge
start /w setup.exe --uninstall --system-level --force-uninstall)
))
for /f "delims=" %%a in ('dir /b "C:\Users"') do (
del /S /Q "C:\Users\%%a\Desktop\edge.lnk" >nul 2>&1
del /S /Q "C:\Users\%%a\Desktop\Microsoft Edge.lnk" >nul 2>&1)
