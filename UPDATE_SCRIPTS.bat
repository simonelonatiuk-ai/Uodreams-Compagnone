@echo off
setlocal

set "URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/UODREAMS%%20Compagnone%%20v2.oajs"
set "REPAIR_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/repair%%20bench.oajs"

set "SCRIPT_DIR=%~dp0"
set "DEST=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO.oajs"
set "BACKUP=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO backup.oajs"
set "REPAIR_DEST=%SCRIPT_DIR%repair bench.oajs"

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
    echo ERRORE: download Compagnone fallito.
    if exist "%BACKUP%" (
        copy /Y "%BACKUP%" "%DEST%" >nul
        echo Backup ripristinato.
    )
    pause
    exit /b 1
)

echo.
echo Download Compagnone completato!
echo Salvato come:
echo %DEST%
echo.

echo Controllo repair bench.oajs...
echo.

if exist "%REPAIR_DEST%" (
    echo repair bench.oajs gia presente.
    echo Non viene riscaricato per non sovrascrivere la tua lista custom.
) else (
    echo repair bench.oajs non trovato.
    echo Download repair bench.oajs...

    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%REPAIR_URL%' -OutFile '%REPAIR_DEST%'"

    if errorlevel 1 (
        echo.
        echo ERRORE: download repair bench.oajs fallito.
        echo Il Compagnone e stato comunque aggiornato.
        pause
        exit /b 1
    )

    echo.
    echo repair bench.oajs scaricato correttamente:
    echo %REPAIR_DEST%
)

echo.
echo Operazione completata!
echo.
echo Ora apri Orion e carica:
echo UODREAMS Compagnone AGGIORNATO.oajs
echo.
pause
