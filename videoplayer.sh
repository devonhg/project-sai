#!/bin/bash

#Set this value to true for multi-screen, false for full screen
	multiscreen=$1
	message=$2

#END config

sh /home/pi/project-sai/log.sh "Initiating Videos"

if $multiscreen; then
	#Multiscreen
	#sh /home/pi/project-sai/playclientvideos.sh&sh /home/pi/project-sai/playfsvideos.sh&chromium --noerrdialogs --kiosk --icognito /home/pi/project-sai/Desktop/dash/index.html
	#Display=:0 chromium-browser --noerrdialogs --kiosk --icognito /home/pi/project-sai/Desktop/dash/index.html
	#Message Setup
	content="document.getElementById('content').innerHTML = '$message'";
	>/home/pi/project-sai/Desktop/dash/dynamic.js
	echo $content > /home/pi/project-sai/Desktop/dash/dynamic.js
	
	sh /home/pi/project-sai/playfsvideos.sh&
	sh /home/pi/project-sai/playclientvideos.sh&
	Display=:0 chromium-browser --noerrdialogs --kiosk --icognito /home/pi/project-sai/Desktop/dash/index.html
else
	#Fullscreen
	sh /home/pi/project-sai/fullvideoplayer.sh
fi

sh /home/pi/project-sai/log.sh "Videos complete"
