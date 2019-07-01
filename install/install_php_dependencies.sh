#!/bin/bash

echo -e "\e[36mInstall php dependencies:\e[0m";
echo -e "\e[32mComposer dependencies:\e[0m";
sudo docker-compose up composer
sudo docker-compose down
echo -e "\e[32mMigrating and seeding databases:\e[0m";
echo -e "\e[32mConfiguring databases:\e[0m";
sudo docker-compose up -d pgsql 
sleep 30
sudo docker-compose down

sudo docker-compose up -d pgsql 
sudo docker-compose up php_migrate_db
sudo docker-compose down