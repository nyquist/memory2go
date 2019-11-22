# Block Storage

## Local Storage
NVMe SSD based temporary storage that survives reboots.
Can be used for workloads that have high performance requirements.
Locally attached SSDs are not protected and the customer is responsible for the durability of the SSDs.

## Block Volume Service
Stores data independently and beyond the lifespan of compute instances.
Operates as a raw storage device.
Block volumes can be deleted.

### Backup and Restore
Backups are snapshots of block volumes. They can be restored to an AD in the same region.
Backups can be performed:
- On demand: full or incremental
- Automatically using a policy: Bronze, Silver, Gold.

### Cloning
Cloning creates a copy of a volume in the same AD.

### Volume Groups
Group volumes from multiple compartments accross mulitple compute instances in a volume group.
You can use groups to perform backup/clones to multiple volumes at a time. Think about backing up the volumes of all instances in a multi-tier application at the same time.

This is available from boot volumes as well, since they are a special type of Block Storage.
