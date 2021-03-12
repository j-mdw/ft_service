#!/bin/sh

#stopping nginx on localhost
#sudo nginx -s stop

#creating TLS certificates
#mkdir certs
#cd certs
#openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -batch -out cert.pem -keyout key.pem
#chmod 400 key.pem
#cp *.pem ../nginx/srcs
#cd ..

#	Minikube setup
#minikube delete
#minikube start --driver=docker
eval $(minikube -p minikube docker-env) #in order for minikube to look for docker images locally

#Metallab install and start

sh ./metallb_install.sh
 kubectl describe service/kubernetes | grep -i endpoints | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"

kubectl apply -f metallb.yaml #need to get IP address first 

#image build
docker build nginx/ -t nginx-service	 #nginx image build
docker build wordpress/ -t wordpress-service
docker build phpmyadmin/ -t phpmyadmin-service
docker build mysql/ -t mysql-volume

#docker run --rm -d -p 80:80 -p 443:443 nginx-service
#docker run --rm -d -p 5050:5050 wordpress-service
#docker run --rm -d -p 5000:5000 phpmyadmin-service
#docker run --rm -d mysql-volume

#Cluster deployments

kubectl apply -f nginx/depl_nginx.yaml #nginx service deployment

minikube dashboard & #open kubernetes dashboard
