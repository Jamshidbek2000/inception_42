sed -i "s/\${DB_NAME}/$DB_NAME/g"  /create_db.sql
sed -i "s/\${DB_USER}/$DB_USER/g"  /create_db.sql
sed -i "s/\${DB_USER_PWD}/$DB_USER_PWD/g"  /create_db.sql
sed -i "s/\${DB_ROOT_PWD}/$DB_ROOT_PWD/g"  /create_db.sql

# mariadb-install-db --user=root --datadir=/var/lib/mysql --skip-test-db KEEP EITHER ONE OF THESE
mysql_install_db --user=mysql --datadir=/var/lib/mysql

exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/create_db.sql
