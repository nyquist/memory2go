# Key Management
- allows you to manage your data encryption using keys that you control.
- it provides cetralized key management capabilities
- highly available, durable and secure key storage, usign per-customer isolated partitions in hardware security modules
- integrates with other OCI services

## Key Management capabilities
- Creates key vaults to durably store your encryption keys
- Create/Disable/Enable keys
- Rotate keys
- Define which IAM users/groups/services can manage keys
- Define which IAM users/groups/services can use keys
- Define which IAM users/groups can associate keys with other resources
- Complete lifecycle management of keys and vaults.

## Rotation
- Creates different version of the key
- You can't use old versions of the key to encrypt data but you can use it to decrypt data that was encrypted poreviously.

## Key Management Policies
- Regional service
- integrates with BlockVolume and ObjectStorage
- You can't import/export keys
- You can disable keys but you can't delete them
- You can delete vaults. 
   - You can schedule a vault to be deleted by selecting a wait periond (7 to 30 days). 
   - A vault is deleted with all its keys. After the vault is deleted, it can't be recovered.
- Billing is per vault, per hour.
- You aren't charged for vaults that are set for deteletion but billing will resume if deletion is canceled.
