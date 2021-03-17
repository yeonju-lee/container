#!/bin/bash

set -e
os=$(cat /etc/*release | head -n 1 | cut -c 1-12)

echo os=$os

## centos 6 docker install 
## centos 6.10
if  [ "$os" == "CentOS relea" ];
then

curl -O -sSL https://get.docker.com/rpm/1.7.1/centos-6/RPMS/x86_64/docker-engine-1.7.1-1.el6.x86_64.rpm
sudo yum -y localinstall --nogpgcheck docker-engine-1.7.1-1.el6.x86_64.rpm
sudo service docker start

echo cent6.10

# cenntos 7
elif [ "$os" == "CentOS Linux" ];
then

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

echo cent7

else

# ubuntu
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker

echo "buntu"
fi
