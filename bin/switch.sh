#!/bin/sh
ADDON_DIRECTORY=$1
# chmod a+x $1/bin/*
# KODIIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
# SERVICE='hyperiond'
PROCESS_NUM=`pgrep hyperiond | wc -l`
if [ $PROCESS_NUM -eq 1 ]
then
killall hyperiond
# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Disabled","image":"/storage/.kodi/addons/script.hyperion.switch/icon.png"}}' http://$KODIIP:8080/jsonrpc
kodi-send --action=Notification"(Hyperion,Disabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
else
# /storage/hyperion/bin/hyperiond.sh /storage/.config/hyperion.config.json </dev/null >/dev/null 2>&1 &
/storage/hyperion/bin/hyperiond.sh /storage/.config/hyperion.config.json > /storage/logfiles/hyperion.log 2>&1 &
# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Enabled","image":"/storage/.kodi/addons/script.hyperion.switch/icon.png"}}' http://$KODIIP:8080/jsonrpc
kodi-send --action=Notification"(Hyperion,Enabled,2000,/storage/.kodi/addons/script.hyperion.switch/icon.png)"
fi
