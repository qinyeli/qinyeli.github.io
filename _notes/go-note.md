---
layout: post
title:  "Go Note by a C++ Programmer"
categories: go note
published: true
---

* Table of Content
{:toc}

## Basics

### Hello World!

```go
package main

import (
	"fmt"
	"math"
)

func main() {
	fmt.Println("Hello World!")
	fmt.Printf("%d", math.Sqrt(math.Pi))
	// fmt.sprint("") returns a string
}
```

```bash
$ go run main.go args
```

### Functions

```go
func swap(x, y string) (string, string) {
	return y, x
}
```

#### Naked return (Use only for short functions)

```go
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}
```

#### Closure

```go
func adder() func(int) int {
	sum := 0
	return func(x int) int {
		sum += x
		return sum
	}
}

func main() {
	pos, neg := adder(), adder()
	for i := 0; i < 10; i++ {
		fmt.Println(
			pos(i),
			neg(-2*i),
		)
	}
}

```

### Variables

#### Basic types

```go
bool
string
int uint uintptr
byte // alias for uint8
rune // alias for int32
     // represents a Unicode code point
float32 float64
complex64 complex128
```

#### Initialization
* Variables are initialize to zero values in default
* `int` and `float64` are initialized to `0`
* `string` is initialized to `""`
* `bool` is initialized to `false`

```go
// First way
var foo int
foo = 42

// Second way
foo := 42

// Initializing as a pointer
foo := new (int)
*foo = 42
```

#### Type inferences

```go
var i, j int = 1, 2
a, b, c = float64(1), true, "hello"
fmt.Println("%T", a) // Print the type
```

#### Constants

```go
const x = "Hello!"
```

#### Type Conversion

```go
i := 3
string(i)
```

### IO

```go
r := strings.NewReader(str)
b := make([]byte, 8)
for {
	n, err := r.Read(b)
	if err == io.EOF {
		break
	}
}
```

## Flow Control

### String Manipulation

#### Split

```go
f := func(c rune) bool {
	return !unicode.IsLetter(c)
}
fmt.Printf("%q", strings.FieldsFunc(s, f))
```

#### [String -> Int](https://golang.org/pkg/strconv/)

### For

```go
for i := 0; i < 10; i++ {
	sum += i
}

// While
sum := 1
for sum < 1000 {
	sum += sum
}

// Forever
for {
}

// Iterating through the slice
// i is the index
// v is a copy of s[i]
for i, v := range s {
}

for i := range s {
}

for _, v := range s {
}

// Receive values from the channel until it is closed
for i := range ch {

}
```

### If

```go
if val := math.Pow(x, n); val < limit {
} else {
}
```

### Switch

```go
switch os := runtime.GOOS; os {
case "darwin":
	fmt.Println("OS X.")
case "linux":
	fmt.Println("Linux.")
default:
	fmt.Printf("%s.", os)
}
```

```go
t := time.Now()
switch {
case t.Hour() < 12:
	fmt.Println("Good morning!")
case t.Hour() < 17:
	fmt.Println("Good afternoon.")
default:
	fmt.Println("Good evening.")
}
```

### Defer (until the surrounding function returns)

```go
defer fmt.Println("returning from the function")
```

* Deferred functions are push onto stack (LIFO)

## Data Structures

### Structs

```go
type Vertex struct {
	X int
	Y int
}

v := Vertex{1, 2}
v.X

p = &Vertex{X: 3}
p.X
```

### Arrays and slices

```go
var a, b [10]int
a = make([]int, 5) // len(b) = cap(b) = 5;
b = make([]int, 0, 5) // len(b) = 0; cap(b) = 5

c := [6]int{0, 1, 2, 3, 4, 5} // This creates an array
d := []int = {0, 1, 2, 3, 4, 5} // This creates a slice

var s []int = b[1:4] // Slices are ref to arrays
```

* `len(s)`: # of elements it contains
* `caps(s)`: # of elements of its underlying array, from the first element of the slice
* Zero value of a slice is `nil`

#### `append()`

```go
s = append(s, e1, e2, ...) // slice capacity grows on need
```

### Maps

```go
var m map[string]Vertex
m = make(map[string]Vertex)

var m = map[string]Vertex{
	"Bell Labs": {40.68433, -74.39967},
	"Google": {37.42202, -122.08408},
}
```

```go
// Insertion
m[key] = elem

// Retrieval
elem = [key]

// Deletion
delete(m, key)

// Testing
// If key is in m, ok is true. Otherwise, ok is false
elem, ok = m[key]
```

* Zero value of a map is `nil`

### Lists

* [Linked List Example](https://www.socketloop.com/tutorials/golang-linked-list-example)


## Methods

* Go has no classes, but it has methods on types
* We can only declare a method with a receiver whose type is defined in the same package

```go
// Value receiver
func (v Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

// Pointer receiver
func (v *Vertex) Scale(f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
}

func main() {
	v := Vertex{3, 4}
	fmt.Println(v.Abs())
}
```

* Note that a method with value/pointer receivers take either a pointer or a value as the receiver.
* A method with value/pointer arguments only take value/pointers as the arguments

### Interface

```go
type interfaceName interface() {
	funcName() typeName
}

func (x typeName1) funcName() typeName {
}

func (x typeName2) funcName() typeName {
}

func main() {
	var x interfaceName
}
```

### Stringer

```go
type Stringer interface {
	String() string
}
```

## Concurrency

### Goroutine

```go
go func(x, y, z)
```

### Channel

* Sends and receives block until the other side is ready

```go
var ch chan int
ch = make(chan int)

ch := make(chan int)
ch <- v    // Send v to channel ch.
v := <-ch  // Receive from ch, and
           // assign value to v.
```

#### Bufferred channels

```go
ch := make(chan int, 100)
```

#### Range and close

* Only Sender should close the channel
* Sender should close the channel when the receiver need to know that no more values will be sent. (e.g. to terminate the for range loop)

```go
close(ch)
```

#### Select

* Blocks until one of the case can run

```go
for {
	select {
	case c <- x:
		x, y = y, x+y
	case <- quit:
		fmt.Println("quit")
		return
	default:
		time.Sleep(50 * time.Millisecond)
	}
}
```

#### Mutex

```go
mux sync.Mutex
mux.Lock()
mux.Unlock()
```

## Reference
1. [https://tour.golang.org/welcome/]()
