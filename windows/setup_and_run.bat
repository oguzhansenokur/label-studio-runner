@echo off
title Label Studio Auto Installer

echo =====================================
echo Python 3.11 kontrol ediliyor...
echo =====================================

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python bulunamadi. Python 3.11 yukleniyor...
    winget install -e --id Python.Python.3.11
)

echo =====================================
echo Sanal ortam olusturuluyor...
echo =====================================

cd %USERPROFILE%
mkdir labelstudio
cd labelstudio

python -m venv venv

call venv\Scripts\activate

echo =====================================
echo Pip guncelleniyor...
echo =====================================

python -m pip install --upgrade pip

echo =====================================
echo Gerekli kutuphaneler kuruluyor...
echo =====================================

pip install django
pip install label-studio
pip install opencv-python
pip install pillow
pip install numpy
pip install pandas
pip install lxml

echo =====================================
echo Label Studio baslatiliyor...
echo =====================================

label-studio

pause