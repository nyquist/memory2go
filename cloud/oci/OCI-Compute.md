# Compute

Compute Options
- Bare Metal (Direct Hardware Access) aka Single Tenant Model
- Virtual Machines (Hypervisor Virtualizes the underlying Bare Metal resources into smaller VMs) aka Multi Tenant Model

Bare Metal Use Cases
- workflows that require intensive performance
- workflows that are non-virtualizable
- workflows that require specific hypervisors
- workflows that require BYOL (Bring Your Own License)
## Shapes
- BM = Bare Metal
- VM = Virtual Machines
Types:
- Standard = Standard Compute
- Standard.Ex = AMD Standard Compute
- GPU = have NVIDIA GPUs
- DenseIO = have local NVMe SSD storage
- HPC = High Performance Compute
## Images
Image = Initial contents of a Virtual Hard Drive that deterimnes the OS and software of an instance
- Oracle Provided: Oracle Linux, Ubuntu, Micorsoft Windows, others
- Custom images
- BYOI (Bring your own image).

Once the compute istance is created, the image is cloned into the Boot Drive.

### Oracle provided images
For Oracle provided images, a special user is created on the instances that use them.
 - On Linux hosts:
   - *opc* user for Oracle Linux/Cent OS and *ubuntu* user for Ubuntu are created with sudo privilage abd remote access allowed using SSHv2
   - Default firewall rules allow only SSH/TCP22 access
   - A startup script is provided using cloud-init
 - On Microsoft Windows
   - User *opc* is created with a One Time Password
   - includes Windows Update utility to get latest updates
  
### Custom images
You can create a custom image of an instance's boot disk and use it to launch other instances. During the process the instance stops for several minutes and restarts afterwards. 

- Custom images do not include the data from any attached block volumes
- Custom images can't exceed 300GB. 
- Linux custom images can be imported/exported. 
- Windows custom images can't be exported.
- Limit of 25 custom images per compartment

The import/export function allows you to share images accross tenancies and regions.
- The import/export function uses the OCI Object Storage service.

Modes:
 - Emulation Mode: I/O, CPU and memory are implemetined in software - offers low performance
 - Paravirtualized: include a driver to enable virtulization
 - Native Mode: same as Hardware Virtualized Machine (HVM) - offers max performance 

## Boot Volumes

A compute instance is launched with an OS image started as a remote boot volume.
Boot volume is a special kind of Block Volume. It is created automatically and associated with an instance until you terminate the instance.
The default size of the boot volume can be increased but you have to extend the root/system partition if you want to take advantage of larger size.

- Default size: 
  - Linux default: 46.6 GB
  - Windows default: 256 GB
- Boot volumes are encrypted.
- Compute instances can be scaled to larger shape by using boot volumes.
- You can preserve the boot volume when you terminate a compute instance.
- Boot volumes are only terminated when you manually delete them.
- Boot volumes can't be deleted from a running instance
- Boot volumes can be backed up manually using a backup policy or you can clone them. 
## AutoScaling
### Instance Configuration
An instance configuration contains an OS image, metadata, shape and related resources as a single configuration entity so you can reuse it to create similar instances.

### Instance Pools
Instance Pools can be used to create and proivision multiple Compute Instances with the same Instance Configuration within the same region. This could be used as a scale up mechanism based on a trigger.

## Instance metadata Service
Instance metadata information can be retrieved by accessing the Instance Metadata Service available for each instance on HTTP 169.254.169.254

E.g. 
```
curl http://169.254.169.254/opc/us/instance/
curl http://169.254.169.254/opc/us/instance/metadata
curl http://169.254.169.254/opc/us/instance/metadata/<key-name>/
```

You can update custom metadata for an instance using CLI or SDK.

## Instance Lifecycle.
- An instance can be in one of the following states: START, STOP, REBOOT, TERMINATED.
- In TERMINATED state, VNIC and volumes are auto-dettached. Boot volume is not deleted.
- For standard shapes, billing is paused while the instance is in a STOP state.
- For DenseIO, GPU and HPC shapes, billing continues while the instance is in a STOP state.



