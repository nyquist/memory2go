# sudoers
```
useradd USER
mkdir -p /home/USER/.ssh
password USER
cat /etc/sudoers
visudo
```
add
```
USER  ALL=(ALL) ALL
```
disable root login for ssh:
```
sudo vi /etc/ssh/sshd_cofnig
permitRootLogin no
```
