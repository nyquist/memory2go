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
- A CPE object is created where the on-prem router is added
- The DRG Creates an IPSect Connection between CPE and DRG
- Static routing

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

