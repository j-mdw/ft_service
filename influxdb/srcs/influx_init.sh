#!/bin/sh

influxd &

sleep 3

influx << EOF
create database telegrafdb
create user telegraf with password 'password'
grant all on telegrafdb to telegraph
EOF

telegraf --config /etc/telegraf.conf.d/telegraf.conf
#--config /etc/telegraf.conf

wait
