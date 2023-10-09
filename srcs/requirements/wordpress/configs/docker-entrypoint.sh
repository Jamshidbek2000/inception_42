#!/bin/bash

# Check if the WordPress configuration file exists
if [[ ! -f /var/www/html/wp-config.php ]]; then

  # Download WordPress
  wget https://wordpress.org/latest.tar.gz -O wordpress.tar.gz

  # Extract WordPress
  tar -xvzf wordpress.tar.gz

  mv wordpress/* /var/www/html

  rm -rf wordpress.tar.gz

  rm -rf wordpress

  # Move WordPress configuration files
  mv wp-config.php /var/www/html/

  rm /var/www/html/wp-config-sample.php

  # Change permissions
  chown -R www-data:www-data /var/www/html

#   sed -ie s/'$DB_NAME'/$DB_NAME/g /var/www/html/wp-config.php
#   sed -ie s/'$DB_USER'/$DB_USER/g /var/www/html/wp-config.php
#   sed -ie s/'$DB_USER_PWD'/$DB_USER_PWD/g /var/www/html/wp-config.php

fi

php-fpm7.3 -F