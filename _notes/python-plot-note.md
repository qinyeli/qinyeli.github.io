---
layout: post
title:  "Plotting with Python! -- for Machine Learning"
categories: python note
---

* Table of Content
{:toc}

## To Plot x vs. y

```python
plt.plot(x, y, 'r-', label='label')
plt.legend()
plt.xlabel("x")
plot.ylabel("y")
plt.show()
```

```python
# To plot scattered data
plt.scatter(x, y)
# or plt.plot(x, y, '.', markersize=0.5)
```

## To Plot y vs. idx

```python
plt.plot(y, label = 'y')
```

## To draw Vertical Lines

```python
plt.axvline(pd.to_datetime('2013-09-21 6:09'))
```

## Plotting interactively

```python
import matplotlib
matplotlib.interactive(True)
```

## Colors

```
b: blue
g: green
r: red
c: cyan
m: magenta
y: yellow
k: black
w: white
```

## For rainbow color

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

## To plot log scale figure

```python
plt.semilogx(time, y)
```

## To save the figure

```python
# replace plt.show() with
plt.savefig("figure.png")
```

## Subplot

```python
plt.subplot(2, 1, 1)
plt.plot(x, y1)
plt.title('y1')
plt.subplot(2, 1, 2)
plt.plot(x, y2)
plt.title('y2')
plt.show()
```
