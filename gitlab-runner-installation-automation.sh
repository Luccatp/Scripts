#!/bin/bash
url=$1
token=$2

sudo su
yum -y install docker

systemctl start docker | true
systemctl enable docker

containerId=$(sudo docker run -d gitlab/gitlab-runner)

runtimeError=$(docker exec -it $containerId /bin/bash)

apt update

apt install -y vim

apt install gitlab-runner

gitlab-runner register --non-interactive --url $url --registration-token $token --executor shell
