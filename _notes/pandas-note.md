---
layout: post
title:  "Machine Learning with Python -- Pandas"
categories: python panda note
---

* Table of Content
{:toc}

## Reminder
* After 3 hours of debugging pain, I realized that I need to keep a reminder for myself here that it is Panda*s*, not Panda.
* Every column of a dataframe is called a series

## I/O

```python
import pandas as pd

# Reading
df = pd.read_csv('filename.csv')
df = pd.read_excel(Location, 0, index_col='Date')

# Writing
df.to_csv('filename.csv')
df.to_excel('filename.xlsx', index=False)

X = df.as_matrix(['col1', 'col2']) # X is a numpy array
pd.Series([1,2,3]).values # Gives a numpy array
```

## Data Inspection

```python
df.index # Returns all the index
df.columns.values # Returns all the columns
```

```python
# Gives statistics about the whole data frame
df_train_data_23.describe()
```

* For iteration
```python
for index, row in df.iterrows():
    print (row["c1"], row["c2"])
```

```python
# Maximum value in the data set
MaxValue = df['col'].max()
```

## Manipulation

```python
Sorted = df.sort_values(['col'], ascending=False)
```

```python
df_data.drop(df_data.index[idx0:], inplace=True)
```

## Plotting
```python
# Plotting a column
df['col'].plot()
df['col'].plot(kind='bar')

# Plotting all columns
df.plot(figsize=(15, 10))

# List people with name Alice
df[['Name', 'Alice']]

# Count people with name Alice
df[['Name', 'Alice']].value_counts()
```

## Padding
```python
df.insert(0, 'pad', 1)
```

## Adding a column
```python
df['new_col'] = df['col'] * 3
```


## Manipulation
```python
df['State'] = df.State.apply(lambda x: x.upper())
df['State'].unique()
```

```python
# Concatenation
frames = [df1, df2, df3]
result = df1.append(df2)

# Merging
result = pd.merge(left, right, on='key')
```


```python
# Our small data set
d = [0,1,2,3,4,5,6,7,8,9]

# Create dataframe
df = pd.DataFrame(d)
# Lets change the name of the column
df.columns = ['Rev']
df['NewCol'] = 5
df['NewCol'] = df['NewCol'] + 1

# If we wanted, we could change the name of the index
i = ['a','b','c','d','e','f','g','h','i','j']
df.index = i


# make a copy of original df
newdf = df.copy()

State = newdf.groupby('State')

```