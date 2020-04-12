#Variables
 
Strings with interpolation : `"I love $pet"` - replaces special char combinations
Strings without interpolation: ```'I love $pet'```
Strings output of a command: 
```
`pwd`
```
 
## References to other variables:
 
An array is an ordered list of scalars, accessed 7 by the scalar’s position in the list. The list may contain numbers, strings, or a mixture of both. (It might also contain references to subarrays or subhashes.) To assign a list value to an
array, simply group the values together (with a set of parentheses)
```
my @home = ("couch", "chair", "table", "stove");
my ($potato, $lift, $tennis, $pipe) = @home;
```
These are called list assignments. They logically happen in parallel, so you can swap two existing variables by saying:
```
($alpha,$omega) = ($omega,$alpha);
```
 
To access an element of an array: `$array[4]`
 
Push - adds to the end of array
Pop - removes from the end of array
Shift - removes from the front of array
Unshift  - add to the front of array
Reverse - reverses the order of the array
 
 
## Hashes
 
To access an element of a hash: 
```
$wife{"Adam"} = "Eve";
$wife{"Jacob"} = ["Leah", "Rachel", "Bilhah", "Zilpah"];
```
That statement creates an unnamed array and puts a reference to it into the hash element `$wife{"Jacob"}`
 
Topicalization
 
```
package XXX; # initiates a package definition
use XXX; # Uses the package
``` 
 
 
```
If (!a) {b}
Elsif (c) {d}
Else {e}
 
Unless (a) {b}
 
Given (x) {
When (y) {z}
When (t) {u}
Default {v}
}
``` 
 
## Loop breaks
Next (continue), last (break)
Use loop labels to break out of multilevel loops:
 
## Regex
`/PATTERN/`
 
Repalces foo with bar, returns true if succeded
`s/foo/bar`
