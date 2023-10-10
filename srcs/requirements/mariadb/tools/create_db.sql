CREATE DATABASE IF NOT EXISTS ${DB_NAME};
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PWD}';
CREATE USER IF NOT EXISTS '${DB_USER}' IDENTIFIED BY '${DB_USER_PWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}';
FLUSH PRIVILEGES;
EXIT;
