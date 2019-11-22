# OCI Load Balancing

Load Balancer tasks:
 - Service Discovery
 - Health Checks
 - Load Balancing
 
 Benefits:
  - Fault Tolerance and HA
  - Scale
  - Name abstraction: Backends don't need public IP Addresses
  
  Supported protocols: TCP, HTTP/1.0, HTTP/1.1, HTTP/2, WebSocket
  
  Supports SSL Termination, End-to-End SSL, SSL Tunneling, session persistence, content based routing.
  
  Differentiators:
   - Public and Private Load Balancers
   - Provisioned Bandwidth: 100 Mbps, 400 Mbps, 8 Gbps
   - Single Load Balancer for Layer 4(TCP) and Layer 7(HTTP)traffic
   

## Backend Set
Backend Set = logical entity defined by a list of Backend Servers, a load Balancing Policy and a health check policy

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_backend_set.html

### Load Balancing Policy
 - round robin (default). Each connection is distributed sequentially to each server in the backend set.
 - IP Hash - uses the incoming source IP as a hash key to route non-sticky traffic to the same backend server
 - least connection - routes incoming non-sticky traffic to the backend server with the fewest active connections.
 
 A TCP load balancer considers policy and weight criteria
 
 A HTTP load balancer with cookie-based session persistence forwards requests using cookie's session info
 
 For non-sticky HTTP request, load balancer applies policy and weight criteria.

### Backend Servers 
Backend servers = application server responsible to reply to incoming requets.

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_backend.html

### Health Checks
Health Checks = a test to confirm availability of backed servers:
 - TCP
 - HTTP

Health Checks are activated for Backends, Backend Set, Overall Balancer. 
Health Statuses: OK, Warning, Critical, Unknown.



## Listner
Listner = entity that listens for traffic. A load balancer supports up to 16 listners (ports). Each listner is connected to a different Backend Set

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_listener.html

## Public vs Private Load Balancers
Terraform Links: https://www.terraform.io/docs/providers/oci/r/load_balancer_load_balancer.html

### Public Load Balancer
Acts as a regional load balancer. It requires 2 subnets, each in another AD.  Public IP is attached to subnet1 and moves to subnet2 in case of an outage.
 
### Private Load Balancer
Runs within a single AD. It is assigned a private IP Address. Both active and failover LB run in the same AD. Can be used to 
