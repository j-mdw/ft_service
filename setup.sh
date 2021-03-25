#!/bin/sh

# #   Directories (relative path)

mlb_dir="srcs/metallb/"
ngx_dir="srcs/nginx/"
wp_dir="srcs/wordpress/"
pma_dir="srcs/phpmyadmin/"
msq_dir="srcs/mysql/"
ftp_dir="srcs/ftps/"
tgf_dir="srcs/telegraf/"
gfa_dir="srcs/grafana/"
idb_dir="srcs/influxdb/"

#   Files (relative path)

mlb_yaml="$mlb_dir""metallb.yaml"
ngx_yaml="$ngx_dir""depl_nginx.yaml"
wp_yaml="$wp_dir""depl_wordpress.yaml"
pma_yaml="$pma_dir""depl_phpmyadmin.yaml"
msq_yaml="$msq_dir""depl_mysql.yaml"
cnf_map="srcs/service_configmap.yaml"
secret_yaml="srcs/secrets.yaml"
ftp_yaml="$ftp_dir""depl_ftps.yaml"
tgf_yaml="$tgf_dir""depl_telegraf.yaml"
gfa_yaml="$gfa_dir""depl_grafana.yaml"
idb_yaml="$idb_dir""depl_influxdb.yaml"

#   Scripts

mlb_install="$mlb_dir""metallb_install.sh"

#   sh exits when any command fails

#set -e

#	Minikube setup

minikube delete
minikube start --driver=docker

eval $(minikube -p minikube docker-env)

#	Stopping nginx on localhost

#sudo nginx -s stop

#	Creating TLS certificates

  mkdir -p certs
  cd certs
  if [ -f "key.pem" ]; then
  	echo "tada"
  	chmod -f 666 key.pem
  fi
  openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -batch -out cert.pem -keyout key.pem
  chmod 666 key.pem
  cd ..
  cp -f certs/*.pem "$ngx_dir"srcs
  cp -f certs/*.pem "$wp_dir"srcs
  cp -f certs/*.pem "$pma_dir"srcs
  cp -f certs/*.pem "$ftp_dir"srcs

  chmod 400 certs/key.pem "$ngx_dir"srcs/key.pem "$wp_dir"srcs/key.pem "$pma_dir"srcs/key.pem "$ftp_dir"srcs/key.pem

#   Metallab install and start

sh "$mlb_install"

k8s_ip=$(kubectl describe service/kubernetes | grep -i endpoints | grep -E -o "(([0-9]{1,3}[\.]){3})([0-9]{1,3}){1}")
echo $k8s_ip
sed -E -i "s/(([0-9]{1,3}[\.]){3}[0-9]{1,3}{1})/$k8s_ip/g" $mlb_yaml
sed -E -i s/'  EXT_IP:'".*"/"  EXT_IP: ""$k8s_ip"/ $cnf_map

#Docker images build
docker build $ngx_dir -t nginx-service
docker build $wp_dir -t wordpress-service
docker build $pma_dir -t phpmyadmin-service
docker build $msq_dir -t mysql-service
docker build $ftp_dir -t ftps-service
docker build $idb_dir -t influxdb-service
docker build $tgf_dir -t telegraf-service
docker build $gfa_dir -t grafana-service

# Cluster deployments

kubectl apply -f $mlb_yaml
kubectl apply -f $cnf_map
kubectl apply -f $secret_yaml
kubectl apply -f $msq_yaml
kubectl apply -f $idb_yaml
kubectl apply -f $ngx_yaml
kubectl apply -f $wp_yaml
kubectl apply -f $pma_yaml
kubectl apply -f $ftp_yaml
kubectl apply -f $tgf_yaml
kubectl apply -f $gfa_yaml

# Dashboard
minikube dashboard &
