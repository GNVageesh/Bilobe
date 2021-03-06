#!/usr/bin/bash
echo "Bilobe Installer Script..."

checkPKGM()
{
    [ -x "$(which $1)" ]
}

function bilobeAPT() {
    clear
    echo "Starting Bilobe Installation Bilobe"
    echo "Checking essentials required"
    sudo apt-get install cmake build-essential
}

function bilobePAC()
{
    clear
    echo "Starting Bilobe Installation Bilobe"
    echo "Checking essentials required"
    sudo pacman -Sy base-devel make cmake
}

function bilobeYum()
{
    clear
    echo "Starting Bilobe Installation Bilobe"
    echo "Checking essentials required"
    sudo yum groupinstall "Development Tools"
    sudo yum install cmake
}

function bilobeDnf()
{
    clear
    echo "Starting Bilobe Installation Bilobe"
    echo "Checking essentials required"
    sudo dnf install cmake gcc-c++ make
}

function buildBilobe() {
    echo "Pulling the latest version of Bilobe from its repo"
    git pull --rebase
    echo "Removing the old build of Bilobe"
    rm -rf build
    echo "Making directory build..."
    mkdir build
    echo "Changing directory..."
    cd build
    echo "Rebuilding Bilobe project..."
    cmake ..
    echo "Rebuilt bilobe..."
    sudo make install
    echo "Successfully updated Bilobe..."
}

if checkPKGM apt-get
then
    bilobeAPT
    buildBilobe
elif checkPKGM pacman
then
    bilobePAC
    buildBilobe
elif checkPKGM dnf
then
    bilobeDnf
    buildBilobe
elif checkPKGM yum
then
    bilobeYum
    buildBilobe
else
    echo "Please install the Requirements manually and build the project once again"
fi
