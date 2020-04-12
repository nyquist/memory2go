# Managing devices
## Device Files
/dev
### Block devices
Programs access data from a block device in fixed chunks. Because a block device’s total size is fixed and easy to index, processes have random access to any block in the device with the help of the kernel
**dd**
 `dd if=IN_FILE of=OUT_FILE bs=SIZE`
### Character device
Character devices work with data streams. You can only read characters from or write characters to character devices. Character devices don’t have a size; when you read from or write to one, the kernel usually performs a read or write operation on the device
### Pipe device
Named pipes are like character devices, with another process at the other end of the I/O stream instead of a kernel drive
### Socket device
Special-purpose interfaces that are frequently used for interprocess communicatio

## General definitions
**IRQs** = An interrupt request (IRQ), or interrupt, is a signal sent to the CPU instructing it to suspend its current activity and to handle some external event such as keyboard input
`cat /proc/interrupts`

**IO Addresses** = I/O addresses (also referred to as I/O ports) are unique locations in memory that are reserved for communications between the CPU and specific physical hardware devices.   
`cat /proc/ioports`

**DMA Addresses** = Direct memory addressing (DMA) is an alternative method of communication to I/O ports. Rather than have the CPU mediate the transfer of data between a device and memory, DMA permits the device to transfer data directly, without the CPU’s attention. The result can be lower CPU requirements for I/O activity, which can improve overall system performance.
`cat /proc/dma`

**HAL Daemon** = The Hardware Abstraction Layer (HAL) Daemon, or   hald, is a user space program that runs at all times (that is, as a daemon) that provides other user space programs with information about available hardware.

**D-Bus** = The Desktop Bus (D-Bus) provides a further abstraction of hardware information access. Like hald, D-Bus runs as a daemon. D-Bus enables processes to communicate with each other as well as to register to be notified of events, both by other processes and by hardware (such as the availability of a new USB device).

**udev** = Traditionally, Linux has created device nodes as conventional files in the /dev directory tree. The existence of hotplug devices and various other issues, however, have motivated the creation of udev: a virtual filesystem, mounted at /dev, which creates dynamic device files as drivers are loaded and unloaded. You can configure udev through files in   /etc/udev, but the standard configuration is usually sufficient for common hardware.

- `lspci [-v[v[v]]]`   - displays info about PCI buses   
- `lsmod` - kernel modules currently loaded
- `insmode MODULE_PATH` - insert a module in the kernel. The modules it depends on need to be already loaded
- `rmmode MODULE_PATH` - removes a module 
- `modprobe MODULE_NAME` - inseret a module in the kernel with all modules it depends on
- `lsusb` - displays info about USB buses
