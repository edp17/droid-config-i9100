#!/bin/bash

##Original script by joschobart can be found here: https://together.jolla.com/question/170006/xperia-x-wlan-sharing-not-working/ ##

if [ "$EUID" -ne 0 ]
  then echo "Please run as root (type devel-su first)"
  exit 1
fi

if [[ $1 == "off" ]]; then
  echo "Switch Tethering off..."
  /bin/dbus-send --print-reply --type=method_call --system --dest=net.connman /net/connman/technology/wifi net.connman.Technology.SetProperty string:Powered variant:boolean:false > /dev/null 2>&1
  sleep 1
  echo 0 > /sys/module/bcmdhd/parameters/op_mode
  /bin/dbus-send --print-reply --type=method_call --system --dest=net.connman /net/connman/technology/wifi net.connman.Technology.SetProperty string:Powered variant:boolean:true > /dev/null 2>&1
  sleep 1
  ifconfig wlan0 down
  ifconfig wlan0 up
  systemctl restart connman
  echo "...Tethering should be turned off now"
  exit 0
elif [[ $1 == "on" ]]; then
  echo "Switch Tethering ON.."
  /bin/dbus-send --print-reply --type=method_call --system --dest=net.connman /net/connman/technology/wifi net.connman.Technology.SetProperty string:Powered variant:boolean:false > /dev/null 2>&1
  sleep 1
  echo 2 > /sys/module/bcmdhd/parameters/op_mode
  sleep 1
  echo "Now enable hotspot (\"Settings > Internet sharing\")"
  read -p "Done with the instruction above? Then press [Enter] to continue..."
  ip link set dev wlan0 master tether
  sleep 1
  echo "Enjoy tethering on your Galaxy S2 ;)"
  exit 0
else
  echo "USAGE: $0 <on><off>"
  exit 1
fi

