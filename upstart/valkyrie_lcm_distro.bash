#!/bin/bash
export DISTRO_BASE="/home/edbot/oh-distro/software"

export PATH=$PATH:$DISTRO_BASE/build/bin
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$DISTRO_BASE/build/lib:$DISTRO_BASE/build/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$DISTRO_BASE/build/lib/pkgconfig:$DISTRO_BASE/build/lib64/pkgconfig:$PKG_CONFIG_PATH
export PYTHONPATH=$DISTRO_BASE/build/lib/python2.7/dist-packages:$PYTHONPATH
