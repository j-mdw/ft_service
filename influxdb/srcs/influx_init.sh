#!/bin/sh

influx << EOF
create database telegrafdb
create user telegraf with password 'password'
grant all on telegrafdb to telegraph
EOF
