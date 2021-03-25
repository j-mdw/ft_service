#!/bin/sh

influxd &

sleep 3

influx << EOF
create database $INFDB_NAME;
create user $INFDB_USER with password '$INFDB_PW';
grant all on $INFDB_NAME to $INFDB_USER;
EOF

wait
