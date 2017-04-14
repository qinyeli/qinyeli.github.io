---
layout: post
title:  "Bash Note (for stress test scripting)"
categories: bash note
---

## For Loop

```bash
for i in `seq 1 10`;
do
    echo $i
done  
```

```bash
for testcase in test/*; do
	echo $testcase
done
```

## While Loop

```bash
COUNTER=0
while [  $COUNTER -lt 10 ]; do
    echo The counter is $COUNTER
    let COUNTER=COUNTER+1 
done
```

## String Manipulation

* `${#string}` gives the string length
* `${string:position}` gives a substring till end of string
* `${string:position:length}` gives a substring of the given length

## [Special Paramemters](http://www.thegeekstuff.com/2010/05/bash-shell-special-parameters/)

## Grep

* Globally search "TODO"

```bash
grep -n TODO *.*
```

* Search recursively for files with .txt extension

```bash
grep -r --include "*.txt" .
```

## Others

* Check 10 most used commands

```bash
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
```

* To compress

```bash
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
```