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
   - Single Load Balancer for Layer 4 (TCP) and Layer 7 (HTTP) traffic
## Public vs Private Load Balancers 
Terraform Links: https://www.terraform.io/docs/providers/oci/r/load_balancer_load_balancer.html

### Public Load Balancer
- Accepts traffic from the internet by using a public IP address
- It is a regional service
  - It requires either :
    - a regional subnet (recommended)
    - 2x AD-specific subnets, each in a separate AD
  - A Primary LB and a Secondary LB are created, each in a separate AD - but they are transparent to the user and you can't designate the Primary LB
  - Floating Public IP is attached to the primary Load Balancer. In case of outage, it will move to the secondary Load Balancer
  
### Private Load Balancer

- Depending on the subnet it runs it, it can be
 - Regional
 - AD specific
- Primary and Standby each acquire a private IP

## Load Balancer Components
### Listener
Listener = entity that listens for incoming traffic. A load balancer supports up to 16 listeners (ports). Each listener is connected to a different Backend Set object

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_listener.html

### Backend Set
Backend Set = logical entity defined by a list of Backend Servers, a load Balancing Policy and a health check policy

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_backend_set.html

#### Backend Servers 
Backend servers = application server responsible to reply to incoming requets.

Terraform links: https://www.terraform.io/docs/providers/oci/r/load_balancer_backend.html

#### Load Balancing Policy
 Policies:
 - **round robin** (default). Each connection is distributed sequentially to each server in the backend set.
 - **IP Hash** - uses the incoming source IP as a hash key to route non-sticky traffic to the same backend server
 - **least connection** - routes incoming non-sticky traffic to the backend server with the fewest active connections.
 
 How policies are applied:
 - A TCP load balancer considers policy and weight criteria
 - A HTTP load balancer with cookie-based session persistence forwards requests using cookie's session info
 -  For non-sticky HTTP request, load balancer applies policy and weight criteria.

#### Health Checks
Health Checks = a test to confirm availability of backed servers:
- Health Checks are activated for Backends, Backend Set, Overall Balancer. 
- Types: TCP, HTTP
- Health Statuses: OK, Warning, Critical, Unknown.
- status is updated every 3 mintues

