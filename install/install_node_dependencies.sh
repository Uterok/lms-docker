#!/bin/bash

# set env variables
cd ..
. ./export_env.sh
cd install

echo -e "\e[36mInstall node dependencies:\e[0m";
echo -e "\e[32mSocket server dependencies:\e[0m";
sudo -E docker-compose up node_lms_node
sudo docker-compose down
echo -e "\e[94mSocket server dependencies succesfully installed/updated\e[0m";