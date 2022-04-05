#!/bin/sh

macaddr="DE:AD:BE:EF:96:9D"

qemu-system-x86_64 \
-cpu qemu64 \
-smp 1 \
-kernel `pwd`/bzImage \
-append "root=/dev/sda rootfstype=ext4 rw kgdboc=ttyS0" -m 200m \
-drive file=`pwd`/rootfs.ext2 \
-virtfs local,path=/home/h/linux/shared,mount_tag=host,security_model=none \
-serial tcp::1234,server,nowait \
#-nographic \
#-append "console=ttyS0 root=/dev/sda rootfstype=ext4 rw kgdboc=ttyS0" -m 200m \
##-monitor telnet:127.0.0.1:5000,server,nowait \#open qemu monitor
#-S -gdb tcp::1234
#-append 'kgdbwait ' \
#-fsdev local,id=test_dev,path=/data/host,security_model=none \
#-device virtio-9p-ccw,fsdev=test_dev,mount_tag=test_mount \
#-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=Tsrc \
#-fsdev local,security_model=passthrough,id=fsdev0,path=/data \
#-net tap,ifname=tap1,script=/etc/qemu-ifup,downscript=no \
#-device e1000,netdev=net0,mac=$macaddr -netdev tap,id=net0,script=/etc/qemu-ifup,\
#console=ttyS1
