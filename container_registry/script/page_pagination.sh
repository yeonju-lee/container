#!/bin/bash

pwd=$(pwd)

source $pwd/conf

# Container Registry login
sudo docker login $Registry_URL -u $ID -p $APPKEY

sudo docker pull alpine:latest


SET=$(seq 0 50)
for i in $SET
do
        docker tag alpine:latest $Registry_URL/dummy$i:1.0
        docker push $Registry_URL/dummy$i:1.0
done
