---
layout: post
title:  "SQL Note for sqlplus"
categories: sql note
---

# SQL Note for sqlplus

## Data Type
* INTEGER
* VARCHAR2
* TIMESTAMP

## Setting
```sql
SET colsep '|'
SET line 10000
SET ECHO ON
START filename
```

## Show All Tables

```sql
SELECT owner, table_name FROM all_tables WHERE owner='QINYELI';
```

## Finding Schema of a Table

```sql
DESC <TableName>
```

## Commenting

```sql
; This is a comment
/*
 This is a multiple
 line comment.
 */
```

```sql
CREATE DATABASE test
USE test
```

## Creating Table

```sql
CREATE TABLE celebs (
    id INTEGER,
    name TEXT,
    age INTEGER
);
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);
SELECT * FROM celebs;
SELECT name FROM celebs;

ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;

UPDATE celebs
SET age = 22
WHERE id = 1;

UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4; 

DELETE FROM celebs WHERE twitter_handle IS NULL;
```

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

SUM() takes the column name as an argument and returns the sum of all the values in that column.
MAX() takes the column name as an argument and returns the largest value in that column.
MIN() takes the column name as an argument and returns the smallest value in that column.
AVG() takes a column name as an argument and returns the average value for that column.
ROUND() takes two arguments, a column name and the number of decimal places to round the values in that column.
Report a Bug

INNER JOIN will combine rows from different tables if the join condition is true.
LEFT OUTER JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.
AS is a keyword in SQL that allows you to rename a column or table in the result set using an alias.
```


show tables
select database()



mysql -u root -p

mysql> CREATE USER 'finley'@'localhost' IDENTIFIED BY 'some_pass';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost'
    ->     WITH GRANT OPTION;

 service mysqld start
 service mysqld stop
 service mysqld restart