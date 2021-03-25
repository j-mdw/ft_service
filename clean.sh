#!/bin/sh

kubectl delete -f srcs/nginx/depl_nginx.yaml
kubectl delete -f srcs/phpmyadmin/depl_phpmyadmin.yaml
kubectl delete -f srcs/wordpress/depl_wordpress.yaml
kubectl delete -f srcs/telegraf/depl_telegraf.yaml
kubectl delete -f srcs/grafana/depl_grafana.yaml
kubectl delete -f srcs/ftps/depl_ftps.yaml
kubectl delete -f srcs/mysql/depl_mysql.yaml
kubectl delete -f srcs/influxdb/depl_influxdb.yaml
kubectl delete -f srcs/service_configmap.yaml
kubectl delete -f srcs/secrets.yaml