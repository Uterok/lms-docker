#!/bin/bash
echo -e "\e[32mUpdate repositories...\e[0m";
sudo apt-get update;
# sudo apt-get upgrade

echo -e "\e[32mInstalling git...\e[0m";
sudo apt-get install git-core;

read -p "Input your github Username : " github_username;
git config --global user.name "$github_username"
echo -e "\e[94mGithub username set to $github_username\e[0m";

read -p "Input your github Email : " github_email;
git config --global user.email "$github_email";
echo -e "\e[94mGithub email set to $github_email\e[0m";

echo -e "\e[32mInstalling docker...\e[0m";
sudo curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh;
sudo groupadd docker;
sudo gpasswd -a pi docker;
sudo rm get-docker.sh;

echo -e "\e[32mInstalling docker-compose...\e[0m";
sudo apt-get update;
sudo apt-get install -y python python-pip;
sudo pip install docker-compose==1.23.2;

echo -e "\e[36mStarting configre lms server:\e[0m";

mkdir /home/pi/lms-server;
cd /home/pi/lms-server;

echo -e "\e[94mClone docker deploy repository\e[0m";
git clone https://github.com/Uterok/lms-docker.git
cd lms-docker

echo -e "\e[94mClone lms php module\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-php.git

echo -e "\e[94mClone lms node module\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-node.git

echo -e "\e[94mClone lms node vue\e[0m";
git clone https://github.com/locketgo-com/locketgo-lms-vue.git

echo -e "\e[36mStarting configre module:\e[0m";
echo -e "\e[94mConfigure php module:\e[0m";
cd locketgo-lms-php
sudo cp .env.example.docker .env
echo -e "\e[94mPhp module configured\e[0m";

echo -e "\e[94mConfigure node module:\e[0m";
cd ../locketgo-lms-node
sudo cp .env.example.docker .env
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
