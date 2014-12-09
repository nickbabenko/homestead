#!/usr/bin/env bash

block="<VirtualHost *:80>
	ServerName $1
	DocumentRoot $2
	ErrorLog /var/log/httpd/$1-error.log
	CustomLog /var/log/httpd/$1-access.log combined
	<Directory "$2">
                Order Deny,Allow
                AllowOverride All
                Allow from all
                Options Indexes Includes FollowSymLinks
	</Directory>
</VirtualHost>"

echo "$block" > "/etc/httpd/conf/vhosts/$1.conf"
service httpd restart
