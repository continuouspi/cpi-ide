#!/bin/bash
apt-get update
apt-get install ghc 
apt-get install libncurses5-dev 
apt-get install happy 
apt-get install alex 
apt-get install libcairo2-dev 
apt-get install libpango1.0-dev 
apt-get install gtk+-2.0 
apt-get install glib-2.0 
apt-get install gsl-bin 
apt-get install gsl-ref-html 
apt-get install libgsl0-dev 
apt-get install liblapack-dev 
apt-get install libghc-gtksourceview2-dev 
apt-get install cabal-install 
cabal update
cabal install gtk2hs-buildtools --global
cabal install text hledger gtk MissingH hmatrix data-accessor colour 
cabal install gtksourceview2-0.12.3.1 --reinstall
ghc-pkg unregister Chart
cabal install chart-0.14 
