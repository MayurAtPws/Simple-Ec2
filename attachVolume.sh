#!/bin/bash

# Mount the Volume 
mkdir /home/ubuntu/external-volume
sudo mkfs -t ext4 /dev/xvdf
mount /dev/xvdf /home/ubuntu/external-volume

#install Nginx 
apt-get update
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
