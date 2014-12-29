#! /bin/bash

clear
echo "GOTO /tmp"
cd /tmp

if [ -e /tmp/cabal-install-1.20.0.3.tar.gz ];
then
    echo "cabal-install file already present."
else
    wget http://hackage.haskell.org/package/cabal-install-1.20.0.3/cabal-install-1.20.0.3.tar.gz
fi

echo "Install canal-install"
sudo -s <<EOF
 export PATH=/usr/local/opt/ghc-7.8.4-x86_64-min/bin:$PATH
 cd /tmp
 tar -zxf /tmp/cabal-install-1.20.0.3.tar.gz
 cd cabal-install-1.20.0.3
 PREFIX=/usr/local/opt/ghc-7.8.4-x86_64-min ./bootstrap.sh --global
 cd ..
 
 rm -rf cabal-install-1.20.0.3                               
EOF

export PATH=/usr/local/opt/ghc-7.8.4-x86_64-min/bin:$PATH
cabal update
cabal install --root-cmd=sudo --global --prefix=/usr/local/opt/ghc-7.8.4-x86_64-min cabal-install
cabal install --root-cmd=sudo --global --prefix=/usr/local/opt/ghc-7.8.4-x86_64-min alex
cabal install --root-cmd=sudo --global --prefix=/usr/local/opt/ghc-7.8.4-x86_64-min happy