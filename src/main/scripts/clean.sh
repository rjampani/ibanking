#!/bin/bash
echo "whoami : $(whoami)"

rm /home/vagrant/ibanking-schema.sql
rm /home/vagrant/mysql-secure.sh

sudo apt-get purge --auto-remove -y debconf-utils && {
    echo -e "\033[1;32m debconf-utils removed completely, success\033[0m"
} || {
    echo -e "\033[1;31m removal of debconf-utils failed, please troubleshoot\033[0m"
    exit 1
}
sudo apt-get purge --auto-remove -y expect && {
    echo -e "\033[1;32m expect removed completely, success\033[0m"
} || {
    echo -e "\033[1;31m removal of expect failed, please troubleshoot\033[0m"
    exit 1
}

echo -e "\033[1;32m Clean process completed\033[0m"
