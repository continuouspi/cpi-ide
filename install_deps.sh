#!/bin/bash
#
# Time-stamp: <Thursday 16 October 2014 / install_deps.sh>
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

# Make executables built with cabal available
export PATH=${PATH}:${HOME}/.cabal/bin

# Install tools for building GTK applications in Haskell
cabal install 'gtk2hs-buildtools==0.12.*' 'gtksourceview3==0.12.*' \
              text hledger MissingH hmatrix-gsl data-accessor \
              'Chart==1.2' 'Chart-cairo==1.2.*'

# Now run "make" to build cpi-ide

# 2014-10-15 Notes:
#
#  Restricting gtk2hs-builtools and gtksourceview3 to 0.12.* is because of a
#  change in the gtk2hs 0.13 release --- the type of eventKeyName in gtk3 went
#  from String to DefaultGlibString
#
#  Restricting Chart-cairo to 1.2.* is because of a change in the 1.3 release,
#  where renderabletoFile acquired an additional argument. 
#
#  Restricting Chart to 1.2 is because it seems the dependency solver cannot
#  find a solution without this hint.
#
# A better solution to all of these would be to configure a proper cabal
# build for cpi-ide; better still, put core cpi libraries into a package and
# use cabal build for cpiwb and cpi-ide. 
#
# End of file
