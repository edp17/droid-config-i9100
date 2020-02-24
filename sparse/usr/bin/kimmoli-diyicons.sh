#!/bin/bash

# Check that we run this as root
whoami | grep -q root || { echo needs to run as root. quitting; exit; }

# check that proper scale is given as argument
if [[ ! "$1" =~ "^[0-2]\.[0-9]{1,2}$" ]] ; then
  echo missing argument. give scale, e.g. 1.8. quitting
  exit
fi

# Check theme path
if [ -d "/usr/share/themes/sailfish-default/meegotouch/z1.0" ]; then
  THEMEPATH=sailfish-default
elif [ -d "/usr/share/themes/jolla-ambient/meegotouch/z1.0" ]; then
  THEMEPATH=jolla-ambient
else
  echo theme path not found. quitting
  exit
fi

# Check is imagemagick installed (this uses mogrify)
if [ ! -f "/usr/bin/mogrify" ] ; then
  echo imagemagick missing
  read -r -p "do you want to install it now? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    curl https://openrepos.net/sites/default/files/packages/500/imagemagick-6.8.8-7.armv7hl.rpm -o /tmp/imagemagick.armv7hl.rpm
    if [ ! -f "/tmp/imagemagick.armv7hl.rpm" ] ; then
      echo failed to download imagemagick. quitting
      exit
    fi
    pkcon install-local /tmp/imagemagick.armv7hl.rpm -y
    rm /tmp/imagemagick.armv7hl.rpm
  else
    echo oh ok. quitting
    exit
  fi
fi

echo Using $THEMEPATH

SCALE=`awk "BEGIN {print $1*100/2.0}"`
echo using scale $SCALE%

# copy
echo copying
cp -r /usr/share/themes/$THEMEPATH/meegotouch/z2.0 /usr/share/themes/$THEMEPATH/meegotouch/z$1

# rescale
echo rescaling
mogrify -resize $SCALE% /usr/share/themes/$THEMEPATH/meegotouch/z$1/icons/*.png

# setting new pixel ratio
echo unlocking pixel-ratio
rm -f /etc/dconf/db/vendor.d/locks/silica-configs.txt
dconf update
su -l nemo -c "dconf write /desktop/sailfish/silica/theme_pixel_ratio $1"

# restart lipstick
echo restarting lipstick
systemctl-user restart lipstick

echo done
