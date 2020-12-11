#!/bin/bash

sudo apt-get update

sudo apt-get -qq -y install openjdk-8-jre-headless

java -version

if [ $? -ne 0 ]
then
	echo -e "\033[1;31m jdk installation failed, Please troubleshoot.!\033[0m"
	exit 1
else
	echo -e "\033[1;32m openjdk-8-jre installation completed, successfull!\033[0m"
fi


