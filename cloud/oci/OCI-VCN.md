# OCI Virtual Cloud Networks

## VCN
A VCN is a private network that you setup in OCI DataCenters. It covers a single, contiguous IPv4 CIDR block of your choice.
It resides in a single region but it spans all ADs in the region.
It is recommended to use private IP addresses(10.0.0.0/16, 172.16.0.0/12, 192.168.0.0/16) when assigning VCN CIDR block, but public IP space can also be used. 
The largest allowed VCN CIDR block is /16.
First 2 and Last IP address are reserved (Network Address, Default Gateway, Broadcast Address)

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_vcn.html


## Availability Domains (ADs)
Each region has up to 3 ADs. A VCN spans all ADs in a region.

## Subnets
A subnet can be AD specific or regional(spans all ADs).

Subnets can be:
- Private = Instances connected to the subnet use private IP Addresses
- Public = Instances connected to the subnet use both private and public IP Addresses

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_subnet.html



### Route Table
Route tables are a list of items that contain a Destination CIDR and a Route Target (Next Hop). E.g:
- 0.0.0.0/0 -> Internet Gateway
- 192.168.0.0/16 -> DRG

Each subnet uses a single route table. Inforamtion in a route table is used **only for destinations outside the VCN CIDR**. No routes are required for intra-VCN traffic. You can assign the same route-table object to multiple subnets. A default route table is created with the VCN and can't be removed.

Terraform link: https://www.terraform.io/docs/providers/oci/r/core_route_table.html


## Gateways
### Internet Gateways (IGW)
An IGW provide a path for network traffic between your VCN and the Internet. There is a single Internet GW in the VCN's Route Table. 
It can be used to allow public IP addresses to access the internet and also to allow internet clients to initiate connections to public IP address.

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_internet_gateway.html

### NAT Gateways (NGW)
A NGW gives an entire private subnet access to the internet without assigning public IP address to each instance. It can be used to initiate connections only from the OCI subnet to the internet.
A route needs to be added to the route table to point to the NAT Gateway object. You can have more than 1 NAT GW in a VCN but a subnet can route traffic to only a single NAT Gateway.

Terraform Links: https://www.terraform.io/docs/providers/oci/r/core_nat_gateway.html


### Service Gateways (SGW)
SGWs are used for traffic that is destined for one of the supported OCI Public Services (ObjectStorage) and that is sourced from a private IP address. The traffic will use the OCI backbone and will not traverse the internet.

Terraform Links: https://www.terraform.io/docs/providers/oci/r/core_service_gateway.html

