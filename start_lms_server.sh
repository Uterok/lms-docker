#!/bin/bash

cd /home/pi/lms-server/lms-docker

# set host ip to environment variable
# export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
. ./export_env.sh

# start lms-server
# sudo -E docker-compose up -d
if [[ $OSTYPE =~ "linux-gnu" ]];
then
	sudo -E docker-compose up -d --scale udp_broadcast_redirect=0
else
	sudo -E docker-compose up -d
fi
# sudo docker-compose logs -f
# sudo docker-compose down