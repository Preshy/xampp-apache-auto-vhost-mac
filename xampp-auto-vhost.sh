#!/bin/bash

# Check if script is run as admin
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as an administrator."
    exit 1
fi


# Check if vhosts is enabled for Apache in XAMPP
if grep -q "Include etc/extra/httpd-vhosts.conf" "/Applications/XAMPP/etc/httpd.conf"; then
    echo "Vhosts is enabled for Apache in XAMPP."
else
    echo "Vhosts is not enabled for Apache in XAMPP. Exiting script."
    exit 1
fi

# Collect path and domain name from user via prompt
read -p "Enter the path to your website's root directory: " path
read -p "Enter the domain name for your website: " domain

# Add entry for vhost configuration
echo "
<VirtualHost *:80>
    ServerName $domain
    DocumentRoot $path
    <Directory $path>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>" >> /Applications/XAMPP/etc/extra/httpd-vhosts.conf

echo "Vhost configuration for $domain has been added."

# Add entry for /etc/hosts
echo "127.0.0.1       $domain" >> /etc/hosts

echo "Entry for $domain has been added to /etc/hosts."

sudo /Applications/XAMPP/xampp restartapache
echo "Apache server has been restarted."

