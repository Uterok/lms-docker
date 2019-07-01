#!/bin/bash

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

echo -e "\e[94mCreate databases folder\e[0m";
mkdir databases;
echo -e "\e[94mDatabases storage folder created\e[0m";

echo -e "\e[36mInstall/Update dependencies:\e[0m";
