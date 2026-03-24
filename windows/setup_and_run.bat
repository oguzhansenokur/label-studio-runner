@echo off
echo Checking Python...

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python not found. Installing Python...
    winget install -e --id Python.Python.3.11
) else (
    echo Python already installed.
)

echo Checking Label Studio...

python -m pip show label-studio >nul 2>nul
if %errorlevel% neq 0 (
    echo Label Studio not found. Installing Label Studio...
    python -m pip install label-studio
) else (
    echo Label Studio already installed.
)

echo Starting Label Studio...
label-studio

pause