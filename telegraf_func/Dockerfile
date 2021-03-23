FROM		alpine:latest

RUN			apk add \
			telegraf

# ENV				TELEGRAF_CONFIG_PATH="/etc/telegraf.conf.d/telegraf.conf"

# ENV				INFDB_NAME="telegrafdb"

# ENV				INFDB_USER="telegraf"

# ENV				INFDB_PW="password"

# RUN				telegraf --input-filter docker --output-filter influxdb config > ${TELEGRAF_CONFIG_PATH}

# RUN				sed -i s/"\# urls \= \[\"http\:\/\/127\.0\.0\.1\:8086\"\]"/"  urls =\ [\"http\:\/\/172\.17\.0\.1\:8086\"\]"/ ${TELEGRAF_CONFIG_PATH}
# RUN				sed -i s/"\# database \= \"telegraf\""/"database \= \'${INFDB_NAME}\'"/ ${TELEGRAF_CONFIG_PATH}

# RUN				sed -i s/"\# username \= \"telegraf\""/"username \= \'${INFDB_USER}\'"/ ${TELEGRAF_CONFIG_PATH}

# RUN				sed -i s/"\# password \= \"metricsmetricsmetricsmetrics\""/"password \= \'${INFDB_PW}\'"/ ${TELEGRAF_CONFIG_PATH}

# CMD			  telegraf --config ${TELEGRAF_CONFIG_PATH}

COPY		srcs/telegraf_setup.sh /

RUN			mkdir -p /etc/telegraf.conf.d

COPY		srcs/telegraf.conf /etc/telegraf.conf.d/

CMD			sh telegraf_setup.sh

# Need to enable http and bind-address
#Socket mount - should be done in yaml file
#docker run --rm -d -v /var/run/docker.sock:/var/run/docker.sock telegraf-service

#https://kubernetes:443
#http://kubernetes.default.svc

