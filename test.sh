#!/bin/bash
#width=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
#height=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

#echo width;

dim=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')

IFS='x' read -r -a array <<< $dim

width="${array[0]}";
height="${array[1]}";

xCen=$((width/2));
yCen=$((height/2));

#echo $yCen;

chromium-browser file:///home/pi/Desktop/dash/index.html --start-maximized &

screen -dmS camera1 sh -c 'omxplayer --win "0 0 960 540" /home/pi/Desktop/videoslides/buffer/15_late.mp4'

screen -dmS camera2 sh -c 'omxplayer --win "960 0 1920 540" /home/pi/Desktop/videoslides/buffer/10_missing.mp4'

#omxplayer --refresh --win 0,0,640,480 /home/pi/Desktop/videoslides/buffer/15_late.mp4


#omxplayer --refresh --win 100,100,640,480 /home/pi/Desktop/videoslides/buffer/10_missing.mp4