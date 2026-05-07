@echo off
setlocal

set "URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/UODREAMS%%20Compagnone%%20v2.oajs"
set "REPAIR_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/repair%%20bench.oajs"
set "POSITIONS_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/compagnone_positions.oajs"
set "FARM_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/compagnone_farm.oajs"

set "SCRIPT_DIR=%~dp0"
set "DEST=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO.oajs"
set "BACKUP=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO backup.oajs"
set "REPAIR_DEST=%SCRIPT_DIR%repair bench.oajs"
set "POSITIONS_DEST=%SCRIPT_DIR%compagnone_positions.oajs"
set "FARM_DEST=%SCRIPT_DIR%compagnone_farm.oajs"
set "FARM_BACKUP=%SCRIPT_DIR%compagnone_farm backup.oajs"

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
echo Controllo compagnone_positions.oajs...
echo.

if exist "%POSITIONS_DEST%" (
    echo compagnone_positions.oajs gia presente.
    echo Non viene riscaricato per non sovrascrivere la posizione salvata della tua GUI.
) else (
    echo compagnone_positions.oajs non trovato.
    echo Download compagnone_positions.oajs...

    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%POSITIONS_URL%' -OutFile '%POSITIONS_DEST%'"

    if errorlevel 1 (
        echo.
        echo ERRORE: downloads compagnone_positions.oajs fallito.
        echo Il Compagnone e stato comunque aggiornato.
        pause
        exit /b 1
    )

    echo.
    echo compagnone_positions.oajs scaricato correttamente:
    echo %POSITIONS_DEST%
)

echo.
echo Aggiornamento compagnone_farm.oajs...
echo.

if exist "%FARM_DEST%" (
    copy /Y "%FARM_DEST%" "%FARM_BACKUP%" >nul
    echo Backup compagnone_farm creato:
    echo %FARM_BACKUP%
    echo.
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%FARM_URL%' -OutFile '%FARM_DEST%'"

if errorlevel 1 (
    echo.
    echo ERRORE: download compagnone_farm.oajs fallito.
    if exist "%FARM_BACKUP%" (
        copy /Y "%FARM_BACKUP%" "%FARM_DEST%" >nul
        echo Backup compagnone_farm ripristinato.
    )
    echo Il Compagnone e stato comunque aggiornato.
    pause
    exit /b 1
)

echo compagnone_farm.oajs aggiornato correttamente:
echo %FARM_DEST%

echo.
echo Operazione completata!
echo.
echo Ora apri Orion e carica:
echo UODREAMS Compagnone AGGIORNATO.oajs
echo.
pause
