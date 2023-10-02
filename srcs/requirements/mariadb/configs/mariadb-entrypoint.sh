#!/bin/bash

# Start the MySQL service
service mysql start

# Wait for MySQL to start
while ! mysqladmin ping -hlocalhost -u$DB_USER -p$DB_USER_PWD --silent; do
    sleep 1
done

# Create the MySQL database and user
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"

# Secure the MySQL installation
mysql -e "UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PWD') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the MySQL service
service mysql stop

# Start the MySQL service in the background (as a daemon)
exec mysqld_safe --skip-grant-tables
