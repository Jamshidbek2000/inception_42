#!/bin/bash

# Check if the WordPress configuration file exists
if [[ ! -f /var/www/html/wp-config.php ]]; then

  # Download WordPress
  wget https://wordpress.org/latest.tar.gz -O wordpress.tar.gz

  # Extract WordPress
  tar -xvzf wordpress.tar.gz -C /var/www/html

  # Move WordPress configuration files
  mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

  # Change permissions
  chown -R www-data:www-data /var/www/html

  sed -ie s/'$DB_NAME'/$DB_NAME/g var/www/html/wp-config.php
  sed -ie s/'$DB_USER'/$DB_USER/g var/www/html/wp-config.php
  sed -ie s/'$DB_USER_PWD'/$DB_USER_PWD/g var/www/html/wp-config.php

fi

# Start PHP-FPM
service php7.3-fpm start