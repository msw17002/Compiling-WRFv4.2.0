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
echo 'export HDF5=$DIR'
echo 'export NETCDF=$DIR'
echo "==============================================================================="
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
export HDF5=$DIR
export NETCDF=$DIR
sleep 5
echo "==============================================================================="
echo "=================Download and uncompress WRFv4.2.0============================="
#===Set directory structure
#-  apps directory
if [ -d "$HOME/WRF" ]; then
   echo "$HOME/WRF already exists!"
else
   echo 'wget -q https://github.com/wrf-model/WRF/archive/refs/tags/v4.2.tar.gz -O WRF.tar.gz'
   echo 'tar -xvzf WRF.tar.gz'
   echo 'mv WRF-4.2 WRF'
   wget -q https://github.com/wrf-model/WRF/archive/refs/tags/v4.2.tar.gz -O WRF.tar.gz
   tar -xvzf WRF.tar.gz
   mv WRF-4.2 WRF
   sleep 5
fi
echo "==============================================================================="
echo "====================Compile WRF em_real w/mpich================================"
echo 'cd ./WRF'
echo './configure'
echo './compile em_real'
cd ./WRF
./configure
./compile em_real
rm WRF.tar.gz
