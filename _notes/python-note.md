---
layout: post
title:  "Python Note by a C++ Programmer"
categories: python note
---

* Table of Content
{:toc}

## Overview

* Python does not hae unary increment (i++) or decrement (x--) operators

### Numbers
```python
x = 3
print (x + 1)   # addtion
print (x - 1)   # substraction
print (x * 1)   # multiplication
print (x ** 1)  # exponentiation
print (17 / 3)  # returns float
print (17 // 3) # returns integer
print (17 % 3)  # returns modulo
```

### Booleans
```python
t, f = True, False
t and f     # and
t or f      # or
not t       # not
t != f      # xor
```

### Strings
```python
message = 'hello world!'
print (message)
print ('%s %d' %(message, 7))

len(message)    # gives the length
s.capitalize()  # capitalizes the first letter
s.upper()       # converts to uppercase
s.replace('a', 'b')
s.stript()      # srips leading and trailing whitespaces
```

### Containers

#### Lists

```python
x = []
x = [1, 2, 3, 'a', 'b', 'c']
x.append(3)     # add the element at the end
x.pop           # removes the last element

# indexing!
x[2:]
x[:-1]
x[2:5]
x[0:3] = ['a', 'b', 'c']

y = x[:]        # copy a list
```

##### Loop
```python
names = ['Alice', 'Bob', 'Carl']
for name in names:
    print (name);
```

```python
names = ['Alice', 'Bob', 'Carl']
for index, name in enumrate(names):
    print ('%d: %s' % (idx + 1, name));
```

##### List Comprehensions
```python
for x in nums:
    if x % 2 == 0
        squares.append(x ** 2)
    else
        squares.append(1)
```

```python
squares = [x ** 2 for x in nums if x % 2 == 0 else 1 for x in nums]
```

#### Dictionaries

* Similar to map in C++

```python
animals = {'cat': 'cute', 'dog': 'furry'}
animals['cat']          # returns the value if it exits in the library
                        # cause error otherwise
'cat' in animals        # checks if a dictionary has a given key
del d['cat']            # deletes the key-value pair

animals.get('cat', 'N/A')   # returns the value if it exits in the library
                            # returns N/A otherwise
```

##### Dictionary Comprehensions

```python
square = {x: x ** 2 for x in nums if x % 2 == 0}
```

```python
# Make a dictionary from two lists
list1 = ['EECS281', 'EECS370']
list2 = ['Data Structure and Algorithms', 'Intro. to Computer Architectures']
d = zip(list1, list2)

# Unroll a dictionary into two lists
list3, list4 = zip(*d)
```

#### Sets

```python
animals = {'cat', 'dot'}
'cat' in animals        # checks if a set has a given key
animals.add('panda')    # add a new element
len(animals)            # gives the set size
animals.remove('cat')   # removes an elemnt from the set
```

##### Set Comprehensions

```python
square = {x ** 2 for x in nums if x % 2 == 0}
```

### Tuples

```python
t = (0, 1)
```

### Functions

```python
def function_name(input):
    print(input)
```

### Classes

```python
class Cat:
    # Constructor
    def __init__(name, color):
        self.name = name
        self.color = color

    # Class member functions
    def getName(self):
        return self.name

cat = Cat('David', 'black')
```

* Methods & variables that start with '_' are not exported

## Little Tricks
```python
print('Python version ' + sys.version) # prints the python version
```

## Reference
* EECS445 Python Tutorial by Zhao Fu (September 12, 2016)
