#!/bin/sh
ADDON_DIRECTORY=$1
# KODIIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
PROCESS_NUM=`pgrep hyperiond | wc -l`
if [ $PROCESS_NUM -eq 1 ]
then
# killall hyperiond
# mv /storage/.kodi/addons/service.hyperion/ /storage/.kodi/addons/service.hyperion_OFF/
systemctl stop service.hyperion.service 2>/dev/null
kodi-send --action=Notification"(Hyperion,Disabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
else
systemctl start service.hyperion.service 2>/dev/null
# mv /storage/.kodi/addons/service.hyperion_OFF/ /storage/.kodi/addons/service.hyperion/
# /storage/.kodi/addons/service.hyperion/bin/hyperiond.start /storage/.kodi/userdata/addon_data/service.hyperion/hyperion.config.json > /storage/.kodi/temp/hyperion.log 2>&1 &
kodi-send --action=Notification"(Hyperion,Enabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
fi
