@echo off
setlocal

set "URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/UODREAMS%%20Compagnone%%20v2.oajs"
set "SCRIPT_DIR=%~dp0"
set "DEST=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO.oajs"
set "BACKUP=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO backup.oajs"

echo.
echo Aggiornamento UODREAMS Compagnone...
echo.
echo File destinazione:
echo %DEST%
echo.

if exist "%DEST%" (
    copy /Y "%DEST%" "%BACKUP%" >nul
    echo Backup creato:
    echo %BACKUP%
    echo.
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%DEST%'"

if errorlevel 1 (
    echo.
    echo ERRORE: download fallito.
    if exist "%BACKUP%" (
        copy /Y "%BACKUP%" "%DEST%" >nul
        echo Backup ripristinato.
    )
    pause
    exit /b 1
)

echo.
echo Download completato!
echo Salvato come:
echo %DEST%
echo.
echo Ora apri Orion e carica:
echo UODREAMS Compagnone AGGIORNATO.oajs
echo.
pause
