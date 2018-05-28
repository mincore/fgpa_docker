#!/bin/bash

WDIR=$1

if [[ -z "$WDIR" ]];then
    WDIR=`pwd`
else
    WDIR=`realpath $WDIR`
fi

docker run --rm --privileged -it -p 6080:6080 \
    -v $WDIR:/workspace \
    -v /dev/hugepages:/dev/hugepages \
    --device=/dev/fpga0 \
    --user=root\
    sc-centos7
