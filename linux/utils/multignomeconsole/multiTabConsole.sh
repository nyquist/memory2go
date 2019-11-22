#!/bin/bash
##########################################
# MultiTabConsole                        #
# starts multiple gnome-terminal tabs    #
# usefull for  multiple remote consoles  #
##########################################

#checking config file

if [ -z "$1" ]; then
       FILE="./default.cfg"
else FILE="$1"
fi
if [ -f $FILE ]; then 
	source $FILE
else 
	echo " cannot find config file: $1"
	exit
fi
if [ -z $HOST ]; then
        echo " error - HOST  missing - check config file: $FILE"
        exit
fi

if [ -z $STARTPORT ]; then
	echo " error - STARTPORT missing - check config file: $FILE"	
	exit
fi
if [ -z $ENDPORT ]; then
        echo " error - ENDPORT missing - check config file: $FILE"
        exit
fi
if [ -z $NAMES ]; then
        echo " warning - NAMES  missing - check config file: $FILE"
	echo " using default names"
fi

#start command generation
set -- "$NAMES" 
IFS=","; declare -a NAME=($*) 
COMMAND='gnome-terminal' 
CURRENT=$STARTPORT
i=0
until [ $CURRENT -gt $ENDPORT ]; do
 if [ -z ${NAME[$i]} ]; then
	NAME[$i]=$CURRENT
 fi
 COMMAND="$COMMAND --tab --title '${NAME[$i]}' --command='telnet $HOST $CURRENT'"
 let CURRENT=CURRENT+1
 let i=i+1
done

# print and execute command
echo $COMMAND
eval "$COMMAND"
exit 0
