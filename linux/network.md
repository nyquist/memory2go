```
cd /etc/sysconfig/network-scripts
ls
vi ifcfg-eno1
```
To set a static IP:
```
Bootproto =  dhcp/static
Onboot = yes
Ipaddr = 192.168.1.201
Netmask = 255.255.255.0
Gateway = 192.168.1.1
Dns1 = 8.8.8.8
Dns2 = 8.8.4.4
``` 
and then:

```
service network restart
```
