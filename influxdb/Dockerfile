FROM		alpine:latest

RUN			apk add \
				influxdb
			#	telegraf

#RUN			mkdir -p /var/lib/influxdb

#RUN			adduser influxdb

#RUN			chown -R influxdb:influxdb /var/lib/influxdb

# ENV				TELEGRAF_CONFIG_PATH="/etc/telegraf.conf.d/telegraf.conf"

# ENV				INFDB_NAME="telegrafdb"

# ENV				INFDB_USER="telegraf"

# ENV				INFDB_PW="password"
#RUN				telegraf --input-filter docker --output-filter influxdb config > ${TELEGRAF_CONFIG_PATH}
#RUN				telegraf --output-filter influxdb config > ${TELEGRAF_CONFIG_PATH}

#RUN				sed -i s/"\# urls \= \[\"http\:\/\/127\.0\.0\.1\:8086\"\]"/"  urls =\ [\"http\:\/\/127\.0\.0\.1\:8086\"\]"/ ${TELEGRAF_CONFIG_PATH}
#RUN				sed -i s/"\# database \= \"telegraf\""/"database \= \'${INFDB_NAME}\'"/ ${TELEGRAF_CONFIG_PATH}

#RUN				sed -i s/"\# username \= \"telegraf\""/"username \= \'${INFDB_USER}\'"/ ${TELEGRAF_CONFIG_PATH}

#RUN				sed -i s/"\# password \= \"metricsmetricsmetricsmetrics\""/"password \= \'${INFDB_PW}\'"/ ${TELEGRAF_CONFIG_PATH}

COPY			srcs/influx_init.sh /

EXPOSE			8086 8088

CMD				sh influx_init.sh

# Need to enable http and bind-address
