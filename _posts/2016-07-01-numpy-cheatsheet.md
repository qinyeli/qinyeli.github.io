---
layout: post
title:  "Numpy Cheat Sheet"
categories: numpy cheatsheet
published: false
---

# Numpy Cheat Sheet

Just a concise note on numpy for myself when doing a machine learning project.  
[Reference: Quickstart tutorial](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)

## Basics

```python
a = np.arnage(15).resize(3, 5)
a.reshape(3, 5)
a.ndim
a.size
a = np.array([2,3,4]
a = np.array([(1, 2, 3), (4, 5, 6)])
a = np.zeros(3)
a = np.zeros(2, 3)
a = np.ones(3)
a = np.random.random((2, 3))
a[:, 1]
a[3, :]
a[1, 2, ...] equiv a[1, 2, 3, :, :, :]
a.flat() equiv a.ravel()
```

## Multiplication

```python
A*B # elementwize multiplication
A.dot(B) # matrix product
np.dot(A, B) # matrix product
```

## Splitting and Merging

```python
np.hsplit(3)
np.vsplit(3)
np.vstack([a, b])	# a
					# b
np.hstack([a, b])	# a b
```

## Linear Algebra

```python
a.transpose()
np.ligalg.inv(a)
np.eye(3) # returns a diagonal matrix
np.trace(a)
np.linalg.eig(a) # returns the eigen values and eigen vectors
```