#!/bin/bash

sh ./log.sh "Running Client Videos"

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="/home/pi/Desktop/videoslides/client"

files=$( find $VIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
count=0
duration=0; 

# now for our infinite loop!
while true; do
        #if ps ax | grep -v grep | grep $SERVICE > /dev/null
        if ps ax | grep -v grep | duration > 0
        then
        #sleep .01;
        duration=` $duration - 1 `
else
		echo "Playing Client Vidoes"
        for entry in $VIDEOPATH/*
        do
			clear
			duration=$(mediainfo --Inform="General;%Duration%" $entry)
			omxplayer --win '1313 0 1920 1080' $entry
			count=$((count+1))

		if [ "$count" = "$files" ]
		then
			count=0
			files=$( find $VIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
		fi
        done
        echo "Done Playing Client Videos"
fi
done
