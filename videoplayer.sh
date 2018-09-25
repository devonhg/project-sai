#!/bin/bash

#Set this value to true for multi-screen, false for full screen
	multiscreen=false

#END config

sh /home/pi/project-sai/log.sh "Initiating Videos"


if $multiscreen; then
	#Multiscreen
	sh /home/pi/project-sai/playclientvideos.sh&sh /home/pi/project-sai/playfsvideos.sh
else
	#Fullscreen
	sh /home/pi/project-sai/fullvideoplayer.sh
fi

sh /home/pi/project-sai/log.sh "Videos complete"
