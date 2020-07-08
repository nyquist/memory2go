Kubernetes clusters contains 2 types of resources:
- **Master**: coordinates the cluster: scheduling applications, maintaining desired state, scaling, rolling updates
- **Nodes**: is a VM or Physical computer that servers as a worker machine in a cluster.
  - Each node has a **Kubelet** which is an agent for managing the node and communicating with the master
  - The node should also have tools for handling containers (docker or rkt)
  - A production cluster should have a minimum of 3 nodes (why?)
  
When deploying an application to Kubernetes you tell the master to start the application containers. 
Communication between Master and Nodes is done via Kubernetes API which the master exposes. End users can also interract with the cluster via the API.

To deploy an app on top of Kubernetes, you need a **Depoyment** configuration. Once the **Deployment** is created, the master schedules the resources (application instances) included in that deployment to run on individual Nodes in the cluster.
After application instances are created, a **Kubernetes Deployment Controller** continuously monitors those instances. If one of the nodes hosting an instance goes down the Deployment Controller replaces the instance with an instance on another cluster.

Pods that are running inside Kubernetes are running on a private, isolated network. By default they are running on a private, isolated network and are visible by default only from other pods and services withing the same cluster.

You can use `kubectl proxy` to create a proxy to access the pods on the isolated network.

A Pod is a group of one or more application containers and some shared resources for those containers.(volumes, networking, information about how to run containers: image, ports). Pods are atomic units. A deployment creates Pods with containers inside them. Each Pod is tied to the node where it created. In case of Node failure, identical Pods are scheduled on other Nodes.

A Pod always runs on a Node. Each Node is managed by the Master.  Every Kubernetes Node runs Kubelet (for communication to the master) and a container runtime (Docker).

A service defines a logical set of Pods and a policy by wich to access them. The set of Pods targeted by a service is usually determined by a LabelSelector. Services also expose pods outside the cluster. Types:
- ClusterIp (default) - Exposes the Service on an internal IP in the cluster. This type makes the service reachable from within the cluster
- NodePort - exposes the service on the same port of each selected node in the cluster using NAT. Makes the service accessible from outside the cluster using NodeIP:NodePort
- LoadBalancer - Creates an external LB and assigns a fixed external IP to the service
- ExternalName - Exposes the service using an arbitrary name by returning a CNAM record with the name. No proxy is used. This type requires kube-dns

