@echo off
setlocal

set "BASE_URL=https://raw.githubusercontent.com/simonelonatiuk-ai/Uodreams-Compagnone/refs/heads/main"
set "SCRIPT_DIR=%~dp0"

echo.
echo Aggiornamento UODREAMS Compagnone...
echo.

:: ── Bootstrap (scarica come AGGIORNATO per revisione manuale) ─────────────────
set "BOOTSTRAP_URL=%BASE_URL%/UODREAMS%%20Compagnone%%20v2.oajs"
set "BOOTSTRAP_DEST=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO.oajs"
set "BOOTSTRAP_BACKUP=%SCRIPT_DIR%UODREAMS Compagnone AGGIORNATO backup.oajs"

if exist "%BOOTSTRAP_DEST%" (
    copy /Y "%BOOTSTRAP_DEST%" "%BOOTSTRAP_BACKUP%" >nul
    echo Backup bootstrap creato.
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%BOOTSTRAP_URL%' -OutFile '%BOOTSTRAP_DEST%'"
if errorlevel 1 (
    echo ERRORE: download bootstrap fallito.
    if exist "%BOOTSTRAP_BACKUP%" ( copy /Y "%BOOTSTRAP_BACKUP%" "%BOOTSTRAP_DEST%" >nul )
    pause
    exit /b 1
)
echo Bootstrap scaricato: UODREAMS Compagnone AGGIORNATO.oajs

:: ── Script principali (sovrascrittura diretta) ────────────────────────────────
set FILES=Compagnone-Start.oajs Comp-Targeting.oajs Comp-CombatCore.oajs Comp-BuffsDebuffs.oajs Comp-Dungeons.oajs Comp-DoomGauntlet.oajs Comp-Farming.oajs Comp-Events.oajs Comp-Utilities.oajs

for %%F in (%FILES%) do (
    set "FILE_URL=%BASE_URL%/%%F"
    set "FILE_DEST=%SCRIPT_DIR%%%F"
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%BASE_URL%/%%F' -OutFile '%SCRIPT_DIR%%%F'"
    if errorlevel 1 (
        echo ERRORE: download %%F fallito.
    ) else (
        echo Aggiornato: %%F
    )
)

echo.
echo Aggiornamento completato!
echo.
echo Apri Orion e carica: UODREAMS Compagnone AGGIORNATO.oajs (bootstrap)
echo I moduli Comp-*.oajs sono gia stati sovrascritti.
echo.
pause
