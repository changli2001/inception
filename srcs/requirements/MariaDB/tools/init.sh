#!/bin/sh

MARIADB_DATA_DIR="/var/lib/mysql"
service mariadb start

sleep 7


mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mariadb -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"

mariadb -u root -e "CREATE USER '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN_USER'@'%' WITH GRANT OPTION;"

mariadb -u root -e "FLUSH PRIVILEGES;"


	kill $PID
	wait $PID
fi

exec /usr/bin/mysqld_safe --datadir="$MARIADB_DATA_DIR"