### Dynamic Routing Gateways (DRG)
DRGs provide a path for private traffic between VCN and non-internet destinations like on-prem network. 
It uses [IPSec VPN](https://github.com/nyquist/oci-notes/blob/master/OCI-Connectivity.md#ipsec-vpn) or [FastConnect](https://github.com/nyquist/oci-notes/blob/master/OCI-Connectivity.md#fastconnect) (private dedicated connectivity) to connect your OCI VCNs to on-prem netowrk.
A DRG is a separate object that has to be attached to the VCN. Only 1 DRG can be attached to a VCN.
After attaching the DRG, you must add a route in the VCNs route table to enable traffic flow via the DRG.

Terraform links: 
https://www.terraform.io/docs/providers/oci/r/core_drg.html
https://www.terraform.io/docs/providers/oci/r/core_drg_attachment.html

## Peering
### Local Peering Gateway (LPG)
An LPG allows connectivty between 2 VCNs **in the same region**.
The peering connection is not transitive. If VNC1 is peered with VCN2 and VCN2 is peered with VCN3, you can only access resources between VCN1 and VCN3 if there is an explicit peering between VCN1 and VCN3

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_local_peering_gateway.html

### Remote Peering Connection (RPC)
RPCs are created on the DRGs and can be used to allow connectivity between 2 VCNs **in different regions**.

The peering connection is not transitive. If VNC1 is peered with VCN2 and VCN2 is peered with VCN3, you can only access resources between VCN1 and VCN3 if there is an explicit peering between VCN1 and VCN3

RPCs should be used in DR (Disaster Recovery) Scenarios where some data needs to be replicated in another region.

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_remote_peering_connection.html

## Security
The determination if a packet should be allowed to be sent or received is performed at the VNIC level. If there is any rule that allows it, the packet is forwarded. If not, the packet is dropped.
The rules at the VNIC level can be defined as part of a Security List or as part of a Network Security Group.
OCI follows the white-list model. By default, no communications are allowed, not even in the same subnet.

### Security Rules
A Security Rule is defined by:
- State
  - Stateful Rules - uses connection tracking to allow responses to the allowed initiated traffic
  - Stateless Rules - does not use connection tracking. A separate rule in the reverse direction is needed to explicitly allow response traffic if any.
- Direction
  - Ingress Rules: Applies to incoming traffic (and related outgoing traffic for stateful rules)
  - Egress Rules: Applies to outgoing traffic (and related incoming traffic for stateful rules)
- Source/Destination
  - An ingress rule must have a Source
    - CIDR
    - Service ?
    - NSG (for NSG rules only)
  - An egress rule must have a Destination
    - CIDR
    - Service 
    - NSG (for NSG rules only)
- Protocol and Optional Protocol details
  - TCP (min port, max port)
  - UDP (min port, max port)
  - ICMP (type, code) 
  - ANY

### Security Lists (SL)
A SL is a common set of firewall rules (Security Rules) associated with a subnet and applied to all instances launched inside the subnet.

A subnet can have 1 Route Table and up to 5 Security Lists. Each security list can have up to (~100~200) security rules.

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_security_list.html

### Network Security Groups (NSGs)
A NSG provides a virtual firewall for a set of cloud resources that have all have the same security posture. An NSG consists of a set of rules (Security Rules) that apply only to a set of VNICs of your choice in a single VCN.
Compute instainces, Load Balancers and DB instances support NSGs
When writing rules for an NSG, you can specify an NSG as a source or destination.

## DNS
When defining a subnet's DNS configuration there are 2 options:
- Internet and VCN resolver (Default)
- Custom Resolver

https://www.terraform.io/docs/providers/oci/r/core_dhcp_options.html

### DNS Labels
VCNs and subnets can be assigned DNS Labels. This way an object can be accessed using the FQDN:

VCN: `VCN_DNS_LABEL.oraclevcn.com`

Subnet: `SUBNET_DNS_LABEL.VCN_DNS_LABEL.oraclevcn.com`

Host: `HOSTNAME.SUBNET_DNS_LABEL.VCN_DNS_LABEL.oraclevcn.com`

the domain oraclevcn.com cannot be changed.
Instance FQDN resolves to the instance's Private IP address
No auto FQDN is created for public IP addresses.


## VNICs
A VNIC is a component that enable a compute instance to connect to a VCN. The VNIC determines how the instance connects with endpoints inside and outside the VCN

Every instance has at least 2 VNICs' One primary VNIC and at least 1 secondary VNIC.
Each VNIC has 1 primary private IP. It can have additional secondary private IPs (up to 31). The secondary IPs are assigned only after the instance is launched. In order to make use of the secondary IPs, the instance OS also must be updated to enable the correct ammount of ethernet devices.
VNICs can be used to connect an instance in several scenarios:
- single VNIC in a subnet
- each VNIC in different subnets of the same VCN (virtual appliance scenarios)
- each VNIC in different VCNs (and subnets). This is used for eanbling isolated access to a subnet (SaaS scenarios)

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_vnic_attachment.html

### Instance Failover
This is a use case where a secondary private IP from the VNIC attached to an instance moves to another instance. It can be done only if they both belong to the same subnet

## IP Addresses
### Private IPs
Each VNIC can have at least 1 primary private IP Address.
A private IP can have an optional Public IP assigned to it.


Terraform links: https://www.terraform.io/docs/providers/oci/r/core_private_ip.html


### Public IPs
To access an OCI instance from the internet you can use a public IP address assigned directly to an instance (not recommended) or to an OCI Public LBaaS (can't choose IP. It is provided by Oracle)
Other objects that will use public IP addresses. In all these cases the IP is provided by Oracle and can't be changed. 
- In some cases the IP address can be viewed: OCI Public Load Balancer, NAT Gateway, DRG - IPSec Tunnels, OKE muster/worker nodes
- In other cases the IP address can't be viewed: Internet Gateway, Autonomous DB

Public IP Addresses can be:
- Ephemeral: can be assigned to primary private IP Addresses only (1 per VNIC)
- Reserved: exist beyond the lifetime of the instance. Can be unassigned and reassigned to other instances (max 32/VNIC)

There is no charge for using Public IP address including Reserved IPs.

Terraform links: https://www.terraform.io/docs/providers/oci/r/core_public_ip.html
