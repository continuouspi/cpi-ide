#!/bin/bash
#
# Time-stamp: <Wednesday 15 October 2014 / install_deps.sh>
#
# Script to install dependencies for cpi-ide.
# After executing this, run "make".
#
# Original by Andrew McCrae, revised Ian Stark

# Arrange to abort if any command fails
set -e

# Install Debian library dependencies
sudo apt-get -y update
sudo apt-get -y install gnome-platform-devel haskell-platform
sudo apt-get -y install libncurses5-dev libgsl0-dev liblapack-dev

# Load latest Haskell package list
cabal update

# Install tools for building GTK applications in Haskell
cabal install 'gtk2hs-buildtools==0.12.*' 

# Make these available
export PATH=${PATH}:${HOME}/.cabal/bin

# Pull in Haskell package dependencies
cabal install 'gtksourceview3==0.12.*'
cabal install text hledger MissingH hmatrix-gsl data-accessor
cabal install mtl Chart-cairo

# Now run "make" to build cpi-ide

# 2014-10-15 Notes:
#
#  Restricting gtk2hs-builtools and gtksourceview3 to 0.12.* is because of a
#  change in the gtk2hs 0.13 release --- the labels on events went from
#  standard strings to some gnome-specific string structure.
#
#  Package "mtl" is in there to prompt an update apparently necessary for
#  Chart-cairo to install --- there is some complex dependency network around
#  transformers going from 0.3 to 0.4 which it seems the solver can't handle.
#
# A better solution to both of these would be to configure a proper cabal
# build for cpi-ide; better still, pull core cpi libraries into package and
# use cabal build for cpiwb and cpi-ide. 
#
# End of file