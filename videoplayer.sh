#!/bin/sh

#Set this value to true for multi-screen, false for full screen
	multiscreen=false

#END config

echo " Initiating videos"


if $multiscreen; then
	#Multiscreen
	sh ./playclientvideos.sh&sh ./playfsvideos.sh
	echo "Running multiscreen"
else
	#Fullscreen
	sh ./fullvideoplayer.sh
	echo "Running fullscreen"
fi

echo "Videos complete"
