FROM	alpine:latest

RUN     apk add \
		grafana\
		curl

COPY	srcs/dashboard_prov.yaml /usr/share/grafana/conf/provisioning/dashboards

COPY	srcs/db_prov.yaml /usr/share/grafana/conf/provisioning/datasources

ENV				INFDB_NAME="telegrafdb"

ENV				INFDB_USER="telegraf"

ENV				INFDB_PW="password"

#CMD		cd /usr/share/grafana; \
#        grafana-server
