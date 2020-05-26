#!/bin/bash
yum update -y
yum install httpd -y 
service httpd start
chkconfig httpd on
service httpd status
timedatectl set-timezone "America/New_York"
hostnamectl set-hostname myEastServer2
sleep 10
echo -e "Welcome to server `hostnamectl | grep Static | awk '{print $3}'` \n" > /var/www/html/index.html;
echo -e "The current time is `date` \n" >> /var/www/html/index.html;
echo -e "The availability zone for this instance is `curl http://169.254.169.254/latest/meta-data/placement/availability-zone`" >> /var/www/html/index.html

