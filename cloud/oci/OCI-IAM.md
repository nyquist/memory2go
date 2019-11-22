# IAM = Identity and Access Management

## IAM 101
IAM controls what type of access a user has and to which resources
**Resource** = a cloud object (compute, blockstorage, vcn). Each resource has a unique **OCID (Oracle Cloud ID)**
**Principal** = an IAM entity that is allowed to interact with OCI resources. It can be an IAM user or an Instance Principal.
**IAM users** = persistent identities that represent people or applications. The 1st IAM user is the default administrator
Users enforce security principles of least privileges:
- User has no permission until placed in one or more groups
- Groups have at least 1 policy with permission to tenancy and compartment
**Instance principals** = let instances and apps make API calls to OCI services without the need to configure user credentials as config file

## Authentication mechanisms
- user/password
- API Signing Key (PEM format, min 2048 bits)  
- Authentication tokens = for authentication with 3rd party APIs that do not support OCI signature-based authentication

Terraform Links:

https://www.terraform.io/docs/providers/oci/r/identity_ui_password.html
https://www.terraform.io/docs/providers/oci/r/identity_api_key.html
https://www.terraform.io/docs/providers/oci/r/identity_auth_token.html


## Authorization
Policies can't be attached to users, only to groups
Policies are in human readable format:
- `Allow group GROUP_NAME to VERB RESOURCE_TYPE in tenancy`
- `Allow group GROUP_NAME to VERB RESOURCE_TYPE in compartment COMPARTMENT [where CONDITIONS]`
  - VERB:
    - Inspect = list resources
    - Read = ^ + get resource meta-data
    - Use = ^ + work with resource (depending on the resource type) (can't create/delete)
    - Manage = all permissions
  - RESOURCE_TYPE (For a list of all resource families and resource types, see [here](https://docs.cloud.oracle.com/iaas/Content/Identity/Reference/policyreference.htm#Resource))
    - All-resources
    - Database-family: 
    - Instance-family
    - Object-family:
    - Virtual-network-family:
    - Volume-family:

Terraform Links: 

https://www.terraform.io/docs/providers/oci/r/identity_policy.html
https://www.terraform.io/docs/providers/oci/r/identity_group.html
https://www.terraform.io/docs/providers/oci/r/identity_user.html
https://www.terraform.io/docs/providers/oci/r/identity_user_group_membership.html


**Compartment** = a logical collection of resources
**Subcompartments** = up to 6 levels. A subcompartment inherits higher level policies
Resource can't be assigned to a different compartment after creation (except Buckets).
Root comportment exists by default and resources could get assigned to it if nothing else is selected

Terraform links: 
https://www.terraform.io/docs/providers/oci/r/identity_compartment.html

## Federation
Supported methods:
 - Oracle IDCS
 - Microsoft AD
 - Any SAML2.0 protocol compatible service

### Federation setup
1. A federation trust is established between Identity Providers (IdP) and OCI
2. A user accessing the OCI console will be presented with SSO
3. IdP authenticates users and then users can access the OCI resources

Terraform links:
https://www.terraform.io/docs/providers/oci/r/identity_identity_provider.html

## Tagging
There are 2 types of tags:
 - Free form tags {Key:value}
 - Defined tags
  - Namespace key - can't be deleted, but retired.
  
Terraform links: https://www.terraform.io/docs/providers/oci/guides/tagging_resources.html

## Resource Locations
- Global
  - IAM
  - Key Vaults, Keys
  - DNS
- Availability Domain
  - Subnet
  - Compute instances
  - Block Volume
  - DB Systems
  - File System ( & Mount Target)
  - Ephemeral Public IPs
- Regional
  - Everything else
