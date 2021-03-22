#!/bin/sh

telegraf --input-filter kubernetes --output-filter influxdb config > $TELEGRAF_CONFIG_PATH

# sed -i s/"\# urls \= \[\"http\:\/\/127\.0\.0\.1\:8086\"\]"/"  urls =\ [\"http\:\/\/172\.17\.0\.1\:8086\"\]"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# urls \= \[\"http\:\/\/127\.0\.0\.1\:8086\"\]"/"  urls =\ [\"http\:\/\/influxdb-service:8086\"\]"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# database \= \"telegraf\""/"database \= \'$INFDB_NAME\'"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# username \= \"telegraf\""/"username \= \'$INFDB_USER\'"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# password \= \"metricsmetricsmetricsmetrics\""/"password \= \'$INFDB_PW\'"/ $TELEGRAF_CONFIG_PATH

telegraf --config $TELEGRAF_CONFIG_PATH
