#!/bin/sh
KERNEL=linux-4.8.15
RT=patch-4.8.15-rt10
KERNEL_SRC=https://www.kernel.org/pub/linux/kernel/v4.x/${KERNEL}.tar.xz
RT_PATCH_SRC=https://www.kernel.org/pub/linux/kernel/projects/rt/4.8/${RT}.patch.xz

type quilt >/dev/null 2>&1 || { echo >&2 "quilt does not exist. Trying to insatll."; sudo apt install quilt;}

wget ${KERNEL_SRC}
tar -Jxvf ${KERNEL}.tar.xz
mv ${KERNEL} ${KERNEL}-rt
rm ${KERNEL}.tar.xz
cd ${KERNEL}-rt
mkdir -p patches
cd patches
wget ${RT_PATCH_SRC}
xz -dk ${RT}.patch.xz
touch series
echo "${RT}.patch" > series
cd ..
quilt push -a
#cp /boot/config-$(uname -r) .config
cd ..
cp rt-kernelconfig ${KERNEL}-rt/.config

echo The kernel ${KERNEL}-rt is now ready to be compiled.
