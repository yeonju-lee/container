#!/bin/bash

set -e 

folder=dockerfile_10g_push

if [ -d ${folder} ]; then
rm -rf ${folder}
fi

mkdir ${folder}
cd ${folder}

# 1GB FILE CREATE
dd if=/dev/urandom of=large bs=1024 count=10000000

# Docker File create
echo FROM ubuntu:14.04 > Dockerfile
echo ADD large /var/data >> Dockerfile

# Docker File build
sudo docker build -t ${folder}:0.1 ./

############################################################

cd ../
pwd=$(pwd)

source $pwd/conf

# Container Registry login
sudo docker login $Registry_URL -u $ID -p $APPKEY
sudo docker tag ${folder}:0.1 $Registry_URL/${folder}:0.1

start_time=$(date +%s)

sudo docker push $Registry_URL/${folder}:0.1

end_time=$(date +%s)


echo "push time  : $(($end_time - $start_time)) sec"
#elapsedSec=`echo "scale=6;$elapsed / 1000" | bc | awk '{printf "%.6f", $1}'` 
#echo TOTAL: $elapsedSec sec

