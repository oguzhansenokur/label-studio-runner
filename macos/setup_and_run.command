#!/bin/bash

echo "====================================="
echo "Python kontrol ediliyor..."
echo "====================================="

if ! command -v python3 &> /dev/null
then
    echo "Python yukleniyor..."
    brew install python@3.11
fi

echo "====================================="
echo "Kurulum klasoru olusturuluyor..."
echo "====================================="

mkdir -p ~/labelstudio
cd ~/labelstudio

echo "====================================="
echo "Sanal ortam olusturuluyor..."
echo "====================================="

python3 -m venv venv
source venv/bin/activate

echo "====================================="
echo "Pip guncelleniyor..."
echo "====================================="

pip install --upgrade pip

echo "====================================="
echo "Label Studio kuruluyor..."
echo "====================================="

pip install label-studio[all]

echo "====================================="
echo "Label Studio baslatiliyor..."
echo "====================================="

label-studio start