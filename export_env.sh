#!/bin/bash

# set host ip to environment variable
# export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
echo "DOCKERHOST --- $DOCKERHOST"

# check cpu architecture and choose correspond image
# check architecture name on regexp
if [[ $(arch) =~ "arm" ]];
then
	# export PGSQL_DOCKER_IMAGE="tobi312/rpi-postgresql"
	export NGINX_EXTERNAL_PORT=80
	export PGSQL_DOCKER_IMAGE="tobi312/rpi-postgresql"
else
	# export PGSQL_DOCKER_IMAGE="postgres"
	export NGINX_EXTERNAL_PORT=8098
	export PGSQL_DOCKER_IMAGE="postgres"
fi