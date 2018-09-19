#!/bin/sh

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="/home/pi/Desktop/videoslides/client"
FSVIDEOPATH="/home/pi/Desktop/videoslides/live" 

# you can normally leave this alone
SERVICE="omxplayer"

files=$( find $VIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
FSfiles=$( find $FSVIDEOPATH -maxdepth 1 -type f -printf . | wc -c )
count=0
FScount=0

#echo $files

# now for our infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep .01;
else
		echo "Playing Client Vidoes"
        for entry in $VIDEOPATH/*
        do
                clear
                #omxplayer -o hdmi $entry > /dev/null -b
                omxplayer --win '960 0 1920 720' $entry
                #screen -dmS camera1 sh -c "omxplayer --win '0 0 960 720' $entry"

		count=$((count+1))
		echo $count

		if [ "$count" = "$files" ]
		then
			echo "we are looping now"
			count=0
		fi
        done&
        echo "Done Playing Client Videos"
        
        echo "Playing FS Videos"
        for entry in $FSVIDEOPATH/*
        do
                clear
                #omxplayer -o hdmi $entry > /dev/null -b
                omxplayer --win '0 0 960 720' $entry
                #screen -dmS camera1 sh -c "omxplayer --win '0 0 960 720' $entry"

		FScount=$((FScount+1))
		echo $FScount

		if [ "$FScount" = "$FSfiles" ]
		then
			FScount=0
		fi
        done&
        echo "Done Playing FS Videos"
fi
done
