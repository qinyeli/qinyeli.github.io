---
layout: post
title:  "Python Note (for plotting)"
categories: python note
---

# Python Note (mainly for plotting)

## To pass in parameters

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
