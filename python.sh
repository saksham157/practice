#!/bin/bash

# Check if python3 is installed
if command -v python3 &> /dev/null
then
    echo "Python is already installed"
    python3 --version
else
    echo "Python is not installed. Installing..."

    # Detect OS and install accordingly
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y python3 python3-pip

    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y python3

    elif [ -f /etc/arch-release ]; then
        sudo pacman -Sy python --noconfirm

    else
        echo "Unsupported OS. Install Python manually."
        exit 1
    fi

    echo "Python installation completed"
    python3 --version
fi