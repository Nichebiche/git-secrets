#!/bin/bash

# Update package repository and install necessary packages
sudo yum update -y
sudo yum install -y httpd mariadb-server php php-mysqlnd

# Start and enable Apache and MySQL services
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure the MySQL installation
sudo mysql_secure_installation

# Create a PHP info file to test the PHP installation
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
