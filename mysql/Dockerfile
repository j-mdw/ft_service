FROM	alpine:latest

#MYSQL installation

RUN		apk add\
		mysql\
		mysql-client\
		mariadb-server-utils &&\
		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
#COPY	srcs/mysql_setup.sh /

CMD	mysql_install_db --user=mysql --basedir=/usr --datadir="var/lib/mysql"
#		mysqld --user=mysql --basedir=/usr --datadir="var/lib/mysql"
