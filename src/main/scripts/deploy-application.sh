#!/bin/bash

if [ ! -e /vagrant/target -o ! -e /vagrant/target/ibanking-*.war ]
then
	echo -e "\033[1;31m Deployable artifact not found, Please re-build application and/or Trobleshoot!\033[0m"
	exit 1
fi
sudo cp /vagrant/target/ibanking-*.war /opt/tomcat/webapps

[ -e /opt/tomcat/webapps/ibanking-*.war ] && {
	echo -e "\033[1;32m Artifact Published/Deployed/Copied into deployable dir of Tomcat Server,\033[0m"
	echo -e "\033[1;32m Please verify the logs for Application status deployed or not\033[0m"
} || {
	echo -e "\033[1;31m Artifact failed in Publish/Deployed/Copied into deployable dir Tomcat Server,\033[0m"
	echo -e "\033[1;31m Please troubleshoot!\033[0m"
}

sudo systemctl restart tomcat

sudo systemctl status tomcat && {
	echo -e "\033[1;32m Tomcat Restarted Successfully, Please verify logs for deployment status!\033[0m"
} || {
	echo -e "\033[1;31m Tomcat has failed in Start Up, Please Troubleshoot!\033[0m"
	exit 1
}
