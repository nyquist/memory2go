# Setting IP
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

# Hostname
```
vi /etc/hostname
```
 
change `localhost.localdomain` to `HOST1`:
```
vi /etc/hosts
```
Add:
```
127.0.0.1 host1
```
Reboot:
```
shutdonw -r now
```

# SSH
When connecting the first time to a remote system using ssh, and the key is accepted, an entry is added in `~/.ssh/known_hosts`. If the key of the remote host changes, you won't be able to connect unless you remove the line for that host (with the previous key) from that file

