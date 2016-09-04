---
layout: post
title:  "Bash Note (for stress test scripting)"
categories: bash note
---

# Bash Note (mainly for stress test scripting)

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

## Others

* Globally search "TODO"

```bash
grep -n TODO *.*
```

* Check 10 most used commands

```
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
```