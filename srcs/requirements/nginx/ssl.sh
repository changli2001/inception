#!/bin/sh

openssl	req -x509 -nodes -days 1000 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-out /etc/nginx/ssl/nginx-selfsigned.crt \
	-config ./openssl.cnf
