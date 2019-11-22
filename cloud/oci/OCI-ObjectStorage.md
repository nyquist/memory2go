# Object Storage

Object Storage features:
 - Storage consistency = always serve the most recent copy of the data.
 - Highly Durable = Data is stroed redundantly acrross multiple ADs. Data integrity is monitored and auto-repaired
 - Object size can be up to 10 TB
 - Data is stored as objects.
 - Encryption: Data is encrypted at rest and while in transit.
 - Regional service, not tied to a specific compute instance.
 - Offers 2 different storage clases (Tiers):
   - Hot Storage - for frequently accessed objects
   - Cold Storage - for less frequent access (archive)
- private access from OCI infrastructure using the Service Gateway
- cross-regional copy, pre-authenticated requests, lifecycle rules, multi-part upload.

## Resources

Object = All data is managed as objects. Each object is composed of the object itself and metadata of the object

Bucket = A logical container for storing objects. Each object is stored in a bucket.

Namespace = Top level container for all buckets and objects. Each tenancy is provided a unique namespace that is global, spanning compartments and regions. Since the namespace is unique, buckets names must be unique within a tenancy.
In a namespace, the hierarchy is flat but you can simulate a directory structure using prefixes.

## Object Storage Tiers
### Standard Storage Tier (Hot)
- Fast, immediate and frequent access
- ObjectStorage Service always serves the most recent copy
- Data retrieval is instantaneous
- Standard buckets can't be downgraded to archive storage.

### Archive Storage Tier (Cold)
- For rarely accessed data
- Minimum retention requirement: 90 days
- Objects need to be restored before downloaded. Time to 1st byte after restore request: 4 Hours
- Archives can't be upgraded to Standard Storage.

## Hierarchy

URL format: `https://objectstorage.<REGION>.oraclecloud.com/n/<NAMESPACE>/b/<BUCKET>/o/[<PREFIX>/]<OBJECT_NAME>`
- To simulate a hierarchy you can optionally add PREFIX valuues.PREFIX can also include '/' character but PREFIX1/PREFIX2 is not included in PREFIX1.
- You can run operations (delete, download) at the prefix level.

## Cross-regional Copy

- Allows you to copy objects to other buckets in the region or to the buckets in other regions.
- IAM authorization for the service is needed: `Allow Service ObjectStorage-us-ashburn-1 to manage object-family in tenancy`
- You  must specify an existing target bucket
- Bulk copying is not supported
- Objects can't be copied from Archive Storage

## Lifecycle Management
- Define rules to auto archive/melete objects after a number of days
- ObjectService in your region must have IAM authorization to manage object-family
- If applied at bucket or prefix level, it applies to all objects.
- Delete rules always takes precedence over an archive rule.

## Access Management
### Pre-authenticated requests
- Creates unique URLs for buckets or objects.
- Links can be revoked at any time.
### Public buckets
- Allow anonymous access to objects in the bucket.

## Multi-part Uploads
- A big file can be split into multiple parts in order to make use of parallel uploads and reduce the total upload time.
- You can have up to 10000 parts and the size of one part can range from 10MB to 50GB.
- The upload can only be initiated via a REST API call.
- The upload must be commited when done.

