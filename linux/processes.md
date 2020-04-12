# User Processes

## Process Management
**ps** - report a snapshot of the current processes
    BSD options (no dash):
> a : removes the "only yourself" restrinction 
> x : removes the "must have a tty" restriction 
> u : include more detailed information on the process
> w : show fill command name, not just what fits one line

UNIX options (with a dash)
> -e = selets all processes
> -f = full-format listing

**kill**
`kill [-SIGNAL] pid`
> 1 - SIGHUP = Hangup (often used before logging out)
> 2 = SIGINT = same as Ctrl+C
> 9 = SIGKILL = terminates without cleanup
> 15 = SIGTERM = default signal, terminates gracefully after cleanup
`kill -l` lists all signals

**pidof** will list the PIDs of all process that have that name
`pidof PROCESS_NAME` 
   
**killall** will kill all processes that have that name
`killall [OPTIONS] PROCESS_NAME` 
> -i = interactive

**pkill** is similar to `killall` but allows partial names
`pkill NAME` 

**&** = running a process in the backgroud

**nohup** = no hangup = keeps the process running even after logut, basically skipping the SIGHUP signal
`nohup COMMAND` 

**top**
Commands to use while running:
> M = sort by MEM usage
> P = sort by PROC usage
> q = quit

## Job Managemnt
**jobs** = lists current running jobs
  
  **fg** = bring job to foreground
`fg JOB_ID`

**bg** = sends job to background but in a running status
`bg JOB_ID`

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5NDU3ODU2NjFdfQ==
-->
