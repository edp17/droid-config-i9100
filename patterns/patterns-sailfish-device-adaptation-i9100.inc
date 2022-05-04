%package -n patterns-sailfish-device-adaptation-i9100
Summary: Jolla HW Adaptation i9100
Requires: droid-hal-i9100
Requires: droid-hal-i9100-img-boot
Requires: droid-hal-i9100-kernel-modules
Requires: droid-config-i9100-sailfish
Requires: droid-config-i9100-pulseaudio-settings
Requires: droid-config-i9100-policy-settings
Requires: droid-config-i9100-preinit-plugin
Requires: droid-config-i9100-flashing
Requires: droid-config-i9100-bluez4
Requires: droid-hal-version-i9100

# Hybris packages
Requires: libhybris-libEGL
Requires: libhybris-libGLESv2
Requires: libhybris-libwayland-egl

# Sensors
Requires: hybris-libsensorfw-qt5-hal

# Vibra
Requires: ngfd-plugin-native-vibrator
#edp17#Requires: qt5-feedback-haptics-native-vibrator

# Needed for /dev/touchscreen symlink
Requires: qt5-plugin-generic-evdev

Requires: pulseaudio-modules-droid
Requires: pulseaudio-modules-droid-glue
#edp17- for bluez4
Requires: pulseaudio-modules-bluez4
# for audio recording to work:
Requires: qt5-qtmultimedia-plugin-mediaservice-gstmediacapture

# These need to be per-device due to differing backends (fbdev, eglfs, hwc, ..?)
Requires: qt5-qtwayland-wayland_egl
Requires: qt5-qpa-hwcomposer-plugin
Requires: qtscenegraph-adaptation

# Add GStreamer v1.0 as standard
Requires: gstreamer1.0
Requires: gstreamer1.0-plugins-good
Requires: gstreamer1.0-plugins-base
Requires: gstreamer1.0-plugins-bad
Requires: nemo-gstreamer1.0-interfaces
# For devices with droidmedia and gst-droid built, see HADK pdf for more information
Requires: gstreamer1.0-droid
Requires: gmp-droid

# This is needed for notification LEDs
Requires: mce-plugin-libhybris

# USB mode controller
Requires: usb-moded

# hammerhead, grouper, and maguro use this in scripts, so include for all
Requires: rfkill

# enable device lock and allow to select untrusted software
Requires: jolla-devicelock-daemon-encsfa

# Enable home encryption
#Requires: sailfish-device-encryption

# For GPS
Requires: geoclue-provider-hybris-hal

# For FM radio on some QCOM devices
#Requires: qt5-qtmultimedia-plugin-mediaservice-irisradio
#Requires: jolla-mediaplayer-radio

# NFC for devices using Android 8 or newer as base
#Requires: nfcd-binder-plugin
#Requires: jolla-settings-system-nfc

# install stuff for bluetooth
Requires: broadcom-bluetooth
Requires: bluetooth-rfkill-event
#Requires: bluetooth-rfkill-event-configs-mer

%description -n patterns-sailfish-device-adaptation-i9100
Pattern with packages for i9100 HW Adaptation

%files -n patterns-sailfish-device-adaptation-i9100
