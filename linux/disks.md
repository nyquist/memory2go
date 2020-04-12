# Disks
- Parallel Advanced Technology Attachment (PATA), a.k.a. ATA
- Serial Advanced Technology Attachment (SATA)
- Small Computer System Interface (SCSI)

## PATA
```
/dev/hda - master,   /dev/hdb - slave
/dev/hdc - master,   /dev/hdd - slave
/dev/hda1 - partition 1 on hda
/dev/cdrom usually links to   /dev/hdx
```
## SATA
disks: `dev/sdx`

## SCSI
 - disks: `/dev/sdx`
 - tapes: `/dev/stx, /dev/nstx`
 - cdroms: `/dev/scdx`

# Partitions
primary - 4
extended - includes more logical partitions
Some directories (`/etc, /bin, /sbin, /lib, /dev`) should never be placed on separate partitions.   

```
fidsk   [/dev/disk] 
-l   lists partitions
commands:
m   -   help
p   - see partition table
n   - new partition
d   - delete partition
t   - change partition type
l   - list partition types
q   - exit
```
```
parted   [/dev/disk] 
```
## Partition types
- ext2fs - ext2 - Second Extended File System - not journalized
- ext3fs - ext3 - ext2 with jounalization
- ext4fs - support for big disks (>32TB) or big files >2TB
- Reiserfs - better for many small files
- JFS
- XFS
- FAT - msdos (FAT 16) - vfat (FAT32)
- NTFS
- HFS, HFS + - OSX
- ISO 9660 - CDROM
- Joliet   

```
mkfs -t FILESYSTEM /dev/disk
- m   procent   - procent of reserved space. If 1-m% of disk space is used, the disk is considerd full, so that the root user can still perform operations. By default - m=5
```
	
- `mkdosfs` 
- `mkswap   /dev/ disk` 
- `swapon   /dev/ disk`
- `dumpe2fs   [options] device`
- `tune2fs   [options] device`
- `debugfs   /dev/ disk`
- `stat   filename` Display inode information ​ You can display the inode data on a file or directory
- `undelete inode name` - undelete a file. `inode` is the inode number of the deleted file and `name` is the filename you want to give to it.
- `lsdel` or `list_deleted_inodes` - lists deleted inodes
- `fsck   [-sACVRTNP] [-t FS_TYPE] [--] [FSCK_OPTIONS] FILESYSTEMS` - filesystem check

**df**
```
df   [OPTIONS] [files]   - disk usage by disk
-a   or   --all   - includes pseudo-filesystems
-h   or --human-redable   - instead of blocks it uses GB
-H   or   --si   - like   -h, but uses powers of 10
-k   or   --kilobytes 
-m   or   --megabytes
-l   or   --local   - uses only local fs, without network fs 
-T   or   --print-type   - adds type of fs to the list 
-t   fstype   or   --type=fstype   - displays only these fs 
-x   fstype   or   --exclude=fstype   - excludes these fs from list 
```
**du**
```
du   [options] [directories] - disk usage by folder
-h, --human-redable 
--max-depth=n - limits the report to n levels
-s, --summarize - n=0 
```
**mount**
```
mount [-alrsvw] [-t   fstype ] [-o   options ] [ device ] [ mountpoint ]   - mounts partitions
-a   - mounts all fs from /etc/fstab
-r   - read only
-v   - verbose
-w   - read/write
-t   fstype   - fstype = ext2, ext3, ext4(dev),reiserfs, jfs, xfs, msdos, vfat, iso9660, udf, nfs, smbfs, cifs
-L   label   
-U   uuid. Options:
     defaults   - loads default fs options
     loop   - allows you to mount a file as if it were a disk
     auto   - mounts the disk at start
     noauto   - doesn't mount the disk at start
     user   - allows ordiannry users to mount the disk
     nouser   - doesn't allow ordinary users to mount the disk
     owner   - allows owner of the device to mount the disk
     ro   - readonly
     rw   - read/write
     uid=value   - sets the owner of all files. For fs that do not support unix-style permisions (vfat, ntfs, hfs)
     gid=value   - sets the group of all files. Similar to uid
     umask=value   - sets the default permissions for the files, subtracting value form 777
     dmask=value   - sets umask for directories only
     fmask=value   - sets umask for files only
     conv=code   - converts between dos/linux text files. See man
     norock 
     nojoliet 
     username=user,password=pass   - for samba/cifs
     credentials=file   - similar. The file should have one line with:   username= user   and one with   password=pass 
```
**umount**
```
umount [-afnrv] [-t fstype ] [device|mountpoint ]   - unmounts a fs
-a   - unmounts all partitions in /etc/mtab
-f   - force
-r   - if it can't unmount, mount as ro
```
To mount fs permanently you need to modify `/etc/fstab`
