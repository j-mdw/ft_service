FROM	alpine:latest

#MYSQL installation

RUN		apk add\
		mysql\
		mysql-client\
		mariadb-server-utils 

RUN		chown -R mysql:mysql /var/lib/mysql
RUN		mkdir -p /run/mysqld
RUN		chown -R mysql:mysql /run/mysqld

RUN		sed -i 's/#bind/bind/' /etc/my.cnf.d/mariadb-server.cnf
RUN		sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

COPY	srcs/mysql_setup.sh /

COPY 	srcs/mysql_init 	/

EXPOSE	3306

CMD		/mysql_setup.sh

