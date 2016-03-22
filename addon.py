import xbmcaddon
import xbmcgui
import os
 
addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')

os.system("/storage/.kodi/addons/script.hyperion.switch/bin/switch.sh")