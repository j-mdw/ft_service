#!/bin/sh

#kubectl delete -f nginx/depl_nginx.yaml
#kubectl delete -f phpmyadmin/depl_phpmyadmin.yaml
#kubectl delete -f wordpress/depl_wordpress.yaml
kubectl delete -f telegraf/depl_telegraf.yaml
kubectl delete -f grafana/depl_grafana.yaml
kubectl delete -f ftps/depl_ftps.yaml
kubectl delete -f service_configmap.yaml

#kubectl delete -f mysql/depl_mysql.yaml
kubectl delete -f influxdb/depl_influxdb.yaml
kubectl delete -f persistent_volume.yaml
