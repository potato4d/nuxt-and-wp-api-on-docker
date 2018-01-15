#!/bin/sh

cd /app/wordpress
sed -i -e "s/database_name_here/$WORDPRESS_DB_NAME/" wp-config.php
sed -i -e "s/username_here/$WORDPRESS_DB_USER/" wp-config.php
sed -i -e "s/password_here/$WORDPRESS_DB_PASSWORD/" wp-config.php
sed -i -e "s/localhost/$WORDPRESS_DB_HOST/" wp-config.php

php -S 0.0.0.0:8080
