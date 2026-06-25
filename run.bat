@echo off
title DetherCraft Updater
color 0B

echo ==============================================
echo    DetherCraft Modpack Sync...
echo ==============================================
echo.

cd /d "%appdata%\.minecraft"

if not exist packwiz-installer-bootstrap.jar (
    echo [Downloading updater core...]
    curl -s -L -o packwiz-installer-bootstrap.jar https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar
)

echo [Checking and downloading updates...]
java -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/DetherCraft/Modpack/main/pack.toml

echo.
echo ==============================================
echo    Update Complete!
echo ==============================================

set LAUNCHER_STARTED=0

if exist "TLauncher.exe" (
    echo Starting TLauncher...
    start TLauncher.exe
    set LAUNCHER_STARTED=1
) else if exist "TL.exe" (
    echo Starting TL Legacy...
    start TL.exe
    set LAUNCHER_STARTED=1
)

if %LAUNCHER_STARTED%==0 (
    echo.
    echo [i] Auto-start skipped: Launcher not found in default folder.
    echo All mods are installed! Please start your launcher manually.
    echo.
    pause
) else (
    timeout /t 3 >nul
)

exit
