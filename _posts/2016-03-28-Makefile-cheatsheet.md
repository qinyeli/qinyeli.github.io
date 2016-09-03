---
layout: post
title:  "Makefile Cheatsheet"
categories: makefile cheatsheet
published: true
---

# Makefile Cheatsheet

## Format

~~~
target: dependencies/prerequisites
	command
~~~

## Special variables
e.g.

~~~
all: main.cpp class.cpp
~~~

* `$@`: name of the target (evaluates `all`)
* `$?`: first prerequisite (evaluates `main.cpp`)
* `$^`: all prerequisite (evaluates `main.cpp class.cpp`)

## Make clean
e.g.

~~~
.PHONY: clean

clean:
	find -executable -name "test*" | xargs rm -f
~~~

* `.PHONY` means that the target is phony. (i.e. the target does not correspond to a file)
* `find -executable -name "test*"` finds executables whose name begin with "test". This is especially useful in deleting test case executables.