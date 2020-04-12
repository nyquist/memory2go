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

