Options to connect your on-prem to Azure Cloud

# VPN - up to 1.5Gbps per tunnerl

# ExpressRoutes
Usually a provider is used to access the ExpressRoute service
```
[Customer On-Prem] <--> [Service Provider] <--> [MSEE Router] <--> [Azure] (Private Peering)
                                                       |---------> [Other Microsoft Public Services] (Microsoft Peering)
```
MSEE = Microsoft Enterprise Edge (Physical router)

In a provider's colo:
A - the side that wants to connect (customer)
Z - the side where A wants to connect to (Microsoft)

```
[Customer On-Prem] <-802.1q-> [Service Provider] <-QinQ-> [MSEE Router] <--> [Azure]
```
QinQ is used between SP and MSEE
802.Q is used between SP and Customer
- Goes up to 10 Gbps (active/active. Potentially can get to 20Gbps)
- Doesn't support MACSEC?

##ExpressRoute Direct
- Still needs to happen in a colo
- Supports MACSEC
- Customer can chose between QinQ and 802.1q
- Goes up to 100Gbps (active/active. Potentially can get to 200Gbps)
```
[Customer On-Prem] <- QinQ or 802.1q -> [MSEE Router] <--> [Azure]
```
You still need to define

## ExpressRoute Gateway
- Virtual Gateway maintains BGP session with MSEE and exposes the internal virtual IP space to an external physical space 
- Traffic from MSEE to VNET goes through Gateway
- Traffic from VNET to MSEE bypassess Gateway
### FastPath
- Traffic from MSEE to VNET also bypasses Gateway
- Not all scenarios are supported. Unsupported scenarios will go through Gateway.
- Gateway is still required because it maintains BGP sessions.


## Peering
- Private - to access Customer Private resources in Azure
- Public (not available anymore. Merged into Microsoft Peering) - to access Azure Public Services
- Microsoft Peering - to access any Microsoft Public Services(like Office365) but now includes Azure Public Services.

