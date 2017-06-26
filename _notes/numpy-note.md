---
layout: post
title:  "Machine Learning with Python -- Numpy"
categories: python numpy note
---

* Table of Content
{:toc}

## Basics

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
a = np.zeros((2, 3))
a = np.ones(3)
a = np.ones((2, 3))
a = np.eye(3)           # creates an 3 x 3 identity matrix
a = np.identity(3)
a = np.full((2, 3), 7)  # creates a constants array
a = np.random.random((2, 3))
```

```python
a.ndim
a.size
a.shape
a.dtype
```

## Indexing

``` python
a[:, 1]
a[1, :]    # Rank 1 view of the second row of a  
a[1:2, :]  # Rank 2 view of the second row of a
a[[1], :]  # Rank 2 view of the second row of a
a[1:3, :]
a[1, 2, ...] equiv a[1, 2, 3, :, :, :]
a.flat() equiv a.ravel()
```

## Multiplication

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

## Splitting and Merging

```python
np.hsplit(3)
np.vsplit(3)
np.vstack([a, b])   # a
                    # b
np.hstack([a, b])   # a b
np.concatenate([a, a, a])
```

## Statistics

```python
A.sum()
d.mean()
d.std()

np.median(A) # returns the median of the flatened array
np.median(A, axis=0) # returns the median of each column
np.median(A, axis=1) # returns the median of each row
```

## Linear Algebra

```python
a.transpose()       # or a.T
np.ligalg.inv(a)
np.trace(a)
np.linalg.eig(a)    # returns the eigen values and eigen vectors
```

## SVD (Singular Value Decomposition)
```python
U, Sigma, V = np.linalg.svd(A);

# The returned Sigma from a vector to a matrix
Sigma = np.diag(Sigma)

# The returned V is actually V transpose
V = V.transpose()

# The folloing matrix should be the same as A
print(U.dot(Sigma.dot(V.transpose())))
```

## Plotting
```
plt.imshow(A)
plt.show()
```

## Reading
```python
A = np.genfromtxt(filename)
A = np.loadtxt(filename)
```

## Reference
* [Reference: Quickstart tutorial for Numpy](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)
