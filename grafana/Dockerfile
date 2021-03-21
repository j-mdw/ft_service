FROM	alpine:latest

RUN     apk add grafana

ENV		  GF_SECURITY_DISABLE_INITIAL_ADMIN_CREATION true


CMD		cd /usr/share/grafana; \
        grafana-server
