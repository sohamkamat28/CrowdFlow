@echo off
setlocal
cd /d "%~dp0"
if not exist .venv\Scripts\python.exe (
  py -3.12 -m venv .venv
  if errorlevel 1 (
    echo Install Python 3.12 from https://www.python.org/downloads/ with the Python launcher enabled.
    pause
    exit /b 1
  )
)
.venv\Scripts\python.exe -c "import sys; sys.exit(sys.version_info[:2] != (3, 12))"
if errorlevel 1 (
  echo The existing .venv uses a different Python version. Rename it and rerun setup with Python 3.12 installed.
  pause
  exit /b 1
)
.venv\Scripts\python.exe -m pip install -r requirements.txt
if errorlevel 1 (
  echo Dependency installation failed. Check the message above and rerun setup.bat.
  pause
  exit /b 1
)
echo Setup complete. Double-click run.bat to start the app.
pause
