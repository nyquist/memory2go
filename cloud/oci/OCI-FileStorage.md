# File Storage Service

- File Storage Service(FSS) provides a NFS-like experience for workflows that require a shared environement or for lift-and-shift applications that use NFS on-prem.
- FSS is AD local
- Supports NFS v.3 protocol
- FSS uses Network Lock Mode (NLM) for file locking
- FSS uses Full POSIX semantics
- Data at REST is encrypted for all filesystems and metadata using 128bit keys
- Up to 10000 snapshots can be executed per file system
- Up to 100 file systems and 2 mount targets per AD per account (soft limit) can be configured.

## Mount Targets
- The mount target is a NFS endpoint that lives in your subnet of choice.
- It has an IP address and a DNS name that that you can use in your mount commands.
- It requires 3 private IP addresses in the subnet so the minimum subnet size that should be used is /29.
  - Two IPs are used during mount target creation. The thrid IP is for HA.
- Placing NFS clients and mount targets in the same subnet CAN result in IP conflicts as users are not shown which IPs are used for mount targets.
  - Best practice: place FSS in its own subnet where it can cosume IPs as needed.

## File Systems
- To access your file system you create a new or use an existing mount target.
- Up to 100 file systems cab be created per mount target.
- The file systems will reside in the AD where FSS is configured (based on subnet assignment) but it can be accessible from on-prem through FastConnect/VPN.

## Export Paths
- A unique path specified when the file system is associated with a mount target during creation. 
- No 2 file systems can have overalapping pahts!
- E.g:
   - `Mount target: 10.0.0.5`
   - `Export path: /dir1/dir2`
   - Linux command: `sudo mount 10.0.0.5:/dir1/dir2 /mnt/mountpointA`
   
 ## File System Service Security
 The service is prottected by several layers:
 1. **IAM Service** - groups should be allowed to access or manage the service
 2. **Security Lists**: 
    - In the subnet where the service is attached the following ingress rules should be allowed: Stateful ingress: TCP/111, 2048-2050 and UDP/111,2048
    - A similar rule should allow egress traffic to the service on the above ports from the subnets where connections to this service are expected.
 3. **Export Options**
    - controls how NFS clients access the file system. Information is stored in an export includes the file system OCID, export path and client access options.
    - By default, it allows full access to all NFS clients. {"source": "0.0.0.0/0", "Privileged Source Port":"False", "Access":"Read_Write", "Identity Squash":"None"}
    - The defaults can be altered only using a RESTI API call for now.
 4. **NFS v.3 Unix Security**
 
 ## Mounting OCI File Systems
 - The proeper NFS packages need to be installed on the hosts:
   - `nfs-utlis` for Oracle Linux or CentOS
   - `nfs-common` for Ubuntu
 - Mount commands are provided in the WebUI for easy setup of the clients.
 
 ## Snapshots
 - Snapshots are read-only, space efficient, point-in-time backups of a file-system 
 - Snapshots are created in the `/.snapshots/` directory
 - You can restore a file using `cp` or an entire directory using `rsync`
 - It is always incremental so if no additional changes, no additional space is used.


