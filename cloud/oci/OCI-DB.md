# Database services

|       | VM DB Systems | BM DB Systems | Exadata |
| --- | --- | --- | --- |
| Types | A 1-node VM DB system or a 2-node VM DB system (2 VMs clustered with RAC enabled, each VM being in a different FD by default) | A 1-node DB system: Single BM server | Exadata |
| Storage | Block Storage | Local NVMe disks | Local spinning disks and NVMe flash cards |
| RAC | on 2-node systems only | N/A | Available |
| Data Guard | Available | Available | Available |
| Multi Home | No - A VM DB system can have only a single DB Home which in turn can have only a single DB | Yes (one edition, but different versions possible) | Available |
| Scaling | Storage only | CPU | CPU |
| Editions | Standard, EE, EEHP, EEEP, BYOL | Standard, EE, EEHP, EEEP, BYOL | EEEP, BYOL |


## Editions
- Standard:
  - Full DB instance
  - includes transparent Data Encryption
- Enterprise (Standard +):
  - All standard EE featurs
  - Data Masking and subsetting
  - Diagnostics and Tuning
  - Real Application Testing
- EE High Performance (EE +):
  - Multitenant
  - Patitioning
  - Advanced Compression
  - Advanced Security, Label Security, Database Vault
  - OLAP, Advanced Analytics, Spatial and Graph
  - Management Packs
- EE Extreme Performance (EEHP +):
  - RAC (Real Application Clustres)
  - In-memory
  - Active Data Guard
  
## DB Lifecycle operations
- Launch and status checl
- Start, Stop, reboot
  - Billing continues in STOP stage for BM DB systems, but not for VM DB systems
- Scale 
  - Scale CPU cores
  - Scale up storage
- Terminate

## DB Patching
Patching is a 2-step process. DB System is patched first, then the database itself.

Schedule
- Automated
- On-demand: anytime for N-1 patching

Availability:
- Rolling for Exadata and RAC shapes
- Single Node: can take advantage of Active Guard if it is configured

## Backup and Restore
- Exadata backups process requires creating a backup config file
- Backups stored in Object(recommended) or Local Storage
- Options
  - Automatic incremental - runs one a day, repeats the cycle every week, retained for 30 days
  - On demand, standalone, full backups
- Restore options
  - Restore to latest
  - Restore to timestamp
  - Restore to System Change Number (SCN)
  
 ## Oracle Data Guard
 - Supported on VM and BM DB Systems
 - Limited to 1 standby DB per primary DB
 - Switchover (planned role reversal, no data loss, used for database upgrades)
 - Failover (unplanned failure of primary)
