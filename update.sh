#!/bin/bash
cd "${0%/*}"
sh /home/pi/project-sai/log.sh "Performing update"
git pull origin master
