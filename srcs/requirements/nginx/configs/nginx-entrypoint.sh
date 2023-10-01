#!/bin/bash

# Remove the default Nginx configuration symlink
unlink /etc/nginx/sites-enabled/default

# Replace '$DOMAIN_NAME' with the actual domain name in the nginx configuration
sed -ie s/'$DOMAIN_NAME'/$DOMAIN_NAME/g /etc/nginx/sites-available/nginx.conf

# Create a symlink to your custom Nginx configuration
# "sites-enabled" folder stores symlinks to the configurations you want Nginx to actively use.
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# disable gzip
# gzip is a file compression and decompression format
sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

# run an external command from within the script
# while preserving the process ID (PID) of the script itself.
exec "$@"
