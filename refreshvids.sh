#!/bin/sh
rm /home/pi/Desktop/videoslides/live/*
cp -R /home/pi/Desktop/videoslides/buffer/. /home/pi/Desktop/videoslides/live
echo "videos refreshed successfully"