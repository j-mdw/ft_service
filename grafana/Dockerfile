FROM		alpine:latest

WORKDIR	/var/www/localhost/htdocs

RUN			wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.5.linux-amd64.tar.gz

RUN			tar -zxvf grafana-enterprise-7.4.5.linux-amd64.tar.gz

RUN			mv grafana-entreprise-7.4.5.linux-amd64 grafana

RUN			chomd -R 777 grafana
