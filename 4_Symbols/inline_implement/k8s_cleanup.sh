#!/bin/bash

kubectl delete deployment frontend-deployment backend-deployment
kubectl delete service backend-service
kubectl delete configmap nginx-config 