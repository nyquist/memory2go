# Linux 102 - Text files
**cat** = lists the contents of a file
> -E or --show-ends - display line ends ($)
> -n or --number - adds line numbers to the beginning of every line.
> -b or --number-nonblanks - it only numbers lines that contain text
> -s or --squeeze-blank - compresses groups of blank lines to only 1 line
> -T or --show-tabs - displays tabs as ^I
> -v or --show-nonprinting - displays most control and other special characters

**tac** =  cat with reverse order of line

**grep**
> -i = case-insensitive
> -v  = invert search (all lines that don't match)
> -c = count the lines instead of listing the output
> -l  = print the filename of files with match
> -L  = print the filename of files with no match
> -E = extended regex (similar to egrep). See egrep

**egrep** = grep with extended regex

**less**

> /word = searches forwards for __word__ in the file 
> ?word = searches backwords for __word__ in the file
> gXX = goes to line number XX 
> h = help 
> q = exit

**diff** - shows differences between 2 files

**head** = shows top lines of the file
> -N = shows top N lines of the file. Default: 10

**tail** = show bottom lines of the file
> -N = shows top N lines of the file. Default: 10
> +N = shows lines starting from line N
> -f = follow (output appended data as the file grows)

**sort** = sorts lines in a file
> -f or --ignore-case: ingnores case
> -M or --month-sort: sorts by three-letter month abbreviation JAN-DEC
> -n or --numeric-sort: sorts by numbers
> -r or --reverse: sorts in reverse order
> -k field or --key: field - set the sort field. Use field1, field2 to sort by multiple fields

**join** = joins the lines of the files based on matching content. It requires its two files to have the same ordering of lines (use sort)
> `join file1 file2 [OPTIONS]`
> 	-i : case insensitive
> -t CHAR: define the field separator 
> -1 FIELD_NUMBER : define the field used for comparison in the first file
> -2 FIELD_NUMBER : define the field used for comparison in the second file
> -o FORMAT : define more complex specifications for the output file. See man

**paste** = merges the lines of the files separating the lines from each file with tabs. Files must be equally sized
> `paste file1 file2` 

**cut** - extracts portions of input lines and displays them on standard output
> -b, --bytes=LIST
> : cuts the specified LIST of bytes
> 
> -c, --characters=LIST
> : cuts the specified list of characters
> 
> -f, --fields=LIST
> : cuts the specified field. By default fields are delimited by tabs. It can be changed with
> 
> -d, --delimiter=DELIM
> : sets DELIM as the delimiter character, instead of TAB
> 

Each LIST is made of one or more ranges. Ranges are expressied in orne of the formats
> N  
> : The Nth Byte/Character/Filed
> 
> N-M 
> : From Nth to Mth
> 
> N- 
> : From Nth to end of line
> 
> -M 
> : From start of line to Mth


Ex: to get the MAC address of the eth interface, use:
`ifconfig eth0 | grep HWaddr | cut -d " " -f 11`


**expand** = changes tabs to spaces. By default 1 tab = 8 spaces
> -t, --tabs=NUM
> : sets the number of spaces to be replace one tab

**unexpand** = changes spaces to tabs

**unique** = removes duplicate lines

**split** = breaks a file into more files. It needs an output file basename as argument
> -b, --bytes=SIZE
> : breaks the input into pieces of SIZE bytes,
> 
> -C, --line-bytes=SIZE
> : breaks the input into pieces of SIZE bytes, without breaking lines
>
>-l, --lines=NUMBER
>: breaks the input into pieces of NUMBER lines

**tr** = changes individual characters from stdin. You specify the characters you want replaced in a group (SET1) and the characters with which you want them to be replaced as a second group (SET2). Each character in SET1 is replaced with the one at the equivalent position in SET2. 
`tr [OPTIONS] SET1 [SET2]`
Example: `tr ABC ab < file`

**wc** = word count
> -l : only lines
> -w : only words
> -b - only bytes
> -c - only chars

**sed** = directly modifies the contents of files, sending the changed file to stdout
!!!TBD!!!



<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwNDkzNzUzNDIsMTI0NDU2Njk0NF19
-->
