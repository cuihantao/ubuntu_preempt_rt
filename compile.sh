#!/bin/sh
KERNEL=linux-3.18.48
RT=patch-3.18.48-rt54
cd ${KERNEL}-rt
export CONCURRENCY_LEVEL=4
make-kpkg clean
sudo time make-kpkg --initrd --revision=0 kernel_image kernel_headers
cd ..
