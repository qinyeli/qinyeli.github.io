---
layout: post
title:  "Python Note by C++ Programmer"
categories: python note
---

# Python Note by a C++ Programmer

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

## Plotting

```python
x = np.linespace(0, 1, 100);
y = x ** 2;
plt.plot(x, y, 'r-', label = 'parabola')
plt.legend()
plt.xlabel("x")
plot.ylabel("y")
plt.show()
```

```
# Create sample data with noise
x = np.random.uniform(1, 100, 1000);
y = np.log(x) + np.random,normal(0, 0.3, 1000)
plt.scatter(x, y)
plt.show()
```

### To pass in parameters

```python
import numpy as np
import matplotlib.pyplot as plt
import sys

color=iter(plt.cm.rainbow(np.linspace(0,1,len(sys.argv) - 1)))

for filename in sys.argv[1:]:
    data = np.genfromtxt(filename)
    y = np.arange(data.size)
    c = next(color)
    plt.plot(time, y, c = c, label = filename)

plt.show()
```

### To plot log scale figure

```python
plt.semilogx(time, y)
```

### To save the figure

```python
# replace plt.show() with
plt.savefig("figure.png")
```

### Subplot

```python
plt.subplot(2, 1, 1)
plt.plot(x, y1)
plt.title('y1')
plt.subplot(2, 1, 2)
plt.plot(x, y2)
plt.title('y2')
plt.show()
```

## Numpy

### Basics

```python
import numpy as np

a = np.array([1, 2, 3])
a = np.array([1, 2, 3], [4, 5, 6])
a = np.matrix('1, 2, 3; 4, 5, 6')

a = np.arnage(15).resize(3, 5)
a = a.reshape(3, 5)
a = np.array([2,3,4]
a = np.array([(1, 2, 3), (4, 5, 6)])
a = np.zeros(3)
a = np.zeros(2, 3)
a = np.ones(3)
a = np.ones(2, 3)
a = np.eye(3)           # creates an 2 x 2 identity matrix
a = np.full((2, 3), 7)  # creates a constants array
a = np.random.random((2, 3))
```

```python
a.ndim
a.size
a.shape
a.dtype
```

### Indexing

``` python
a[:, 1]
a[1, :]    # Rank 1 view of the second row of a  
a[1:2, :]  # Rank 2 view of the second row of a
a[[1], :]  # Rank 2 view of the second row of a
a[1:3, :]
a[1, 2, ...] equiv a[1, 2, 3, :, :, :]
a.flat() equiv a.ravel()
```

### Multiplication

```python
A + B       # addition
np.add(A, B)
A - B       # substraction
np.substract(A, B)
A * B       # elementwize multiplication
np.multiply(A, B)
A / B       # elementwize division
np.divide(A / B)
np.sqrt(A)  # elementwize sqrt
A.dot(B)    # matrix product or inner product of vectors
np.dot(A, B)
```

### Splitting and Merging

```python
np.hsplit(3)
np.vsplit(3)
np.vstack([a, b])   # a
                    # b
np.hstack([a, b])   # a b
np.concatenate([a, a, a])
```

### Statistics

```python
A.sum()
d.mean()
d.std()
```

### Linear Algebra

```python
a.transpose()       # or a.T
np.ligalg.inv(a)
np.trace(a)
np.linalg.eig(a)    # returns the eigen values and eigen vectors
```

### SVD (Singular Value Decomposition)
```python
import numpy as np
import matplotlib.pyplot as plt

A = np.loadtxt("file.dat");
U, Sigma, V = np.linalg.svd(A);

# The returned Sigma is a vector
Sigma = np.diag(Sigma)

# The returned V is actually V transpose
V = V.transpose()

# The folloing matrix should be the same as A
print(U.dot(Sigma.dot(V.transpose())))

# To plot the matrix
plt.imshow(A)
plt.show()
```

## Reference
* EECS445 Python Tutorial by Zhao Fu (September 12, 2016)
* [Reference: Quickstart tutorial for Numpy](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)

