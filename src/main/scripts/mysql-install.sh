#!/bin/bash

sudo apt-get update

sudo apt-get -y install debconf-utils

export DEBIAN_FRONTEND="noninteractive"

echo "mysql-server-5.7      mysql-server/root_password      password root" | sudo debconf-set-selections
echo "mysql-server-5.7      mysql-server/root_password_again    password root" | sudo debconf-set-selections

sudo apt-get -y install mysql-server-5.7

if [ $? -ne 0 ] 
then
    echo -e "0\33[1;31m MYSQL  Server installtion failed, Please troubleshoot"
    exit 1
else
    echo -e "0\33[1;32m MySql Server installation completed, success"
fi

sudo apt-get -y install expect

/usr/bin/expect -f ./mysql-secure.sh

if [ $? -ne 0 ] 
then
    echo -e "\033[1;31m mysql_secure_installation failed, Please troubleshoot\033[0m"
    exit 1
else
    echo -e "\033[1;32m mysql_secure_installation completed, success\033[0m"
fi

echo "mysql server configuring bind-address to 0.0.0.0"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql && {
    echo -e "\033[1;32m Mysql-Server restarted successfully....\033[0m"
} || {
    echo -e "\033[1;31m Mysql-server failed in restart, Please Troubleshoot.\033[0m"
    exit 1    
}