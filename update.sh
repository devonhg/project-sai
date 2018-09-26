#!/bin/bash
sh /home/pi/project-sai/log.sh "Performing update"
git -C /home/pi/project-sai
git pull origin master
