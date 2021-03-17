#!/bin/sh

mysql_install_db --user=root --datadir="/var/lib/mysql"

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=root --init_file=/myslq_init
