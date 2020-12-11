#!/bin/bash

#download and extract tomcat binary distribution

sudo wget -P /opt/tomcat http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.37/bin/apache-tomcat-9.0.37.tar.gz

if [ ! -e /opt/tomcat/apache-tomcat-9.0.37.tar.gz ] 
then
	echo -e "\033[1;31m Downloading tomcat failed, Please troubleshoot!\033[0m"
	exit 1
fi


sudo tar -xzvf /opt/tomcat/apache-tomcat-9.0.37.tar.gz -C /opt/tomcat --strip-components=1

sudo rm /opt/tomcat/apache-tomcat-9.0.37.tar.gz

if [ ! -d /opt/tomcat/bin ] 
then
	echo -e "\033[1;31m Unzipping and extraction of tar failed, Please troubleshoot!\033[0m"
	exit 1
fi

#create a low privileged user <tomcat> and group

sudo groupadd tomcat

sudo useradd -g tomcat -s /bin/nologin -d /opt/tomcat -m tomcat

sudo chgrp -R tomcat /opt/tomcat

sudo chmod -R g+r /opt/tomcat/conf

sudo chmod g+x /opt/tomcat/conf

sudo chown -R tomcat /opt/tomcat/webapps
sudo chown -R tomcat /opt/tomcat/work
sudo chown -R tomcat /opt/tomcat/temp
sudo chown -R tomcat /opt/tomcat/logs

if [ ! -e /home/vagrant/tomcat.service ] 
then
	echo -e "\033[1;31m No tomcat.service under /home/vagrant, Please upload tomcat.service!\033[0m"
	exit 1
fi

sudo cp /home/vagrant/tomcat.service /etc/systemd/system

if [ ! -e /etc/systemd/system/tomcat.service ] 
then
	echo -e "\033[1;31m No tomcat.server under /etc/systemd/system, Please configure tomcat.service!\033[0m"
	exit 1
fi

sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl status tomcat >/dev/null && {
	echo -e "\033[1;32m Tomcat started successfully, ready to serve request!\033[0m"
} || {
	echo -e "\033[1;31m Tomcat failed in Start/Up, Please Trobleshoot!\033[0m"
	exit 1
}

if [ -e /home/vagrant/tomcat.service ] 
then
	sudo rm /home/vagrant/tomcat.service
fi

sudo systemctl enable tomcat && {
	echo -e "\033[1;32m tomcat service enabled to boot-up services!\033[0m"
} || {
	echo -e "\033[1;31m Failed in enabling tomcat service to boot-up services, Please Troubleshoot!\033[0m"	
}


