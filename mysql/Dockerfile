FROM	alpine:latest

COPY	srcs/mysql_setup.sh /etc/

#MYSQL installation

RUN		apk add\
			mysql\
			mysql-client\
			mariadb-server-utils 

RUN		chown -R mysql:mysql /var/lib/mysql

RUN		mkdir -p /run/mysqld

RUN		chown -R mysql:mysql /run/mysqld

RUN		mysql_install_db --user=mysql --datadir="/var/lib/mysql";\
			/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=mysql;\
			/etc/mysql_setup.sh

RUN		sed -i 's/#bind/bind/' /etc/my.cnf.d/mariadb-server.cnf
RUN		sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

EXPOSE	3306

CMD		/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=mysql
