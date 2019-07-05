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

# clone and configure lms server modules
. ./clone_configure_lms_server.sh
