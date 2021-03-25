#!/bin/sh

mysql_install_db --user=mysql --basedir=/usr --datadir="/var/lib/mysql"

/usr/bin/mysqld_safe &

sleep 3 #allow time for mysqld_safe to start as next command needs it to be running

sh /mysql_init #initialize wp db and users

wait #waits until bg process are over - container won't stop
