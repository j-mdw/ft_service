FROM	alpine:latest

#MYSQL installation

RUN		apk add\
			mysql\
			mysql-client\
			mariadb-server-utils &&\
			chown -R mysql:mysql /var/lib/mysql &&\
			mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
#COPY	srcs/mysql_setup.sh /

CMD	mysql_install_db --user=mysql --datadir="/var/lib/mysql";\
		cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
#		mysqld --user=mysql --basedir=/usr --datadir="var/lib/mysql"
