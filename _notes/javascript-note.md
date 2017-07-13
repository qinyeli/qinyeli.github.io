---
layout: post
title:  "JavaScript Note by a C++ Programmer"
categories: java note
published: true
---

* Table of Content
{:toc}

## I/O

```javascript
confirm("...") // Gives a pop up window
prompt(question, prefilled_answer)
console.log()
```

## Functions

```javascript
var funcName = function (input) {
	...
};
```

## Math

```javascript
Math.random()
Math.floor()
Math.pow()
Math.PI
```

## String Manipulation

```javascript
str.toLowerCase()
str.toUpperCase()
```

## Object

```javascript
var me = {
	name: "Sindy",
	age: 22
}
```

```javascript
var me = new Object()
// or var me = {}
myObject["name"] = "Sindy"
myObject.age = 22
```

## Object Functions

```javascript
var bob = {}
bob.age = 22
bob.setAge = function (newAge) {
	bob.age = newAge
}
```

## Object Contructor

```javascript
function Person (name, age) {
	this.name = name
	this.age = age
}

var bob = new Person("Bob", 22)
```

## Loops

```javascript
for (var x in container) // iterate over name
for (var x of container) // iterate over value


```