#!/bin/sh

#Directories (relative path)

mlb_dir="metallb/"
ngx_dir="nginx/"
wop_dir="wordpress/"
pma_dir="phpmyadmin/"
msq_dir="mysql/"

#files (relative path)

mlb_yaml="$mlb_dir""metallb.yaml"
ngx_yaml="$ngx_dir""nginx.yaml"
wp_yaml="$wp_dir""wordpress.yaml"
pma_yaml="$pma_dir""phpmyadmin.yaml"
cnf_map="service_configmap.yaml"

#	Stopping nginx on localhost

# sudo nginx -s stop

#	Creating TLS certificates

# mkdir certs
# cd certs
# openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -batch -out cert.pem -keyout key.pem
# chmod 400 key.pem
# cp *.pem ../nginx/srcs
# cd ..

#	Minikube setup
# minikube delete
# minikube start --driver=docker
#eval $(minikube -p minikube docker-env) #in order for minikube to look for docker images locally

#Metallab install and start

# sh ./metallb/metallb_install.sh
k8s_ip=$(kubectl describe service/kubernetes | grep -i endpoints | grep -E -o "(([0-9]{1,3}[\.]){3})([0-9]{1,3}){1}")
echo $k8s_ip
k8s_ip_last=$(echo $k8s_ip | grep -E -o "([^.]*$)")
echo $k8s_ip_last
k8s_ip_last=$((k8s_ip_last + 1))
echo $k8s_ip_last
k8s_ip=$(echo $k8s_ip | grep -E -o "(([0-9]{1,3}[\.]){3})")
echo $k8s_ip
k8s_ip="$k8s_ip$k8s_ip_last"
echo $k8s_ip
#sed -E -i "s/(([0-9]{1,3}[\.]){3}[0-9]{1,3}{1})/$k8s_ip/g" $mld_yaml
sed -i s/'  ext_ip:'/"  ext_ip: ""$k8s_ip"/ $cnf_map

# kubectl apply -f $mld_yaml #need to get IP address first 

#image build
# docker build $ngx_dir -t nginx-service	 #nginx image build
# docker build $wp_dir -t wordpress-service
# docker build $pma_dir -t phpmyadmin-service
# docker build $msq_dir -t mysql-volume

#docker run --rm -d -p 80:80 -p 443:443 nginx-service
#docker run --rm -d -p 5050:5050 wordpress-service
#docker run --rm -d -p 5000:5000 phpmyadmin-service
#docker run --rm -d mysql-volume

#Cluster deployments

# kubectl apply -f $ngx_yaml
# kubectl apply -f $wp_yaml

#minikube dashboard & #open kubernetes dashboard
