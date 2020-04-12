When you assign, Python creates an object. An  object is a collection of attributes. An attribute is a variable that has a name and a value. Objects have types, but variables do not

```
n = 100
n------------> ("type":"int", "CV":100,"RC":1)
CV = current value
RC = Reference Count

n = "Hello"
n------------> ("type":"string", "CV":"Hello","RC":1)
```
After a new assignment, n points to new object and RC in initial object is set to 0. When RC becomes 0, the object is not used and becomes orphan object which can be be garbage collected.
```
("type":"int", "CV":100,"RC":0)
```
If the object is still not deleted, and gets reassigned the same value, the variable is repointed to the initial object.
```
del n - removes object from memory
```
- Class: Upercase
- functions: camelCase
- vars: lower_case

A module is a file that has .py extension. When a module is loaded, it searches for that file in current directory then on the path. It then compiles that module into bytecode (.pyc)
