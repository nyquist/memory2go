# Block Storage

## Local Storage
- NVMe SSD based temporary storage that survives reboots.
- Can be used for workloads that have high performance requirements.
- Locally attached SSDs are not protected and the customer is responsible for the durability of the SSDs.
- Protecting NVMe SSD Devices: RAID1, RAID10, RAID6

## Block Volume Service
- Stores data independently and beyond the lifespan of compute instances.
- Operates as a raw storage device using protocols such as iSCSI
- Can be attached as 
  - iSCSI - requires additional comands on the host
  - Paravirtualzied - directly attached to the host but less performance
- Block volumes are used to expand an instance's storage
- Up to 32 attachments/instace
- Data is encrypted at rest and in transit
- Elastic Performnce
  - Low cost - not available for boot volumes
  - Balanced - default
  - High Performanc
- Can be resized (increasd only) offline (must be de-attached first) but you can also clone to a larger volume or restore from a backup to a larger volume.

### Backup and Restore
- Backups are snapshots of block volumes. 
- The backups are stored in the regional Object Storage, but they can be copied from one region to another.
- Restores can be performed to any new AD in the region.
- Backups can be performed:
  - On demand: full or incremental
  - Automatically using a policy: 
    - Bronze: Monthly incremental backups retained for 12 months + full yearly backup retained for 5 years
    - Silver: Bronze + weekly incremental backup retained for 4 weeks
    - Gold: Silver + daily incremental backup retained for seven days

### Cloning
- Cloning allows copying an entire block volume to a new volume.
- Clones cannot be copied to another region

### Volume Groups
Group volumes from multiple compartments accross mulitple compute instances in a volume group.
You can use groups to perform backup/clones to multiple volumes at a time. Think about backing up the volumes of all instances in a multi-tier application at the same time.

This is available for boot volumes as well, since they are just another type of Block Storage.
