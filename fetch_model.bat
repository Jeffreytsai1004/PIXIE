@echo off
REM Batch script equivalent of fetch_model.sh for Windows

REM Ensure data directory exists
if not exist "data" mkdir "data"

echo.
echo You need to register at https://smpl-x.is.tue.mpg.de
set /p SMPLX_USER=Username (SMPL-X):
set /p SMPLX_PASS=Password (SMPL-X):
powershell -Command "Invoke-WebRequest -Uri 'https://download.is.tue.mpg.de/download.php?domain=smplx&sfile=SMPLX_NEUTRAL_2020.npz&resume=1' -Method POST -Body @{username='%SMPLX_USER%';password='%SMPLX_PASS%'} -OutFile 'data\\SMPLX_NEUTRAL_2020.npz' -UseBasicParsing"

echo.
echo You need to register at https://pixie.is.tue.mpg.de/
set /p PIXIE_USER=Username (PIXIE):
set /p PIXIE_PASS=Password (PIXIE):
powershell -Command "Invoke-WebRequest -Uri 'https://download.is.tue.mpg.de/download.php?domain=pixie&sfile=pixie_model.tar&resume=1' -Method POST -Body @{username='%PIXIE_USER%';password='%PIXIE_PASS%'} -OutFile 'data\\pixie_model.tar' -UseBasicParsing"
powershell -Command "Invoke-WebRequest -Uri 'https://download.is.tue.mpg.de/download.php?domain=pixie&sfile=utilities.zip&resume=1' -Method POST -Body @{username='%PIXIE_USER%';password='%PIXIE_PASS%'} -OutFile 'data\\utilities.zip' -UseBasicParsing"

cd /d "%~dp0data"
REM Unzip utilities.zip
powershell -Command "Expand-Archive -LiteralPath 'utilities.zip' -DestinationPath '.' -Force"

pause
