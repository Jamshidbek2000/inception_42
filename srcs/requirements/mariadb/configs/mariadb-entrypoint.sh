#!/bin/bash

# Start the MySQL service
sleep 10
service mysql start

# Wait for MySQL to start
# while ! mysqladmin ping -hlocalhost -u$DB_USER -p$DB_USER_PWD --silent; do
#     sleep 1
# done

sleep 10


# Create the MySQL database and user
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# Explanation: This command creates a database with the name specified in $DB_NAME if it doesn't already exist.

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
# Explanation: This command creates a MySQL user with the username specified in $DB_USER and sets their password to $DB_USER_PWD.
# Reason: Creating a user is necessary for applications like WordPress to interact with the database.

mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
# Explanation: This command grants all privileges on the specified database ($DB_NAME) to the MySQL user ($DB_USER) from any host (%).
# Reason: Granting privileges is essential to allow the user to perform database operations.

# Secure the MySQL installation
mysql -e "UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PWD') WHERE User='root';"
# Explanation: This command updates the root user's password to the value specified in $DB_ROOT_PWD.
# Reason: Changing the root password enhances the security of the MySQL installation.

mysql -e "DELETE FROM mysql.user WHERE User='';"
# Explanation: This command deletes MySQL user accounts with empty usernames.
# Reason: Removing empty username accounts is a security measure to clean up unnecessary or insecure accounts.

mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# Explanation: This command deletes root user accounts that are not configured to connect from localhost, 127.0.0.1, or ::1.
# Reason: Restricting root access to these trusted hosts enhances security by limiting access points.

mysql -e "DROP DATABASE IF EXISTS test;"
# Explanation: This command drops (deletes) the default MySQL test database if it exists.
# Reason: The test database is not needed for production use and can pose a security risk if not removed.

mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# Explanation: This command deletes any MySQL database privileges associated with the test database.
# Reason: Removing privileges for the test database ensures there are no unnecessary or insecure privileges left behind.

mysql -e "FLUSH PRIVILEGES;"
# Explanation: This command flushes MySQL privileges to ensure that the changes made to user accounts and privileges take effect immediately without the need to restart the MySQL server.
# Reason: Flushing privileges ensures that the changes made to user accounts and privileges are applied immediately.



# Stop the MySQL service
service mysql stop

# Start the MySQL service in the background (as a daemon)
exec mysqld_safe --skip-grant-tables