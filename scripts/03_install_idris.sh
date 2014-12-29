#! /bin/bash

clear
echo "Install build tools and required libraries"
sudo apt-get install libtinfo-dev

export PATH=/usr/local/opt/ghc-7.8.4-x86_64-min/bin:$PATH

echo "Install Idris"
cabal install --force-reinstalls --ghc-options=-fno-warn-warnings-deprecations idris
