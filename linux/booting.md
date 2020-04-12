# Boot managers
## LILO
`/etc/lilo.conf`

## GRUB
`/boot/grub/menu.lst`

# The Boot process
## User space startup sequence

**init** processes:
 - **System V** - a traditional sequenced init. Configure it in `/etc/inititab`
 -  **systemd** - emerging standard for init. Configure it in `/etc/systemd`
 - **upstart** - used by Ubuntu in the past. Confgure it in `/etc/init`

`dmesg` - see kernel ring buffer - includes messages seen at boot
`/var/log/dmesg` - dmesg log
`/var/log/boot` - boot messages form syslogd

Power -> Bios ->Boot Loader -> Kernel -> init (/sbin/init): pid 1 -> read init process config.

### systemd
See https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files

### SystemV
#### Runlevels
0 - SHUTDOWN - transitional. Used to shift the system from one state to another. 
1, s, S - SINGLE USER 
2 - On Debian it is a full multi-user with X and graphical login.  Other distributions leave it undefined
3 - On Fedora, Mandriva, RedHat, etc it is a full multi-user with console login
4 - undefined
5 - On Fedora, Mandriva, RedHat, etc it is a full multi-user with graphical login
6 - REBOOT - transitional

`runlevel` - print previous and current runlevel

`init LEVEL` - changes runlevel. 

## Shutdown
`shutdown [OPTIONS] [WALL]` - sends the WALL message to all users who are logged into your system and prevents other users from logging in during the process of changing runlevels

```
now - shuts down now
-r - reboots the machineq
-H - halts the machine (terminates operations but it doesn't shut it off)
-P - powers off the machine (default)
+N - in N minutes
-c TEXT - cancels shutdown (if initiated with +N, where n>0)
```
