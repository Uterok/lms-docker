#!/bin/bash

# clone and configure lms server modules

echo -e "\e[94mClone lms php module\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-php.git

echo -e "\e[94mClone lms node module\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-node.git

echo -e "\e[94mClone lms node vue\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-vue.git

echo -e "\e[36mStarting configre module:\e[0m";
echo -e "\e[94mConfigure php module:\e[0m";
cd locketgo-lms-php
# copy env file depends on system type
# if [[ $OSTYPE =~ "linux-gnu" ]];
# then
# 	sudo cp .env.example.docker.linux .env
# else
# 	sudo cp .env.example.docker.mac .env
# fi
cp .env.example.docker .env
# sudo chmod -R 777 .
echo -e "\e[94mPhp module configured\e[0m";

echo -e "\e[94mConfigure node module:\e[0m";
cd ../locketgo-lms-node
# copy env file depends on system type
# if [[ $OSTYPE =~ "linux-gnu" ]];
# then
# 	sudo cp .env.example.docker.linux .env
# else
# 	sudo cp .env.example.docker.mac .env
# fi
cp .env.example.docker .env
echo -e "\e[94mNode module configured\e[0m";

cd ..

echo -e "\e[94mCreate databases folder\e[0m";
mkdir databases;
echo -e "\e[94mDatabases storage folder created\e[0m";

#run installing/update modules dependencies
cd install
. ./install_update_modules.sh

#add lms server start on bootup
echo -e "\e[94mAdd lms server start on bootup\e[0m";
cd ..
sudo cp start_lms_server.sh /etc/init.d/start_lms_server.sh
sudo chmod 755 /etc/init.d/start_lms_server.sh
sudo update-rc.d start_lms_server.sh defaults
echo -e "\e[94mSuccessfully added\e[0m";


#run lms server
. ./start_lms_server.sh