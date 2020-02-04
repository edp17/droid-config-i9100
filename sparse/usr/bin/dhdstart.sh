#!/usr/bin/env bash

/system/bin/insmod /lib/modules/`uname -r`/dhd.ko firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt
