cd /var/www/html
# rm -rf *

# Install WP-CLI
if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	# Configure the database and download WordPress
	sleep 30
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=$DB_HOST --allow-root

	# Install WordPress and create a user
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root --porcelain
fi

# Move PHP-FPM configuration
cp /www.conf /etc/php/7.3/fpm/pool.d/
# Create a directory for PHP-FPM
mkdir -p /run/php

echo DONE!
# Start PHP-FPM in the foreground
/usr/sbin/php-fpm7.3 -F
