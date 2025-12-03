#!/bin/sh


############################ Installing wp mwta-data ###################

#!/bin/sh
set -e

WP_PATH=/var/www/html

# 1) Install WordPress only if not already present
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "[entrypoint] First run: installing WordPress..."
    mkdir -p "$WP_PATH"
    curl -o /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz
    tar -xzf /tmp/latest.tar.gz -C "$WP_PATH" --strip-components=1
    rm /tmp/latest.tar.gz
    cp "$WP_PATH/wp-config-sample.php" "$WP_PATH/wp-config.php"
    sed -i "s/database_name_here/${WP_DB_NAME}/" "$WP_PATH/wp-config.php"
    sed -i "s/username_here/${WP_DB_USER}/" "$WP_PATH/wp-config.php"
    sed -i "s/password_here/${WP_DB_PASSWORD}/" "$WP_PATH/wp-config.php"
    sed -i "s/localhost/${WP_DB_HOST}/" "$WP_PATH/wp-config.php"
    chown -R www-data:www-data "$WP_PATH"
fi
sed -i "s|^listen = .*|listen = 0.0.0.0:9000|" /etc/php/8.2/fpm/pool.d/www.conf
sed -i "s|^listen.allowed_clients = .*|;listen.allowed_clients = 127.0.0.1|" /etc/php/8.2/fpm/pool.d/www.conf


exec /usr/sbin/php-fpm8.2 -F
