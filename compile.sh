#!/bin/sh
KERNEL=linux-4.8.15
RT=patch-4.8.15-rt10

type make-kpkg >/dev/null 2>&1 || { echo >&2 "make-kpkg does not exist. Trying to insatll..."; sudo apt install kernel-package libssl-dev;} 

cd ${KERNEL}-rt

make-kpkg clean
sudo time make-kpkg -j`getconf _NPROCESSORS_ONLN` --initrd --revision=0 kernel_image kernel_headers
cd ..
