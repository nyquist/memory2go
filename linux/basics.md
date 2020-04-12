# Linux 101 - Basics
## Linux High Level Layers
 
* **hardware**: CPU, memory, disk, network interfaces, etc
* **kernel** = core of the OS
	* resides in memory
	* manages hardware and acts as an inteface between hardware and running programs
	* runs in *kernel mode*
	* the memory area that only the kernel can access is called the *kernel space*
* **processes** - 	better named *user process*
	* runs in *user mode*
	* the memory area that the user processes can access is called the *user space*
	* One user process may not access the memory area of another user process
* **users**
	* A username is associated with a userid
	* Every user-space process has a user *owner*
	* A user may terminate or modify the behavior of its own processes but not with others' processes
	* Users may own files
	* **root** user may terminated and alter another users's processes and read any file on the local system
* **groups**
	* groups are set of users. 
	* Mostly used to share files between members of a group
## Shell Basics
### Basic Commands
**ls** = list
> -a = displays all files. Without it, files starting with "." are hidden
> -d = displays only directories
> -l = long listing
> -f = adds a file type indicator ( / = dir, @ = symbolic link, = = socket, | = pipe)
> -R = recursive (enterrs folders)

**cp** = copy
> -f, --force
> : forces overwrite
> 
> -i , --interactive 
> : asks before overwriting
> 
> -p, --preserve 
> : preserves ownership and permissions if possible
> 
> -R, --recursive 
> : copies files to which symbolic links point rather than the link
> 
> -a, --archive
> : like -R, but preserves ownership and permissions
> 
> -u, --udpate 
> : copies the file only if newer than the destination


**mv** => move/rename

**touch** => modifies the time of a file or creates it if it doesn't exist
> -a,  --time=ACCESS_TIME 
> : changes only access time
> 
> -m, --time=MOD_TIME 
> : changes only modified time
> 
> -c, --no-create 
> : do not create file
> 
> -t TIMESTAMP
> : sets the timestamp used in format: MMDDhhmm[[CC]YY][.ss]
> : MM - month, DD - day, hh - hour, mm - minutes, CC - century, YY - year, .ss - seconds
> 
> -r,  --reference=REFFILE
> : a file who's timestamp you want as a reference

**rm** => remove
> -r = recursively

**echo**

### Looking for Help
**man**
`man [SECTION] COMMAND`
> -k KEYWORD
> : lists man pages that contain the KEYWORD
>  
> 
> Sections
> : 1. User commands
> : 2. System calls
> : 3.  Higher-level Unix programming library documentation
> : 4.  Device interface and driver information
> : 5.  File descriptions (system configuration files)
> : 6.  Games
> : 7.  File formats, conventions, and encodings (ASCII, suffixes, and so on)
> : 8.  System commands and servers


**info**

**/usr/share/doc** = Some packages just dump documentation in this folder

### Navigation Commands
**cd**

**mkdir**
  > -p = also creates parents

**rmdir**
> -p = alse removes parents if theey are in given path

**pwd** = print working directory

**find**
`find DIR OPTIONS`
> -name PATTERN
> : search by name
> 
> -perm MODE
> : search by permissions
> 
> -size N 
> : seach by size
> 
> -gid G 
> : search by group
> 
> -uid U
> : seach by user
> 
> -maxdepth LEVELS 
> : restrict search depth

**locate** = faster than find because it uses a database but it needs to index the files first
>

**whereis** = quick way to find executables

**which** =  only searches your PATH

**type** = tells you how a command will be interpreted

## Wildcards (shell globs)
wildcards don’t match dot files unless you explicitly use a pattern such as .*
* * = matches any characters
* ? = matces a single character

## Variables
### Shell Variables

    $ MYVAR=blah
    $ echo $MYVAR
    blah
    
Don't use spaces when assigning values to the variables
Use `set` without any params to list all shell variables
To remove the variable completly, use:
`$ unset MYVAR`

### Environment Variables
Environment Variables are accessible to all processes ran from the shell. A shell variable can be "exported" to an environment variable with the export command

    $ MYVAR=blah
    $ export MYVAR

use `printenv` to list all environment variables.
To demote a variable from the environment list, use:
`$ export -n STUFF`

For more info, see https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps

**PATH** is a special environment var that contains a list of dirs where the shell looks for commands. You can use `PATH=$PATH:newdir`to append *newdir* at the front or `PATH=newdir:$PATH` to add it in front and force the system to search there first. Or you can set a new value altogether. When misstyping this, there's a risk that you will be changing your current path. If that happens, just start a new shell.

## Shell Input and Output
### Redirect stdout
stdout goes by default to the terminal screen

> *command* `>` _file_
> : Outputs to a file, instead of terminal. Deletes (if exists) and creates the file:
>
>_command_ `>>` _file_
> : Appends the output to a file:
> 
> _commnad1_ `|` _command2_
>  : To send the output to the input of another command

### Redirect stderr
Errors go to the *stderr* insted of *stdout*, but *stderr* goes by default to the terminal screen as well.

> _command_ `2>` _file_
> : Redirect stderr to a file, instead of terminal. Deletes (if exists) and creates the file
>
>_command_ `2>>` _file_
> : Appends the output to a file
> 
> _command_ `2>&1`
>  : Redirects stderr to stdout
>  : The command above is useless because stderr and stdout go to the terminal by default. But it makes more sense if you redirect stderr to stdout while stdout is redirected to a file: _command_ `>` file `2>&1`
>  :Similarly, if stdout is appended to a file, redirecting stderr to stdout will append it to the file as well: _command_ `>>` file `2>&1`


### Redirect stdin
Standard input is the keyboard, but you can redirect a file to stdin:
> _command_ `<` _file_

More details here: https://unix.stackexchange.com/questions/159513/what-are-the-shells-control-and-redirection-operators/159514#159514

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkwMzA4MDk3MCwxMDY2NjM3NThdfQ==
-->
