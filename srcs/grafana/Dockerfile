FROM	alpine:latest

RUN     apk add \
		grafana

COPY	srcs/grafana.db /usr/share/grafana/data/grafana.db

CMD		cd /usr/share/grafana; \
        grafana-server
