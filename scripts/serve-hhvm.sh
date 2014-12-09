#!/usr/bin/env bash

block="<VirtualHost *:80>
	ServerName $1
	DocumentRoot $2
	ErrorLog /var/log/httpd/$1-error.log
	CustomLog /var/log/httpd/$1-access.log combined
	<Directory "$2">
		AllowOverride All
		Options Indexes Includes FollowSymLinks
	</Directory>
</VirtualHost>"

mkdir -p $2
mkdir -p /etc/httpd/conf/vhosts
echo "$block" > "/etc/httpd/conf/vhosts/$1.conf"
service httpd restart
service hhvm restart
