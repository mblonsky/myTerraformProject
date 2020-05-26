#!/bin/bash
yum update -y
yum install httpd -y 
service httpd start
service httpd status
chkconfig httpd on
timedatectl set-timezone "America/New_York"
hostnamectl set-hostname myEastServer1
sleep 10
echo "Welcome to server `hostnamectl | grep Static | awk '{print $3}'`. \n" > /var/www/html/index.html;
echo "The current time is `date`. \n" >> /var/www/html/index.html;
echo "The availability zone for this instance is `curl http://169.254.169.254/latest/meta-data/placement/availability-zone`." >> /var/www/html/index.html
