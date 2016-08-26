---
layout: post
title:  "Bash Cheatsheet"
categories: 
published: false
---

* Globally search "TODO"

```bash
grep -n TODO *.*
```

* Check 10 most used commands

```
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
```