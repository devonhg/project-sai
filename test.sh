#!/bin/bash

sh ./log.sh "Running test"

#ffprobe -i "/home/pi/Desktop/videoslides/live/6pft_ad.mp4" -show_entries format=duration -v quiet -of csv="p=0"

#duration=$(ffmpeg -i "/home/pi/Desktop/videoslides/live/6pft_ad.mp4" 2>&1 | grep Duration | cut -d ' ' -f 4 | sed s/,//)

duration=$(mediainfo --Inform="General;%Duration%" /home/pi/Desktop/videoslides/live/10_missing.mp4)

echo "$duration"

#chromium-browser file:///home/pi/Desktop/dash/index.html --kiosk --start-maximized &
#echo "We just ran!";
#sh ./playclientvideos.sh&sh ./playfsvideos.sh
