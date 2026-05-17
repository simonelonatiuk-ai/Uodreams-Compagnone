@echo off
setlocal

:: ==========================================
:: INCOLLA QUI I TUOI 8 LINK DI DOWNLOAD
:: ==========================================
set "URL_1=https://raw.githubusercontent.com/..."
set "URL_2=https://raw.githubusercontent.com/..."
set "URL_3=https://raw.githubusercontent.com/..."
set "URL_4=https://raw.githubusercontent.com/..."
set "URL_5=https://raw.githubusercontent.com/..."
set "URL_6=https://raw.githubusercontent.com/..."
set "URL_7=https://raw.githubusercontent.com/..."
set "URL_8=https://raw.githubusercontent.com/..."

:: ==========================================
:: CONFIGURAZIONE NOMI FILE DI DESTINAZIONE
:: Cambia i nomi tra virgolette se necessario
:: ==========================================
set "SCRIPT_DIR=%~dp0"

set "FILE_1=%SCRIPT_DIR%file_uno.oajs"
set "FILE_2=%SCRIPT_DIR%file_due.oajs"
set "FILE_3=%SCRIPT_DIR%COMPAGNONE_POSITIONS.oajs"
set "FILE_4=%SCRIPT_DIR%file_quattro.oajs"
set "FILE_5=%SCRIPT_DIR%file_cinque.oajs"
set "FILE_6=%SCRIPT_DIR%file_sei.oajs"
set "FILE_7=%SCRIPT_DIR%file_sette.oajs"
set "FILE_8=%SCRIPT_DIR%file_otto.oajs"

:: Definizioni dei file di backup automatically generate
set "BACKUP_1=%FILE_1:.oajs= backup.oajs%"
set "BACKUP_2=%FILE_2:.oajs= backup.oajs%"
set "BACKUP_4=%FILE_4:.oajs= backup.oajs%"
set "BACKUP_5=%FILE_5:.oajs= backup.oajs%"
set "BACKUP_6=%FILE_6:.oajs= backup.oajs%"
set "BACKUP_7=%FILE_7:.oajs= backup.oajs%"
set "BACKUP_8=%FILE_8:.oajs= backup.oajs%"

echo.
echo Avvio aggiornamento pacchetto script...
echo.

:: ------------------------------------------
:: FILE 1
:: ------------------------------------------
echo [1/8] Gestione File 1...
if exist "%FILE_1%" (
    copy /Y "%FILE_1%" "%BACKUP_1%" >nul
    echo Backup creato per File 1.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_1%' -OutFile '%FILE_1%'"
if errorlevel 1 (
    echo ERRORE: download File 1 fallito.
    if exist "%BACKUP_1%" ( copy /Y "%BACKUP_1%" "%FILE_1%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 2
:: ------------------------------------------
echo [2/8] Gestione File 2...
if exist "%FILE_2%" (
    copy /Y "%FILE_2%" "%BACKUP_2%" >nul
    echo Backup creato per File 2.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_2%' -OutFile '%FILE_2%'"
if errorlevel 1 (
    echo ERRORE: download File 2 fallito.
    if exist "%BACKUP_2%" ( copy /Y "%BACKUP_2%" "%FILE_2%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 3 - COMPAGNONE_POSITIONS.oajs (Gestione speciale)
:: ------------------------------------------
echo [3/8] Controllo COMPAGNONE_POSITIONS.oajs...
if exist "%FILE_3%" (
    echo %FILE_3% gia presente.
    echo Salto il download per non sovrascrivere le tue posizioni della GUI.
) else (
    echo File non trovato. Download in corso...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_3%' -OutFile '%FILE_3%'"
    if errorlevel 1 (
        echo ERRORE: download COMPAGNONE_POSITIONS.oajs fallito.
        pause & exit /b 1
    )
    echo Scaricato correttamente.
)
echo.

:: ------------------------------------------
:: FILE 4
:: ------------------------------------------
echo [4/8] Gestione File 4...
if exist "%FILE_4%" (
    copy /Y "%FILE_4%" "%BACKUP_4%" >nul
    echo Backup creato per File 4.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_4%' -OutFile '%FILE_4%'"
if errorlevel 1 (
    echo ERRORE: download File 4 fallito.
    if exist "%BACKUP_4%" ( copy /Y "%BACKUP_4%" "%FILE_4%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 5
:: ------------------------------------------
echo [5/8] Gestione File 5...
if exist "%FILE_5%" (
    copy /Y "%FILE_5%" "%BACKUP_5%" >nul
    echo Backup creato per File 5.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_5%' -OutFile '%FILE_5%'"
if errorlevel 1 (
    echo ERRORE: download File 5 fallito.
    if exist "%BACKUP_5%" ( copy /Y "%BACKUP_5%" "%FILE_5%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 6
:: ------------------------------------------
echo [6/8] Gestione File 6...
if exist "%FILE_6%" (
    copy /Y "%FILE_6%" "%BACKUP_6%" >nul
    echo Backup creato per File 6.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_6%' -OutFile '%FILE_6%'"
if errorlevel 1 (
    echo ERRORE: download File 6 fallito.
    if exist "%BACKUP_6%" ( copy /Y "%BACKUP_6%" "%FILE_6%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 7
:: ------------------------------------------
echo [7/8] Gestione File 7...
if exist "%FILE_7%" (
    copy /Y "%FILE_7%" "%BACKUP_7%" >nul
    echo Backup creato per File 7.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_7%' -OutFile '%FILE_7%'"
if errorlevel 1 (
    echo ERRORE: download File 7 fallito.
    if exist "%BACKUP_7%" ( copy /Y "%BACKUP_7%" "%FILE_7%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FILE 8
:: ------------------------------------------
echo [8/8] Gestione File 8...
if exist "%FILE_8%" (
    copy /Y "%FILE_8%" "%BACKUP_8%" >nul
    echo Backup creato per File 8.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL_8%' -OutFile '%FILE_8%'"
if errorlevel 1 (
    echo ERRORE: download File 8 fallito.
    if exist "%BACKUP_8%" ( copy /Y "%BACKUP_8%" "%FILE_8%" >nul & echo Backup ripristinato. )
    pause & exit /b 1
)
echo Scaricato correttamente.
echo.

:: ------------------------------------------
:: FINE PROCESSO
:: ------------------------------------------
echo.
echo ==========================================
echo Operazione completata con successo!
echo Tutti i file idonei sono stati aggiornati.
echo ==========================================
echo.
pause
