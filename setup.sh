#!/bin/sh

# #   Directories (relative path)

mlb_dir="metallb/"
ngx_dir="nginx/"
wp_dir="wordpress/"
pma_dir="phpmyadmin/"
msq_dir="mysql/"

#   Files (relative path)

mlb_yaml="$mlb_dir""metallb.yaml"
ngx_yaml="$ngx_dir""depl_nginx.yaml"
wp_yaml="$wp_dir""depl_wordpress.yaml"
pma_yaml="$pma_dir""depl_phpmyadmin.yaml"
msq_yaml="$msq_dir""depl_mysql.yaml"
cnf_map="service_configmap.yaml"
pv_yaml="persistent_volume.yaml"
secret_yaml="secrets.yaml"

# #   Scripts
# mlb_install="$mlb_dir""metallb_install.sh"

# #   Script exits when any command fails

# set -e

# #	Stopping nginx on localhost

# # sudo nginx -s stop

# #	Creating TLS certificates

#  mkdir -p certs
#  cd certs
#  chmod -f 666 key.pem
#  openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -batch -out cert.pem -keyout key.pem
#  chmod 666 key.pem
#  cd ..
#  cp -f certs/*.pem "$ngx_dir"srcs
#  cp -f certs/*.pem "$wp_dir"srcs
#  cp -f certs/*.pem "$pma_dir"srcs
#  chmod 400 certs/key.pem "$ngx_dir"srcs/key.pem "$wp_dir"srcs/key.pem "$pma_dir"srcs/key.pem 

# #	Minikube setup
# minikube delete
# minikube start --driver=docker
 eval $(minikube -p minikube docker-env) #in order for minikube to look for docker images locally

# #   Metallab install and start

# # sh "$mlb_install"

# k8s_ip=$(kubectl describe service/kubernetes | grep -i endpoints | grep -E -o "(([0-9]{1,3}[\.]){3})([0-9]{1,3}){1}")
# echo $k8s_ip
# k8s_ip_last=$(echo $k8s_ip | grep -E -o "([^.]*$)")
# echo $k8s_ip_last
# k8s_ip_last=$((k8s_ip_last + 1))
# echo $k8s_ip_last
# k8s_ip=$(echo $k8s_ip | grep -E -o "(([0-9]{1,3}[\.]){3})")
# echo $k8s_ip
# k8s_ip="$k8s_ip$k8s_ip_last"
# echo $k8s_ip
# sed -E -i "s/(([0-9]{1,3}[\.]){3}[0-9]{1,3}{1})/$k8s_ip/g" $mlb_yaml
# sed -E -i s/'  ext_ip:'".*"/"  ext_ip: ""$k8s_ip"/ $cnf_map

# #Create Volume dir
# sudo mkdir -p /mnt/data

# #Docker images build
docker build $ngx_dir -t nginx-service
docker build $wp_dir -t wordpress-service
docker build $pma_dir -t phpmyadmin-service
docker build $msq_dir -t mysql-service

#docker run --rm -d -p 80:80 -p 443:443 nginx-service
#docker run --rm -d -p 5050:5050 wordpress-service
#docker run --rm -d -p 5000:5000 phpmyadmin-service
#docker run --rm -d mysql-service

# Cluster deployments

kubectl apply -f $pv_yaml
kubectl apply -f $mlb_yaml
kubectl apply -f $cnf_map
kubectl apply -f $secret_yaml
kubectl apply -f $msq_yaml
kubectl apply -f $ngx_yaml
kubectl apply -f $wp_yaml
kubectl apply -f $pma_yaml

# Dashboard
# minikube dashboard & #open kubernetes dashboard
