#!/bin/sh

#stopping nginx on localhost
nginx -s stop

#minikube delete
#minikube start --driver=docker
eval $(minikube -p minikube docker-env) #in order for minikube to look for docker images locally

#image build

docker build nginx/ -t nginx_service	 #nginx image build

kubectl apply -f nginx/depl_nginx.yaml #nginx service deployment

minikube dashboard & #open kubernetes dashboard
