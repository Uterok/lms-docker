#!/bin/bash

# set env variables
cd ..
. ./export_env.sh
cd install

echo -e "\e[36mInstall php dependencies:\e[0m";
echo -e "\e[32mComposer dependencies:\e[0m";
sudo -E docker-compose up composer
sudo docker-compose down
echo -e "\e[94mComposer dependencies succesfully installed/updated\e[0m";

# echo -e "\e[32mMigrating and seeding databases:\e[0m";
# echo -e "\e[32mConfiguring databases:\e[0m";
# sudo -E docker-compose up -d pgsql 
# echo -e "\e[94mWait for 30 seconds to configure database...:\e[0m";
# sleep 30
# sudo docker-compose down

# sudo -E docker-compose up -d pgsql 
sudo -E docker-compose up pgsql php_migrate_db
sudo docker-compose down

echo -e "\e[94mPhp module dependencies succesfully installed/updated, database migrated\e[0m";