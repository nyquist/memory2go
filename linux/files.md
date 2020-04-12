# Managing Files
Users are usually actual users or accounts that exist for specific application to use
Groups are logical groupings of users. 
Users within a group share the same permission to read, write or execute files owned by the group. 
    
Each user has a unique user ID = UID 
Each group has a unique group ID = GID 
    
When a user is created, it will get assigned  a default group as well. By default, a group with the same name is created and the user will be part of its own group. You can check it with the `id` command or in "/etc/passwd" 

A user who creates a file is also the owner and group owner of the file. 

    [myuser@nyqtst01 ~]$ ls -l
    total 4
    -rw-rw-r--. 1 myuser myuser 49 Jan 25 18:07 out.txt

Each file is assigned separate Read/Write/eXecute permissions for the owner, group and everyone else: 
```
t|uuu|ggg|www
t can be any of: 
- for file
d for directory
l for symbolic link
p for named pipes (enables 2 running programs to communicate with each other. One opens it for reading and one for writing), s for socket(a pipe that permits network and bidirectional links)
b for block device (HDD, CDROM)
c for character device (RS343, serial, parallel device)

uuu = owner user permissions
ggg = owner group permissions
www = world (anyone else) permissions
```
# File Attributes
Some filesystems support additional attributes.
To list them use 
```
lsattr FILE
a = append only 
c = compressed. The kernel will automatically compress data in the file 
i = immutable - can't be deleted, renamed or cannot have links to it 
j = journaling - The kernel will jounal data in it 
s = secure deleting - when deleted, the kernel zeros its data blocks 
t = no tail merging 
A = no access time update
...
```
To modify them use `chattr [+|-]X FILE`

# Archives
**tar**
```
c, --create : Create an archive 
A, --concatenate : appends tar files to an archive 
r, --append : appends non-tar files to an archive 
u, --update : appends files that are newer than those in an archive 
d, --diff, --compare : compares an archive to files on disk 
t, --list : lists an archive's content
x, --extract, --get : extracts files form an archive

Qualifiers
v, --verbose
z , --gzip, --ungzip : processes an archive through gzip
j, --bzip2 : processes the archive through bzip2
f, --file [ HOST:] FILE : uses file FILE from host HOST as the archive file

tar cvfz   archive.tgz folder_to_archive
tar xvfz   archive.tgz 
```

**gzip**, **gunzip**, **bzip2**, **bunzip2**

# Links
**ln** = creates hard (default) or soft (symbolic) links
```
ln [OPTIONS] SRC [LINKNAME]
-s : symbolik links
```
- **Hard links** are links to the same inode. To delete the file you need to delete all hard links that point to it. They must be created on the same filesystem
- **Symbolic links** are special files whose content points to the linked-to file.

# Directory Hierarchy
 
 - **/bin** = binaries (executables). Usually links to /usr/bin
 - **/boot** = Kernel boot loader files
 - **/dev** = device files
 - **/etc** = configuration files
 - **/home** = personal dirs for regular users
 - **/lib** = shared libraries. Usually links to /usr/lib
 - **/media** = a base for attaching removable media
 - **/opt** = 3rd party software
 - **/proc** = system stats in a browsable by dir and file interface
 - **/sys** = device and system interface
 - **/sbin** = system binaries. You usually need root access to run them. Usually links to /usr/sbin
 - **/tmp** = temp files
 - **/usr** = most of the Linux core files
	 - **/usr/bin** = binaries
	 - **/usr/lib** = shared libraries
	 - **/usr/sbin** = system binaries. You usually need root access to run them
	 - **/usr/include** = holds header files for C compiler
	 - **/usr/info** = GNU info manuals
	 - **/usr/local** = where admins can install thei own sofware. The structure is similar to / and /usr
	 - **/usr/man** = man pages
	 - **/usr/share** = usually hods man and info pages but it was historically used to share files with other unix machines.
 - **/var** = system logging, user tracking, caches, etc.
 - **/vmlinuz** = Holds the kernel, but usually linked to /boot/vmlinuz
