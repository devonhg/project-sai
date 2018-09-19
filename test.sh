#!/bin/bash

chromium-browser file:///home/pi/Desktop/dash/index.html --kiosk --start-maximized &
#sh ./playclientvideos.sh&sh ./playfsvideos.sh




#dim=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
#
#IFS='x' read -r -a array <<< $dim
#
#width="${array[0]}";
#height="${array[1]}";
#
#xCen=$((width/2));
#yCen=$((height/2));
#
#chromium-browser file:///home/pi/Desktop/dash/index.html --start-maximized &
#
#sleep 5
#
#screen -dmS camera1 sh -c 'omxplayer --win "0 0 960 720" /home/pi/Desktop/videoslides/buffer/15_late.mp4'
#
#screen -dmS camera2 sh -c 'omxplayer --win "960 0 1920 720" /home/pi/Desktop/videoslides/buffer/10_missing.mp4'

