#!/bin/sh

telegraf --input-filter kubernetes:cpu:disk:diskio:kernel:mem:processes:swap:system: --output-filter influxdb config > $TELEGRAF_CONFIG_PATH

sed -i s/"\# urls \= \[\"http\:\/\/127\.0\.0\.1\:8086\"\]"/"  urls =\ [\"http\:\/\/influxdb-service:8086\"\]"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# database \= \"telegraf\""/"database \= \'$INFDB_NAME\'"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# username \= \"telegraf\""/"username \= \'$INFDB_USER\'"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# password \= \"metricsmetricsmetricsmetrics\""/"password \= \'$INFDB_PW\'"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# user_agent \= .*"/"user_agent \= \"telegraf_ki_k8s\""/ $TELEGRAF_CONFIG_PATH

sed -i s/"url \= \"http\:\/\/127\.0\.0\.1\:10255"/"url \= \"https\:\/\/"$EXT_IP"\:10250"/ $TELEGRAF_CONFIG_PATH

sed -i s/"\# insecure_skip_verify .*"/"insecure_skip_verify = true"/ $TELEGRAF_CONFIG_PATH

telegraf
