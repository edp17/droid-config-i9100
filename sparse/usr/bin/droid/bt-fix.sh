#!/usr/bin/env bash

#      Copyright (C) 2021 edp17
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#

# Kill patchram
wait 2
/usr/bin/killall brcm_patchram_plus

# Retsrat rfkill service
wait 2
/usr/bin/systemctl restart bluetooth-rfkill-event.service
