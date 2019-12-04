# Mikrotik best practices

## Set external DNS, disable remote queries
```/ip dns set allow-remote-requests=no servers=8.8.8.8,8.8.4.4```
## Set NTP servers, enable NTP client
```/system ntp client set enabled=yes server-dns-names=0.pool.ntp.org,1.pool.ntp.org,2.pool.ntp.org,3.pool.ntp.org```
## Disable services except SSH, Winbox
```/ip service set telnet,ftp,www,api,api-ssl disabled=yes ```
## Set optimal 802.11 wireless interface settings on branch office APs
```/interface wireless set wlan1 mode=ap-bridge wireless-protocol=802.11 frequency=auto band=2ghz-b/g/n channel-width=20mhz distance=indoors frequency-mode=regulatory-domain country="united states"```
## Remove logging action artifacts from past troubleshooting
```/system logging action remove [/system logging action find where !default]```
## Add the Syslog action for reporting to the internal syslog server
```/system logging action add name="Syslog" target=remote remote=10.1.0.162 remote-port=514 src-address=0.0.0.0 bsd-syslog=yes syslog-time-format=bsd-syslog syslog-facility=daemon syslog-severity=auto```
## Disable default logging
```/system logging set 0,1,2,3 disabled=yes```
##  Remove logging artificats from past troubleshooting
```/system logging remove [/system logging find where !default]```
## Echo informational events to the terminal
```/system logging add topics=info action=echo```
## Send critical events to Syslog server
```/system logging add topics=critical action=Syslog```
## Check for package updates
```/system package update check-for-updates```
## Run package updates and reboot if needed
```/system package update upgrade```
## Script for auto-updating routeros letsencrypt certificate
https://github.com/Neilpang/acme.sh/blob/master/deploy/routeros.sh


    
### Inspired by
* https://www.reddit.com/r/mikrotik/comments/2sm48h/ansible_playbook/
