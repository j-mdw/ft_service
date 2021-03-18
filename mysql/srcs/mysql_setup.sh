#!/bin/sh

mysql_install_db --user=mysql --basedir=/usr --datadir="/var/lib/mysql"

/usr/bin/mysqld_safe

sleep 3

sh /mysql_init
