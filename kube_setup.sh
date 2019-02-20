#!/bin/sh

# install docker

sudo apt-get update
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=armhf] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

sudo apt-get update
sudo apt-get install -y docker-ce=18.06.0~ce~3-0~debian

# install kubernetes

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update && apt-get install -y kubeadm

echo ' cgroup_enable=memory  cgroup_memory=1 '>>/boot/cmdline.txt

reboot