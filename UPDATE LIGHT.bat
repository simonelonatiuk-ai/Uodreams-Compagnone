@echo off
setlocal

set "URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/UODREAMS%%20Compagnone%%20LIGHT%%20v1"
set "REPAIR_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/Repair%%20Bench%%20LIGHT.oajs"
set "POSITIONS_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/compagnone_positions.oajs"
set "FARM_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main/Compagnone%%20Farm%%20LIGHT.oajs"

set "SCRIPT_DIR=%~dp0"
set "DEST=%SCRIPT_DIR%UODREAMS Compagnone LIGHT AGGIORNATO.oajs"
set "BACKUP=%SCRIPT_DIR%UODREAMS Compagnone LIGHT AGGIORNATO backup.oajs"
set "REPAIR_DEST=%SCRIPT_DIR%Repair Bench LIGHT.oajs"
set "POSITIONS_DEST=%SCRIPT_DIR%compagnone_positions.oajs"
set "FARM_DEST=%SCRIPT_DIR%Compagnone Farm LIGHT.oajs"
set "FARM_BACKUP=%SCRIPT_DIR%Compagnone Farm LIGHT backup.oajs"

echo.
echo Aggiornamento UODREAMS Compagnone LIGHT...
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
    echo ERRORE: download Compagnone LIGHT fallito.
    if exist "%BACKUP%" (
        copy /Y "%BACKUP%" "%DEST%" >nul
        echo Backup ripristinato.
    )
    pause
    exit /b 1
)

echo.
echo Download Compagnone LIGHT completato!
echo Salvato come:
echo %DEST%
echo.

echo Controllo Repair Bench LIGHT.oajs...
echo.

if exist "%REPAIR_DEST%" (
    echo Repair Bench LIGHT.oajs gia presente.
    echo Non viene riscaricato per non sovrascrivere la tua lista custom.
) else (
    echo Repair Bench LIGHT.oajs non trovato.
    echo Download Repair Bench LIGHT.oajs...

    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%REPAIR_URL%' -OutFile '%REPAIR_DEST%'"

    if errorlevel 1 (
        echo.
        echo ERRORE: download Repair Bench LIGHT.oajs fallito.
        echo Il Compagnone LIGHT e stato comunque aggiornato.
        pause
        exit /b 1
    )

    echo.
    echo Repair Bench LIGHT.oajs scaricato correttamente:
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
        echo ERRORE: download compagnone_positions.oajs fallito.
        echo Il Compagnone LIGHT e stato comunque aggiornato.
        pause
        exit /b 1
    )

    echo.
    echo compagnone_positions.oajs scaricato correttamente:
    echo %POSITIONS_DEST%
)

echo.
echo Aggiornamento Compagnone Farm LIGHT.oajs...
echo.

if exist "%FARM_DEST%" (
    copy /Y "%FARM_DEST%" "%FARM_BACKUP%" >nul
    echo Backup Compagnone Farm LIGHT creato:
    echo %FARM_BACKUP%
    echo.
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%FARM_URL%' -OutFile '%FARM_DEST%'"

if errorlevel 1 (
    echo.
    echo ERRORE: download Compagnone Farm LIGHT.oajs fallito.
    if exist "%FARM_BACKUP%" (
        copy /Y "%FARM_BACKUP%" "%FARM_DEST%" >nul
        echo Backup Compagnone Farm LIGHT ripristinato.
    )
    echo Il Compagnone LIGHT e stato comunque aggiornato.
    pause
    exit /b 1
)

echo Compagnone Farm LIGHT.oajs aggiornato correttamente:
echo %FARM_DEST%

echo.
echo Operazione completata!
echo.
echo Ora apri Orion e carica:
echo UODREAMS Compagnone LIGHT AGGIORNATO.oajs
echo.
pause