#!/bin/sh
chmod a+x /storage/.kodi/addons/script.hyperion.switch/bin/*
SERVICE='hyperiond'
if ps | grep -v grep | grep $SERVICE > /dev/null
then
killall hyperiond
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Disabled","image":"/storage/.kodi/addons/script.hyperion.switch/icon.png"}}' http://192.168.0.14:80/jsonrpc
else
/storage/hyperion/bin/hyperiond.sh /storage/.config/hyperion.config.json </dev/null >/dev/null 2>&1 &
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Enabled","image":"/storage/.kodi/addons/script.hyperion.switch/icon.png"}}' http://192.168.0.14:80/jsonrpc
fi