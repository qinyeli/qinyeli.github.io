---
layout: post
title:  "SQL Note for sqlplus"
categories: sql note
---

* Table of Content
{:toc}

## Starting and Quitting
```sql
sqlplus; to start
START filename; to load an .sql file
QUIT; to quit
```

## Data Type
* INTEGER (Built-in type by Oracle; always slowers)
* NUMBER
* VARCHAR2
* TIMESTAMP

## Commenting
```sql
; This is a comment
/*
 This is a multiple
 line comment.
 */
```

## Setting
```sql
SET colsep '|'
SET line 10000
SET ECHO ON
```

## Show All Tables
```sql
SELECT owner, table_name FROM all_tables WHERE owner='QINYELI';
```

## Show Table Size
```sql
SELECT COUNT(*) FROM tablename

```

## Finding Schema of a Table

```sql
DESC <TableName>
```

## Comparing Two Tables
```sql
SELECT * FROM A
MINUS
SELECT * FROM B;

SELECT * FROM B
MINUS
SELECT * FROM A;
```

Both of the queris should select 0 rows if the tables are identical.


## Creating Table

```sql
CREATE TABLE celebs (
    id INTEGER,
    name TEXT,
    age INTEGER
);
```

## Inserting
```sql
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);
SELECT * FROM celebs;
SELECT name FROM celebs;

ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;
```

## Updating
```
UPDATE celebs
SET age = 22
WHERE id = 1;

UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4; 
```

## Deleting
```sql
DELETE FROM celebs WHERE twitter_handle IS NULL;
```

## Clearing
```sql
TRUNCATE TABLE A
```

## Set Manipulation

* Always do it on a key!

```sql                    
UNION (elimiates duplicates)
ALL UNION (keep duplicates)
```


```sql
INTERSECT 
```

## Output Redirection
```sql
spool info.csv
-- query here!
spool off
```

## Aggregate Operators

* `COUNT`
* `SUM`
* `AVG`
* `MAX`
* `MIN`
These operators take a column name as input

* `ROUND` takes a column name and the number of decimal places as input
e.g.

```sql
SELECT S.name
FROM Sailors S
WHERE S.age =
    (SELECT MAX(S2.age) FROM Sailors S2);
```


## Selecting

```sql
SELECT DISTINCT genre FROM movies;

SELECT * FROM movies WHERE imdb_rating > 8;

SELECT * FROM movies
WHERE name LIKE 'Se_en';

SELECT * FROM movies
WHERE name BETWEEN 'A' AND 'J';

SELECT * FROM movies
WHERE year BETWEEN 1990 AND 2000;

SELECT * FROM movies
WHERE year BETWEEN 1990 AND 2000
AND genre = 'comedy'; // AND means the second condition in WHERE

SELECT * FROM movies
WHERE genre = 'comedy'
OR year < 1980;

SELECT * FROM movies
ORDER BY imdb_rating DESC;

SELECT * FROM movies
ORDER BY imdb_rating ASC
LIMIT 3;
```

```sql
SELECT COUNT(*) FROM fake_apps;

SELECT price, COUNT(*) FROM fake_apps
GROUP BY price;

SELECT SUM(downloads) FROM fake_apps;

SELECT MAX(downloads) FROM fake_apps;

MIN()

AVG()

SELECT price, ROUND(AVG(downloads), 2) FROM fake_apps
GROUP BY price;
```

```sql
SELECT * FROM albums WHERE artist_id = 3;
SELECT * FROM artists WHERE id = 3;
SELECT albums.name, albums.year, artists.name FROM albums, artists

SELECT
  *
FROM
  albums
JOIN artists ON
  albums.artist_id = artists.id;
  
SELECT
  *
FROM
  albums
LEFT JOIN artists ON
  albums.artist_id = artists.id;
  
SELECT
  albums.name AS 'Album',
  albums.year,
  artists.name AS 'Artist'
FROM
  albums
JOIN artists ON
  albums.artist_id = artists.id
WHERE
  albums.year > 1980;
```

```sql
CREATE TABLE creates a new table.
INSERT INTO adds a new row to a table.
SELECT queries data from a table.
UPDATE edits a row in a table.
ALTER TABLE changes an existing table.
DELETE FROM deletes rows from a table.

SELECT is the clause you use every time you want to query information from a database.
WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
LIKE and BETWEEN are special operators that can be used in a WHERE clause
AND and OR are special operators that you can use with WHERE to filter the query on two or more conditions.
ORDER BY lets you sort the results of the query in either ascending or descending order.
LIMIT lets you specify the maximum number of rows that the query will return. This is especially important in large tables that have thousands or even millions of rows.
COUNT takes the name of a column(s) as an argument and counts the number of rows where the value(s) is not NULL.
GROUP BY is a clause used with aggregate functions to combine data from one or more columns.


```

## Joining

* `INNER JOIN` combines rows from different tables if the condition is true.
* `LEFT OUTER JOIN` will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.
* `RIGHT OUTER JOIN`
* `FULL OUTER JOIN`


## Renaming
```sql
AS is a keyword in SQL that allows you to rename a column or table in the result set using an alias.
```

## Ordering

```sql
SELECT S.name, S.age
FROM Sailors S
ORDER BY S.age [ASC]
```

```sql
SELECT S.name, S.age
FROM Sailors S
ORDER BY S.age DESC
```

# For sqlite
```sql
CREATE DATABASE test
USE test
```

```sql
show tables
select database()



mysql -u root -p

mysql> CREATE USER 'finley'@'localhost' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost'
    ->     WITH GRANT OPTION;

 service mysqld start
 service mysqld stop
 service mysqld restart
```

## Having
```sql
SELECT S.rating, MIN(S.age)
FROM Sailors S
WHERE S.age >= 18
GROUP BY S.rating
HAVING COUNT (*) >= 2
```

## Grouping
```sql
SELCT MIN(S.age), S,rating
FROM Sailors S
GROUP BY S.rating
```
* Print result one row for each group


```sql
SELECT DISTINCT S.sid FROM
Sailors S, Sailors S2 WHERE
S.rating > S2.rating AND
S2.name = 'Join';

SELECT S.name
FROM Sailor S
WHERE S.rating > ANY(SELECT S2.rating
    FROM Sailor S2
    WHERE S2.name = 'Horatio')
```