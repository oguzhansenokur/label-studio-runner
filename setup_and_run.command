#!/bin/bash

echo "Checking Python..."

if ! command -v python3 &> /dev/null
then
    echo "Python not found. Installing Python..."
    brew install python
else
    echo "Python already installed."
fi

echo "Checking Label Studio..."

if ! python3 -m pip show label-studio &> /dev/null
then
    echo "Installing Label Studio..."
    python3 -m pip install label-studio
else
    echo "Label Studio already installed."
fi

echo "Starting Label Studio..."
label-studio &

sleep 5
open http://localhost:8080

echo "Done."