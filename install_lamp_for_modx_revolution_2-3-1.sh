#!/bin/bash
# My first script

sudo yum update -y
sudo yum install -y httpd24 php56 mysql55-server php56-mysqlnd php56-mbstring git-all
sudo service httpd start
sudo chkconfig httpd on
chkconfig --list httpd
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo service mysqld start
sudo mysql_secure_installation
sudo service mysqld stop
sudo chkconfig mysqld on

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer