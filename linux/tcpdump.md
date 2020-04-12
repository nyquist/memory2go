```
tcpdump [OPTIONS] [FILTERS]
-i [INTERFACE|any] = what interfaces to listen on
-n = don't resolve hostnames
-nn = don't resolve hostnames or port names
-X = shows the packet's contents in both hex and ASCII
-XX = same as -X but shows the ethernet header
-v[v[v]]] = increase the ammount of packet inforamation you get
-c N = only get N number of packets then stop
-s SIZE = define SNAPLENGTH of the captuer butes. Use -s0 to get everything. Default is 96 (start v4.0) or 68 Bytes for older versions.
-S = print absolute sequence numbers
-e = get the ethernet header as well
-q = show less protocol info
-E = decrypt IPSEC traffic by providing an encryption key
-w FILENAME = Write to a file
-r FILENAME = Read from file
```
Filters are a combination of the following options:
```
host [HOSTNAME|ADDRESS] = select traffic that has the host as source or destination
src, dst [HOSTNAME|ADDRESS] = select trafcic that has the host as either source or destination
net CIDR = select traffic that has the CIDR as source or destination
[proto] {TCP|UDP|ICMP} = select traffic of the selected protocol. You don't have to type proto
[src|dst] {port PORT| portrange MIN-MAX} = select traffic for a specific port or range
{less|more} SIZE = packetsize range
{and|&&} = logical and
{or| ||} = logical or
{not|!} = logical not
ip6 = IPv6
```
