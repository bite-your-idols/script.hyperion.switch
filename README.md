
🌈 hyperion-switch
========

Toggle on/off hyperion in LibreELEC with an addon.



DESCRIPCIÓN:

Sistema para apagar/encender los Leds controlados por [Hyperion](https://github.com/tvdzwan/hyperion) en una Raspberry Pi desde el menu de Kodi y desde el mando a distancia de tu TV en sistemas corriendo LibreELEC.

INSTRUCCIONES:

Despues de instalar el addon Hyperion desde el repositorio official de LibreELEC instalar el addon [desde el zip](https://github.com/bite-your-idols/script.hyperion.switch/releases/latest).

Podemos modificar el archivo "remote.xml" para añadir un acceso directo al encendido/apagado desde tu propio mando a distancia. Elegis el boton y le asignais el codigo:
```
XBMC.System.Exec("/storage/.kodi/addons/script.hyperion.switch/bin/switch.sh")`
```
O directamente llamar al addon usando un comando por ssh:
```
kodi-send --action=RunAddon(script.hyperion.switch)
```

> Si no te funciona el script prueba a darle permisos de ejecucion y lectura al archivo /storage/.kodi/addons/script.hyperion.switch-master/bin/switch.sh


+ información: http://www.elotrolado.net/hilo_hilo-oficial-movimiento-ambilight-eol_1036973
