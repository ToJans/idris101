#! /bin/bash

clear
echo "Install build tools and required libraries"
sudo apt-get install build-essential ca-certificates
sudo apt-get install libgmp10 libgmp-dev libffi-dev zlib1g-dev

echo "Remove /usr/local/opt/ghc-7.8.4-x86_64-min"
rm -rf /usr/local/opt/ghc-7.8.4-x86_64-min

echo "GOTO /tmp"
cd /tmp
echo "Download files"
if [ -e /tmp/ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2 ]; 
then
    echo "GHC file already present."
else
    echo "Downloading file.."
    wget https://www.haskell.org/ghc/dist/7.8.4/ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2
fi

echo "Install GHC"
tar -jxf /tmp/ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2
cd ghc-7.8.4
./configure --prefix=/usr/local/opt/ghc-7.8.4-x86_64-min
sudo make install
cd ..
rm -rf ghc-7.8.4

#rm -rf /tmp/ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2

