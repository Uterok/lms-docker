#!/bin/bash

echo -e "\e[36mInstall node dependencies:\e[0m";
echo -e "\e[32mNodejs dependencies:\e[0m";
sudo docker-compose up node_lms_node
sudo docker-compose down