#!/bin/bash

echo -e "\e[36mInstall vue dependencies:\e[0m";
echo -e "\e[32mNodejs dependencies:\e[0m";
sudo docker-compose up node_lms_vue
sudo docker-compose down