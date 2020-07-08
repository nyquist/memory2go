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

kubectl get
= list resources

kubectl get nodes
= lists current nodes

kubectl get pods

kubectl create deployment DEPLOYMENT-NAME --image=DOCKER-IMAGE

kubectl proxy

kubectl describe
= show detailed info about a resource

kubectl describe pods

kubectl logs 
= print the logs from a container in a pod

kubectl exec
= execute a command on a container in a pod

kubectl exec POD CMD
kubectl exec -ti POD CMD



