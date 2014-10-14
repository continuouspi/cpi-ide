#!/bin/bash
set -e
sudo apt-get -y update
sudo apt-get -y install gnome-platform-devel haskell-platform
sudo apt-get -y install libncurses5-dev libgsl0-dev liblapack-dev
cabal update
cabal install 'gtk2hs-buildtools==0.12.*' 
export PATH=${PATH}:${HOME}/.cabal/bin
cabal install 'gtksourceview3==0.12.*'
cabal install text hledger MissingH hmatrix-gsl data-accessor
cabal install 'Chart==1.2' 'Chart-cairo==1.2.*'

# Now run "make" to build cpi-ide