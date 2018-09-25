#!/bin/bash

sh ./log.sh "Running FS Videos"

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
FSVIDEOPATH="/home/pi/Desktop/videoslides/live" 

FSfiles=$( find $FSVIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
FScount=0
duration=0; 

# now for our infinite loop!
while true; do
        if ps ax | grep -v grep | duration > 0
        then
        #sleep .01;
        duration=` $duration - 1 `
else 
        echo "Playing FS Videos"
        for entry in $FSVIDEOPATH/*
        do
			clear
			duration=$(mediainfo --Inform="General;%Duration%" $entry)
			omxplayer --win '0 0 1313 985' $entry
			FScount=$((FScount+1))
		if [ "$FScount" = "$FSfiles" ]
		then
			FScount=0
			FSfiles=$( find $FSVIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
		fi
        done
        echo "Done Playing FS Videos"
fi
done
