# OCI Connectivty

## Connectivity to Public Internet
- [Internet Gateways](https://github.com/nyquist/oci-notes/blob/master/OCI-VCN.md#internet-gateways-igw)
- [NAT Gateways](https://github.com/nyquist/oci-notes/blob/master/OCI-VCN.md#nat-gateways-ngw)
- [Reserved and Ephemeral Public IP Addresses](https://github.com/nyquist/oci-notes/blob/master/OCI-VCN.md#public-ips)

## Connectivity to On-Prem
### IPSec VPN
- Can be implemented using the OCI Managed VPN Service (Free) or using Software VPN running on OCI Compute.

#### OCI Managed VPN Service
- No SLA
- Expect ~250Mbps
- Only IPSec Tunnel mode is supported
- A CPE object needs to be created in order to define the tunnel endpoint. The CPE object is a virtual representation of your actual on-prem CPE
- An IPSec Connection between CPE and DRG is created and the DRG must be attached to the VCN.
- Routing options:
  - Static
  - Dynamic: BGP

Steps to create:
1. Create VCN
2. Create DRG
3. Attach DRG to VCN
4. Update VCN Route Table to route traffic to on-prem via DRG
5. Create CPE Object
6. From DRG, Create an IPSec Connection between CEP and DRG and provide static routes or BGP configuration
7. Configure on-prem CPE device

### FastConnect
- Uses private dedicated connectivity
- SLA
- Port Speeds: 1Gbps or 10Gbps
- Dynamic Routing (BGP)
- Virtual Circuits = Isolated network ports that use one or more physical network connection to provide a logical connection between customer edge router and DRG
- A partner provider is usually used to provide FastConnect POPs
- Peering Types
  - Private Peering: used to access VCN resources. Traffic goes through DRG
  - Public Peering: used to access Public OCI Services (ObjectService). It doesn't go through DRG.

