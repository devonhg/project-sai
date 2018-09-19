#!/bin/bash

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
FSVIDEOPATH="/home/pi/Desktop/videoslides/live" 

# you can normally leave this alone
SERVICE="omxplayer"

FSfiles=$( find $FSVIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
FScount=0

# now for our infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep .01;
else 
        echo "Playing FS Videos"
        for entry in $FSVIDEOPATH/*
        do
                clear
                omxplayer --win '0 0 960 720' $entry

		FScount=$((FScount+1))
		echo $FScount

		if [ "$FScount" = "$FSfiles" ]
		then
			FScount=0
		fi
        done
        echo "Done Playing FS Videos"
fi
done
