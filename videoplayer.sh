#!/bin/bash

#Set this value to true for multi-screen, false for full screen
	multiscreen=false

#END config

sh ./log.sh "Initiating Videos"


if $multiscreen; then
	#Multiscreen
	sh ./playclientvideos.sh&sh ./playfsvideos.sh
else
	#Fullscreen
	sh ./fullvideoplayer.sh
fi

sh ./log.sh "Videos complete"
