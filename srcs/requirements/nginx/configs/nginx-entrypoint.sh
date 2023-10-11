#!/bin/bash


# Generate a self-signed SSL certificate if it doesn't exist
if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
		-subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42/CN=jergashe.42.fr"
fi


if [ ! -f /etc/nginx/sites-enabled/nginx.conf ]; then
	
	# Remove the default Nginx configuration symlink
	unlink /etc/nginx/sites-enabled/default

	# Replace '$DOMAIN_NAME' with the actual domain name in the nginx configuration
	sed -ie s/'$DOMAIN_NAME'/$DOMAIN_NAME/g /etc/nginx/sites-available/nginx.conf

	# Create a symlink to your custom Nginx configuration
	# "sites-enabled" folder stores symlinks to the configurations you want Nginx to actively use.
	ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
	# mv /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

	# disable gzip
	# gzip is a file compression and decompression format
	sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

fi


# run an external command from within the script
# while preserving the process ID (PID) of the script itself.
exec "$@"
