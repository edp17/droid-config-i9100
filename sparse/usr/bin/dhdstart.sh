#!/usr/bin/env bash

/usr/bin/sudo /system/bin/insmod /system/lib/modules/dhd.ko firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt
