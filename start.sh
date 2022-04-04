#!/bin/sh

macaddr="DE:AD:BE:EF:96:9D"

qemu-system-x86_64 \
-cpu qemu64 \
-smp 1 \
-kernel `pwd`/bzImage \
-append "root=/dev/sda console=ttyS0 rootfstype=ext4 rw" -m 200m \
-drive file=`pwd`/rootfs.ext2 \
-nographic \
-virtfs local,path=/home/h/linux/shared,mount_tag=host,security_model=none \
#-fsdev local,id=test_dev,path=/data/host,security_model=none \
#-device virtio-9p-ccw,fsdev=test_dev,mount_tag=test_mount \
#-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=Tsrc \
#-fsdev local,security_model=passthrough,id=fsdev0,path=/data \
#-net tap,ifname=tap1,script=/etc/qemu-ifup,downscript=no \
#-device e1000,netdev=net0,mac=$macaddr -netdev tap,id=net0,script=/etc/qemu-ifup,\
#-S -gdb tcp::9000 
