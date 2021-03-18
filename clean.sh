#!/bin/sh

kubectl delete -f mysql/depl_mysql.yaml
kubectl delete -f nginx/depl_nginx.yaml
kubectl delete -f phpmyadmin/depl_phpmyadmin.yaml
kubectl delete -f wordpress/depl_wordpress.yaml
kubectl delete -f ftps/depl_ftps.yaml
kubectl delete -f persistent_volume.yaml
kubectl delete -f service_configmap.yaml
