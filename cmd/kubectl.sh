#!/bin/bash

# Start minikube with docker
# The option --alsologtostderr: enables the log to see the detailed log output
minikube start --driver=docker --alsologtostderr

# Create one pod with name nginx-pod and using the nginx image
kubectl run nginx-pod --image=nginx:latest

# See informations of the nginx-pod
kubectl descibre nginx-pod

# Create a pod with file
kubectl apply -f first-pod.yaml
kubectl apply -f pod-nginx.yaml
kubectl apply -f svc-pod.yaml
kubectl apply -f load-balancer.yaml


# Delete pod
# kubectl delete pod nginx-pod
# kubectl delete -f first-pod.yaml

# To access the terminal in the container on the pod
kubectl exec -it first-pod-declarative -- bash

# The minikube dashboard command, which opens a new tab in our web browser, displaying the Kubernetes Dashboard:
minikube dashboard 