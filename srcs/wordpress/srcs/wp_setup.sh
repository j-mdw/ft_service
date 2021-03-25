#!/bin/sh

wp core install --url="https://"$EXT_IP":5050" --title="BS_Website" --admin_user="admin" --admin_password="admin" --admin_email="admin@admin.admin"

wp user create wpuser1 wpuser1@wp.wp --role=editor --user_pass=wpuser1

wp user create wpuser2 wpuser2@wp.wp --role=editor --user_pass=wpuser2

/usr/sbin/php-fpm7 &

nginx -g "daemon off;"
