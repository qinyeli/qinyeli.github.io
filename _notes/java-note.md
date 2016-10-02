---
layout: post
title:  "Java Note by a C++ Programmer"
categories: java note
published: true
---

* Table of Content
{:toc}

## Eclipse

* Eclipse is a free Integrated Development Environment (IDE)
* How to start a new project
File -> New -> Java Project
* How to import an exiting project into eclipse
File -> Import -> General -> Existing projects into workspace -> Next

## Overview

### The Hello World code

```java
package proj.qinyeli;

public class HelloWorld {
	public static void main(String main[]) {
		System.out.print("Hello");
		System.out.println(" World");
	}
}
```

* JVM: Java Virtual Machine
* JRE: Java Runtime Environment
* J2SE: Java2Platform,StandardEdition (previously called JDK)

* Java has no pointers
* Everying is a reference
* Automatic array bounds checking

* OOP
	* Encapsulation: group data and functionality together
	* Inheritance: allows one data type (class) to acquire properties of other data types (classes)
	* Polymorphism: allows one common interface for many implementations


[HugeAPI](http://docs.oracle.com/javase/8/docs/api/)
[User](https://community.oracle.com/community/java)[Community](http://javaranch.com/)

## Objects, Types and Style
* CLASSPATH
	* Tells the compiler and JVM where to look for user-defined classes and packages
	* Can be specified on the command line (-cp)

* Package
	* Classes are grouped into packages
	* Packages are named with a hierarchy that matches the directory name
	e.g. 
		`$CLASSPATH/eecs285/Transport/Truck.java`
		`package eecs285.Transport` in `.java` file


* Documentation handled by [javadoc](http://www.oracle.com/technetwork/java/javase/documentation/javadoc-137458.html)

### Building and running from the command line

```java
javac HelloWorld.java
```
This produces a file named “HelloWorld.class”. To run the code, type 

```
java proj.qinyeli.HelloWorld arg0 arg1
```

#### Command line arguments
```java
public class myClass {
	public static void main(args[]) {

	}
}
```

* Unlike C++, whose `argv[0]` stores the name of the program, args[0] stores the first argument form the command line.


### Built-in types
* Also called primitive types
* Start with lower case
* Passed by value
* `boolean`, `char`, `int`, `long`, `byte`, `short`, `double`, `float`

### Not built-in types
* Start with upper case
* Passed by reference
* No memory associated with the value when declared
* Must use "new" to get the reference to the usable memory
	* e.g. `Person p = new Person("Alice");`
* `String` in `java.lang`
* Wrapper: 	`Boolean`, `Char`, `Integer`, `Long`, `Byte`, `Short`, `Double`, `Float`
	* Wrappers of primitive types are immutable
	* Immutable objects can not be changed once constructed
	* Instead, it creates a new object and alters the reference
	* Useful in concurrent applications
* Use `obj1.equals(obj2)` to compare two objects

```java
int myInt = 5;
Integer myIntObj = myInt;
// autoboxing from Java >= 1.5
Integer myIntObj = new Integer(myInt);
// method used for Java < 1.5
String myStr = myIntegerObj.toString();
// Each wrapper has the ability to convert its value to and from a String type
```

### Class attributes (member variables)
Access modifiers

* `private`: Accessible only to methods of the class
* `public`: Accessible to any classes
* `protected`: Accessible to classes in the same package and subclasses in any package

## Statements and Flow
* Expression: a sequence of tokens that can be evaluated to a numerical quantity
* Statement: a sequence of tokens recognized by the compiler as a complete instruction
* Block: allows multiple statements to be combined into what the compiler recognizes as a single statement
* `if-else`, `switch`, `while`, `for`
* Functions: built-in types passed by value; non-built-in types passed by reference

## Object Instantiation, Modifiers, and Enumerated Types

### Constructors
* Implicit default ctor ( only available when no other programmer-defined ctors specified
* No destructor

```java
class myClass {
	public myClass() {
		...
	}
	protected void finalize() {
		// This function will be executed when the object is "dstructed"
		// Do works such as close() here.
	}
}
```

### Modifiers
* static variable: all object of the class share the single static data
* static function: does not utilize any instance data
* final variable: const

### Enumerated Type
* Introduced only in Java 1.5
* Can have data members, ctors

```java
enum DayOfWeek { SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY };
DayOfWeek classDay = DayOfWeek.MONDAY;
```

### Import
```java
import static java.lang.System.out;
// Allows out to be used unqualified
import eecs285.test.Months.MonthEnum;
// Allows MonthEnum to be used unqualified
import static eecs285.test.Months.MonthEnum.*;
// Allows all values of MonthEnum to be used unqualified
```

## Flouting Point Arithmetic
* Floats use 4 bytes (32 bits)
* Doubles use 8 bytes (64 bits)
* Do not use `==` to compare floting points (because of roundoff error)

## Inheritance

* Base class: parent class
* Derived class: child class
* `extends`

* `super` and `this`

* Always ok for a base class reference to refer to a subclass object
* Can explicitly cast a base class reference to assign it to a subclass reference (no problem when type is actually correct)

* Multiple inheritance not supported
* Multiple level of inheritance allowed

## Polymorphism
* Polymorphism: a common interface for multiple implementations
* Unlike C++, where the keyword `virtual` is needed, polymophism is automatic in Java
* When a base class reference invokes a method
	* If the true type has implemented a method with the appropriate interface, that method is executed
	* If the true type does not have a matching method, the base class method is executed
	* If the true type is the base class, the base class method will be executed
* Can not call a method that is specific to a subclass via a base class reference
* `abstract` method does not have any implementation in the base class, so it forces the derived class to implement
* `final` method can not be overridden => increases efficiency
* `final` class can not be extended => increases efficiency

## Arrays
* In C/C++, there are two types of arrays
	* Statically allocated arrays
	* Dynamically allocated arrays
* Java treats arrays as objects
	* When you declare an array, you declare a reference to the array
	* Must use `new` to allocate the actual array

```javapu
int [] arrayRef;
arrayRef = new int[5];
```

* To iterate through the array

```java
for (i = 0; i < myStrAry.length; i++) {
	System.out.println("Elem: " + myStrAry[i]);
}
for (String strElem : myStrAry) {
	System.out.println("Elem: " + strElem);
}
```

* Java does automatic run-time bounds checking for all array index operations
	* throws ArrayIndexOutOfBoundsException if error detected
	* Slow but safe

* Cloning an array

```java
arrayRef = (int [])squareVals.clone();
// clone() is a generic function that can be used on any object.
// It clones an object and causes a new object to be allocated and copied.
// However, the return value must be casesd.
System.arraycopy(squareVals, 0, anotherCopy, 0, 5);
// System.arrayCopy(<src>,<srcOffset>,<dest>,<destOffset>,<num>)
```

* In Java, there are no such thing as arrays of object. There are only arrays of object references.
	* You must use `new` on each array element to actually allocate an object

* Initializing an array

```java
Employee [] empAry = new Employee [] { new Employee("John"), new Employee("Jeff"),
	new Employee("Jack"), new Employee(),
new Employee() };
int [] squaresAry = { 0, 1, 4, 9, 16 };
```

* There is no such thing multi-dimentaional array. There is only array of arrays

```java
int [][] twoDAry = new int[10][60];
```

```java
int [][] twoDAry = new int[10][];
for (i = 0; i < twoDAry.length; i++) {
twoDAry[i] = new int[60]; }
```

## Exceptions
```java
// Exception in Java are just classes
public class someException extends Exception {
	...
}
...
try { // try can be nested
	if (someCondition)
		throw new someException();
}
catch (Exception excep) {
	if (excep instanceof semeException)
		excep.printStackTrace(); // Prints stack trace
}
finally { // finally block is always executed
}
```

Types of exception

* Exception thrown by system
	* If not cuaght, they will propagate up the call stack
	* If not caught at highest level, it cuases the program to abort
* Exception thrown by user
	* Must be caught somewhere
	* If a function does not handle a function, it must specify  
		e.g. `public void foo(int a) throws someException {`
	* Inherits from java.lang.Exception

Exception Propagation

* A thrown exception propagates upward until caught
	* Can be caught by a catch that catches the exact type of throw exception
	* Can be caught by a catch that catches any parent class
	* If caught, executes `catch` and `finally`
	* If not caught, executes `finally` and propagates up

## Interfaces and Classes

### Interfaces
* Java does not support multiple inheritance, but allows a common interface to be shared by any classes that implements the interface
* Interface has no implementation
* Interface has no data members (except for static final constants)
* Classes that `implement` an interface are considered of the interface type
* Interfaces are typically named "~able"

```java
public interface Fuelable {
	int refuel();
}

public class Car
	extends Transportation
	implements Fuelable {
	
	private final int TANK_SIZE;
	int fuelGallons = 0;
	
	public int refuel () {
		fuelGallons = TANK_SIZE;
	}
}
```

### Nested Classes
* Nested classes are often used as helper classes
	* e.g. event handler classes, undo buffers

#### Anonymous Inner Classes
* The definition of an anonymous  class (by extension) and object allocation is done all at once
* Mainly used for event handlers

## Generics
* Corresponds to Templates in C++

```java
// CompareClass is a generic class that support any data type
// that implements the Comparable generic interface
public class CompareClass< DataType extends Comparable< DataType> > {
	public int compare(DataType x, DataType y) {
		return x.compareTo(y);
	}
}

public class Product implements Comparable< Product > {
	...
	public int compareTo(Product rhs) {
		if (this.id < rhs.id) return -1;
		else if (this.id == rhs.id) return 0;
		else return 1;
	}
}

CompareClass< Integer > intComp = new CompareClass< integer > ();
CompareClass< Product > prodComp = new CompareClass< Product > ();
intComp.compare(x, y);
prodComp.compare(p1, p2);
```

## Collections

### Vector (implements List)
* How to sort a vector?

```java
// First, we need to impelment comparable class.
// Next, we need to declare the vector as a list.
List list = new Vector();
// Then, we sort it using the utility from java.util.Collections
Collections.sort(list);
// or Collections.sort(list, comparator);
```

### LinkedList (implements Collection)

```java
import java.util.LinkedList;
import java.util.ListIterator;

public class Demo {
	public static void main(String [] args) {
		LinkedList< Integer > list = new LinkedList< Integer >();
		list.add(8);
		list.add(9);
		
		ListIterator< Integer > it = list.listIterator();
		while (it.hasNext()) {
			...
		}
		
		for (Integer val: list) {
			...
		}
		...
	}
}
```

* `addFirst(Element)`, `addLast(Element)`
* `get(int)`, `getFirst()`, `getLast()`
* `listIterator()`, `listIterator(int)`
* `remove(int)`, `removeFirst()`, `removeLast()`, `removeRange(int, int)`
* `set(int, Element)`
* `size()`
* `toArray(Element[])` puts the elements of the list into the array ref provided
* `Collections.sort(list)`, `Collections.sort(list, new myComparator())`

### `java.util.Comparator`
* Most functionality that supports order-checking using the Comparable interface has an overloaded func which includes a parameter for a Comparator

```java
public class ProductNameComparator implements Comparator< Product > {
	public int compare(Product p1, p2) {
		return p1.getName().compareTo(p2.getName());
}
```

### Set (implements Collection)
* `HashSet` vs. `TreeSet` (based on Comparable or Comparator)

### Map
* `TreeMap` vs. `HashMap` (based on Comparable or Comparator)

```java
HashMap< String, Integer > someMap = new HashMap< String, Integer >();
// Cannot write as HashMap< String, int > here, becuase primitive types
// cannot be used as generic arguments


someMap.put(key, value);

HashSet< Integer > valueSet = new HashSet< Integer >(someMap.values());
LinkedList< Integer > valueList = new LinkedLIst< Integer >(someMap.values());

// Entry is a nested class in Map, which is used to iterate through a Map
for (someMap.Entry< KeyType, ValueType > entry: someMap.entrySet()) {
	someMap.getKey();
	someMap.getValue();
}
```

* `containsKey(key)`
* `containesValue(value)`
* `get(key)` (null if no corresponding key-value pair)
* `remove(key)` (returns the value associated)

### Priority Queue

* The `PriorityQueue` class in Java is a min heap

```
import java.util.PriorityQueue
E peek() // retrieves, but does not remove, the head of the queue (null if the queue is empty)
E poll() // retrieves and removes the head of the queue (null if the queue is empty)
boolean offer(E e) // inserts the e into the priority queue.
```

## Input and Output

### Input

* Scanner parses an input stream

```java
Scanner sc = new Scanner();
sc.next(); // returns the next token as a string
sc.nextInt(); // returns the next token as an int
sc.nextDouble(); // returns the next token as a double
sc.hasNextInt(); // returns true if the next token can successfully be interpreted as an int
// (but does not consume the token)
sc.nextLine(); // reads in a full line as a string
```

* Interactive input
```java
Scanner sc = new Scanner(System.in);
```

Then, the next function will cause the program to wait for user input from the keyboard.

* Note that `System.in` does not end, so the `hasNext()` function blocks forever (Unless the user press <kbd>ctrl</kbd> + <kbd>d</kdb>)

* Scanner can be attached to a File object

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import util.InputMismatchException;

Scanner inFile = new Scanner(new File("test.txt"));
```

* Scanner has no `nextChar()` method
* Character data is read using a method called `read()`

### Output

```java
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;

File file = new File("fileName.txt");
if (!file.exist()) {
	file.createNewFIle();	
}
PrintWriter writer = new PrintWriter("fileName.txt");
writer.println("Hello World!");
writer.flush();
writer.close();
```

---

## Other note

### How to generate random numbers?

*Method 1*

```java
import java.util.Random;

long randomSeed = (System.currentTimeMillis());
Random random = Random(randomSeed);
random.nextDouble(); // randomly returns a double between 0 and 1.
```
*Method 2*

```java
import java.lang.Math;

Math.rand(); // randomly returns a double between 0 and 1
```

### How to run bash from Java

```java
Runtime.getRuntime().exec("ls");
```

### Function object in Java

[https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html](https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html)

### BigDecimal

[https://docs.oracle.com/javase/7/docs/api/java/math/BigDecimal.html](https://docs.oracle.com/javase/7/docs/api/java/math/BigDecimal.html)

### String to Integer
```
Integer x = Integer.valueOf(str);
int y = Integer.parseInt(str);
```
