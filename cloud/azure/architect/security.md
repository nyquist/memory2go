# Design for security in Azure
## Defense in depth
### Zero Trust Model: never assume trust but instead continually validate trust:
- WAF (Web Application Firewall)
- Web defenses: Input validation, Output encoding, Parameterized queries
- Multi Factor authentication: soemthing you have (physical token), something you know(password), something you are (fingerprint)
- Layers of security: Key valuts, DDoS protection, Threat detection, JIT access control, Security testing, Following best practices
### Layered security
- Security posture (CIA):
  - Confidentiality: restricts access to information only to individuals explicitly granted access
  - Integrity: prevents unauthorized changes to information at rest or in transit
  - Availability: ensures services are available to authorized users
- Security layers:
- Data: ensure CIA of data
- Applications: 
  - ensure application are secure and free of vulnerabilities
  - store sensitive application secrets in a secure storage medium
  - make security a design requirement of all application development
- Compute
  - secure access to VMs
  - implement endpoint protection and keep systems pathced and current
- Networking
  - limit communication between resources through segmentation and access control
  - deny by default
  - restrict inbound internet access and limit outbound where appropriate
  - implement secure connectivity to on-premises networks
- Permiter
  - use DDoS protection to filter large-scale attacks before they can cause a denial of service for end users
  - user permiter firewalls to indentify and alert on malicious attacks against your network
- Identity and access
  - control access to infrastructure, change control
  - use single sign-on and multi-factor authentication
  - audit events and changes
- Physical security
  - Physical building security and controlling access to computing hardware within the data center is the first line of defense
### Shared responsibility between Microsoft and Customer
### Continuous improvement
 
## Identity management
### Single sign-on (SSO)
- users only need to remember one ID and one password. Access across applications is granted to a single identity tied to a user, simplifying the security model
- SSO with Azure AD (Active Directory)
### Synchronize directories with AD Connect
- integrates your on-prem directories with Azure AD
### Authentication & access
- Multi-factor authentication - Azure AD has MFA capabilities built in
- Conditional access policies - Azure AD provides conditional access policies (CAP) feature that includes support fo raccess policies based on groups, location or device state.
### Securing legacy applications
- Azure AD Application proxy
### Working with consumer identities
- Azure AD B2C is an identity management service that enables you to customize and control how customers sign up, sign in and manage their profiles when using your applications.

## Infrastructure protection
### Criticality of infrastructure
### Role-based access control (RBAC)
- Roles and management groups
  - Roles = sets of permissions that users can be granted to access an Azure service instant. Roles can be granted at the individual service instance level but they also flow down the Azure Resource Manager hierarchy. Roles assigned at a higher scope are inherited by child scopes.
  - Management Groups = offer the ability to group subscriptions together and apply policy at an even higher level
- Privileged Identity Management
  - Azure AD Privileged Identity Management (PIM) is an additional paid-for offerint that provides oversight of role assignments, self-service and just-in-time role actication and Azure AD & Azure resource access reviews
- Providing identities to services
  - Service principals:
     - Identity = a thing that can be authenticated (like user or other apps or servers that authenticate with secret keys or certificates)
     - Account = data associated with an identity
     - Principal = an identity acting with certain roles or claims (e.g sudo)
     - Service principal = an identity that is used by a service or application
- Managed identities for Asure resources
## Encryption
- Symmetric
- Asymmetric
- Encryption at rest
- Encryption in transit
### Identify and classify data
### Encryption on Azure
#### Encrypting raw storage
- Azure Storage Service Encryption (SSE) automatically encrypts your data with AES-256 before persisting it to disk
- You can use Microsoft-managed encryption keys with SSE or you can use your own encryption keys
#### Encrypting Virtual Machines
- Azure Disk Encryption (ADE) is a capability that helps you encrypt your Windows or Linux IaaS VM disks.
 - Uses BitLocker for Windows
 - Uses DM-Crypt for Linux
 - Integrates with Azure Key Vault
#### Encrypting databases
- Transparent Data Encryption (TDE) helps protect Azure SQL DB and Azure Data Warehouse. It performs real-time encryption and decryption of the database, associated backups and transaction log files at rest without requiring changes to the application.
  - It uses symmetric keys called database encryption keys
- SQL Server Always Encrypted: protects column data at ret and in transit by having the clinet application handle the encryption and decryption outside the SQL Server DB through an installed driver
#### Encrypting secrets
- Azure Key Vault is a cloud service that works as a secure secrets store
  - allows you to crete multiple secure containers, called vaults. The vaults are backed by hardware security modules (HSMs)
  - supports any type of secret: passwords, DB credentials, API keys, certificates
  - integrates with Azure AD identities
#### Encrypting backups
- Azure backups ecnrypts local backups using AES-256 and a key created from the passphrase configured by administrator
## Network Security
- Focuses on:
  - securing traffic flow between applications and the internet
  - securing traffic flow amongst applications
  - securing traffic flow between users and application
### Internet protection
- Network Security Groups (NSGs)
- Web Application Firewall (WAF)
- Network Virtual Applicances (NVAs)
- Virtual Network Security
  - NSG
  - VNet service endpoints
- Network integration
  - VPN
  - ExpressRoute
## Application Security
 - Security Development Lifecyles (SDL)
 - Operational security assessments
 - Identity as the permiter
 - Data protection
