#!/bin/bash

echo 1 > /sys/class/misc/notification/notification_enabled
echo 0 > /sys/class/misc/notification/notification_timeout
