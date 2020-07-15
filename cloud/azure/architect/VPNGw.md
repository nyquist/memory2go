VPN Gateway is a type of Virtual Network Gateway

Only one VPN Gateway in a VNET.

VPN GW Types:
- Policy Based VPN:
    - supports IKEv1 only
    - use of static routes
- Route Based VPN
    - supports: connection between VNETs, point-to-site connections, multisite connections, coexistence with Azure ExpressRoute Gateway
    - supports IKEv2
    - uses any to any traffic selector
    - can use dynamic routing protocols
    
VPNGw sizes:
- Basic: 10 sites, 100 Mbps, no BGP support
- VpnGw1/Az: 30 sites, 650Mbps, BGP supported
- VpnGw2/Az: 30 sites, 1Gbps, BGP supported
- VpnGw3/Az: 30 sites, 1.25Gbps, BGP Supported


Required resources:
- VNET
- GatewaySubnet of at least /27
- Public IP Address (Basic-SKU). Dynamic but it won't change
- Local Network Gateway
- Virtual Network Gateway
- Connection
