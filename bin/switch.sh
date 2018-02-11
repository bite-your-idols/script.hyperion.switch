#!/bin/sh
ADDON_DIRECTORY=$1
# KODIIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
PROCESS_NUM=`pgrep hyperiond | wc -l`
if [ $PROCESS_NUM -eq 1 ]
then
killall hyperiond 2>/dev/null
kodi-send --action=Notification"(Hyperion,Disabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
else
/storage/hyperion/bin/hyperiond.sh /storage/.config/hyperion.config.json > /storage/logfiles/hyperion.log 2>&1 &
kodi-send --action=Notification"(Hyperion,Enabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
fi
