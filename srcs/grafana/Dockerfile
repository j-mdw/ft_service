FROM	alpine:3.13

RUN     apk add \
		grafana

COPY	srcs/grafana.db /usr/share/grafana/data/grafana.db

CMD		cd /usr/share/grafana; \
        grafana-server
