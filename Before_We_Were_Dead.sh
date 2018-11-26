#!/bin/sh

CURDIR=$(dirname 0)
BENNUDIR=$CURDIR/bgdruntime
 
export LD_LIBRARY_PATH=$BENNUDIR:$LD_LIBRARY_PATH
export PATH=$BENNUDIR:$PATH

bgdc Before.prg
bgdi Before.dcb