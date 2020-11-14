#!/bin/sh

LINE=$(cat /proc/cmdline )
PART_STATUS=$(echo ${LINE:28:14} | awk '{print $1}')

if [ $PART_STATUS = "/dev/mmcblk0p2" ]; then
	NEXT_ROOTFS=/dev/mmcblk1p1
else
	NEXT_ROOTFS=/dev/mmcblk1p2
fi

# Add update marker
mount ${NEXT_ROOTFS} /mnt
touch /mnt/update-ok
umount /mnt

reboot
