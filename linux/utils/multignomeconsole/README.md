# MultiTabConsole

`MultiTabConsole` is useful when you need to quickly fire up multiple gnome-console tabs to a single host on different ports.

Mostly used for remote console access
## Usage

	./multiTabConsole [config-file]
if `config-file` is missing, a default file is used, located in the current folder and named `default.cfg`

## Config File
edit the config file to include HOST, STARTPORT, ENDPORT information.
Optionally, you can incude a NAMES string that will be used to name each tab.
