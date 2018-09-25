#!/bin/bash

sh /home/pi/project-sai/log.sh "Running fullscreen"

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="/home/pi/Desktop/videoslides/live" 

# you can normally leave this alone
SERVICE="omxplayer"

files=$( find $VIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
count=0

echo "Files Loaded"

# now for our infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null 
        then
        sleep .1;
else
        for entry in $VIDEOPATH/*
        do
			clear              
			omxplayer -o hdmi $entry > /dev/null -b
			echo "Playing Video"
			count=$((count+1))

		if [ "$count" = "$files" ]
		then
			echo "we are looping now"
			count=0
			files=$( find $VIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
			#sh ./refreshvids.sh
		fi
        done
fi
done
