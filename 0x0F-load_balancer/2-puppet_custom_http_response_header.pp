#!/usr/bin/env bash
#automate the task of creating a custom HTTP header response, but with Puppet.

exec { 'http header':
	command  => 'sudo apt-get update -y;
	sudo apt-get install nginx -y;
	sudo sed -i "/server_name_/a add_header X-Server-by HOSTNAME;" /etc/nginx/site-available/default
	sudo service nginx restart',
	provider => shell,
}
