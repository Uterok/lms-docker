#!/bin/bash

echo -e "\e[36mInstall/Update dependencies:\e[0m";

echo -e "\e[36mStoping loaded containers:\e[0m";
cd ..
sudo docker-compose down

cd install
sudo docker-compose down

. ./install_php_dependencies.sh

. ./install_node_dependencies.sh

. ./install_vue_dependencies.sh

echo -e "\e[36mAll dependencies succesfully installed/updated:\e[0m";