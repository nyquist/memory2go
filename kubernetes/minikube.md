```
minkube version
minikube start
```

```
kubectl version
- client version = kubectl version
- server version = Kubernetes version installed on the master

kubectl cluster-info
= shows Master node endpoing
= shows KubeDNS endpoint

kubectl get nodes
= lists current nodes

kubectl create deployment DEPLOYMENT-NAME --image=DOCKER-IMAGE

kubectl proxy

kubectl get pods

kubectl get pods -o go-template --template {{
