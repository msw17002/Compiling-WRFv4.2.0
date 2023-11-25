#!/bin/bash

#===Parameters
echo "==============================================================================="
echo "=======================EXPORTING PARAMETERS===================================="
echo 'export HOME=$(pwd)'
echo 'export DIR=${HOME}/apps/Library'
echo "export CC=gcc"
echo "export CXX=g++"
echo "export FC=gfortran"
echo "export F77=gfortran"
echo 'export apps=${HOME}/apps'
echo 'export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH'
echo 'export PATH=$DIR/bin:$PATH'
echo 'export CPPFLAGS=-I$DIR/include'
echo 'export LDFLAGS=-L$DIR/lib'
echo 'export JASPERLIB=$DIR/lib'
echo 'export JASPERINC=$DIR/include'
echo 'export NETCDF=$DIR'
echo 'export WRF_DIR=$DIR'
echo "==============================================================================="
sleep 5
export HOME=$(pwd)
export DIR=${HOME}/apps/Library
export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran
export apps=${HOME}/apps
export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH
export PATH=$DIR/bin:$PATH
export CPPFLAGS=-I$DIR/include
export LDFLAGS=-L$DIR/lib
export JASPERLIB=$DIR/lib
export JASPERINC=$DIR/include
export NETCDF=$DIR
export WRF_DIR=$HOME/WRF
echo "==============================================================================="
echo "===================CREATING DIRECTORY STRUCTURE================================"
#===Set directory structure
#-  apps directory
if [ -d "$HOME/WPS" ]; then
   echo "$HOME/WPS already exists!"
else
   echo 'git clone https://github.com/wrf-model/WPS.git'
   git clone https://github.com/wrf-model/WPS.git
   sleep 5
fi
#
cd ./WPS/
./configure
./compile
