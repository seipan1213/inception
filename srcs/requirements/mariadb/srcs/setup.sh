#!/bin/sh
export MYSQL_ROOT_PASS=toor
export WP_DB_NAME=hogeDB
export WP_DB_USER=hogeUser
export WP_DB_USER_PASS=hogePass

/etc/init.d/mariadb setup
rc-status
rc-service mariadb start

#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';";
mysql -e "CREATE DATABASE ${WP_DB_NAME};"
mysql -e "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_USER_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"
rc-service mariadb stop

mysqld_safe
