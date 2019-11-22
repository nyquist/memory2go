## Setting up an IKE VPN Server on Mikrotik with certificate based authentication

### 1. Prepare the certificates to be used
#### 1.1 Create a self-signed CA Certificate
First add a template certificate - in this case called ```my.ca```, set it to trust. Notice the key-usage value which shows that it will be used for CRL and certificate signing. Then, self-sign the certificate 
```
/certificate 
add name=my.ca common-name=my.ca key-usage=key-cert-sign,crl-sign trusted=yes
sign my.ca
```
#### 1.2 Create and sign a certificate for the server (Mikrotik router)
For simplicity, you can use the same value for name and common-name. The common-name is the identity which we try to certify. use the ca certificate created at the previous step to sign the server certificate.
```
/certificate 
add name=vpn.server common-name=vpn.server
sign vpn.server ca=my.ca
```
#### 1.3 Create and sign a certificate for the client
```
/certificate 
add name=vpn.client common-name=vpn.client
sign vpn.client ca=my.ca
```
#### 1.4 Export the client and CA certificate
The point of the export is to save them in a file that allows you to send the certificate to the client device that will connect over VPN.
Don't forget to replace `<PASSPHRASE>`!
```
/certificate 
export-certificate my.ca
export-certificate vpn.client export-passphrase=<PASSPHRASE> type=pkcs12
```
Your exported files should now be stored as `cert_export_my.ca.crt` and `cert_export_vpn.client.p12`
When importing, make sure to set my.ca as a trusted certificate. This will make sure the certificates signed by your CA will be trusted as well.

### 2 Create the prerequisits for IPSec configuration
#### 2.1 Create an IP Pool and add attach it to the router
This IP Pool should be different than your DHCP pool
Exclude from the pool the IP that you will assign to the Mikrotik server. In this case, we'll use 192.168.50.1
```
/ip pool 
add name=vpn-pool ranges=192.168.50.2-192.168.50.100
/ip address 
add address=192.168.50.1/24 interface=bridge-local network=192.168.50.0
```
An ip route should be automatically added for the 192.168.50.0/24 network. 
#### 2.2 Create the firewall rules to allow IPSec Connectivity
Make sure to verify what ID you want to add your rules after so that it is correctly processed. 
```
/ip firewall
add chain=input action=accept protocol=ipsec-esp in-interface-list=WAN log=no log-prefix="" after-rule=ID
add chain=input action=accept protocol=udp in-interface-list=WAN dst-port=500 log=no log-prefix="" after-rule=ID
add chain=input action=accept protocol=udp in-interface-list=WAN dst-port=4500 log=no log-prefix="" after-rule=ID
```
### 3. Create the IPSec Config
#### 3.1 Create an IPSec Mode Config
```
/ip ipsec mode-config
add address-pool=vpn.pool name=ipsec-cfg1 static-dns=8.8.8.8 system-dns=no     
```
#### 3.2 Create an IPSec Proposal
```
/ip ipsec proposal 
add auth-algorithms=sha256 enc-algorithms=aes-256-cbc name=ikev2-proposal pfs-group=none
```
#### 3.3 Create an IPSec Profile
```
/ip ipsec profile
add name="ike2-profile" hash-algorithm=sha256 enc-algorithm=aes-256
     dh-group=modp2048,modp1024 lifetime=1d proposal-check=obey
     nat-traversal=yes dpd-interval=2m dpd-maximum-failures=5
```
#### 3.4 Create an IPSec Peer
```
/ip ipsec peer
add name="VPNPeer" passive=yes profile=ike2-profile exchange-mode=ike2 send-initial-contact=yes
```
#### 3.5 Create an IPSec Identity
```
/ip ipsec identity
add peer=VPNPeer auth-method=rsa-signature mode-config=ipsec-cfg1
      match-by=certificate certificate=vpn.server
      remote-certificate=vpn.client generate-policy=port-strict
      policy-template-group=ike2-policies
```

### 4. Add condfiguration on the client side 
#### 4.1 Download the exported certificates and send them to your client
Using the Mikrotik Web interface or FTP, you should download `cert_export_my.ca.crt` and `cert_export_vpn.client.p12`

#### 4.2 Import your certificates in the client host
On most devices this should work by default when trying to open the files.

#### 4.3 Create an IKE VPN entry on the host
```
Server: <YOUR_MIKROTIK_IP_OR_HOSTNAME>
Remote ID: vpn.server
Local ID: vpn.client
User Authentication: None
Use Certificate: Yes
Certificate: vpn.client
