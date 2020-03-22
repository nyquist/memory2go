# Storage services

|      | [Local NVMe](OCI-BlockStorage.md) | [Block Volume](OCI-BlockStorage.md) | [File Storage](OCI-FileStorage.md) | [Object Storage](OCI-BlockStorage.md) | Archive Storage |
| --- | --- | --- | --- | --- | --- |
| Type | NVMe SSD based temporary storage | NVMe SSD based Block Storage | NFSv3 compatible File System | Highly durable Object storage | Long-term archival and backup |
| Durability | Non-persistent; survices reboots | Durable (multiple copies in an AD) | Durable (multiple copies in n AD) | Highly Durable (multiple copies across ADs) | Highly Durable (multiple copies across ADs)
| Capacity | Terabytes+ | Petabytes+ | Exabytes+ | Petabytes+ | Petabytes+ |
| Unit Size | 51.2 TB for BM; 6.4-25.6 TB for VM | 50 GB - 32 TB/volume; 32 volumes/instance | Up to 8 Exabytes | 10 TB/object | 10 TB/object |
| Use cases | Big Data, OLTP, High Performance workloads | Apps that required SAN like features | Apps that require shared file systems | Unstructured data (logs, images, videos, other) | Long term archival and backups |
