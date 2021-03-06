---
layout: post
title:  "Intro. to Operating Systems"
categories: course eecs482 cheatsheet
---

# EECS482 Operating System -- Review

## Threads and Concurrency
**Process**: a program inexecution; an instance of a program.  
Formal definition: one or more threads in an address space

**Thread**: a sequence of execution instructions.

**Concurrency**: multiple threads active at on time.  
Thread is the unit of concurrency

**Atomic operations**  
atomic: happens in its entirety or not at all

**Critical section**: a section of code that need to be run atomically

**Synchronization**

* mutual exclusion (use lock/mutex)
* ordering constraints (use cv)


* high-level (provided by software): locks, monitors, semaphores  
(monitor = lock + cv associated with that lock)
* low-level (provided by hardware): load/store, interrupt enable/disable, test&set

### Monitors

#### Lock/ Mutex
* Lock initialized to free
* lock(): acquire lock before entering a critical section (waiting if needed)
* unlock(): lease lock when exiting the critical section

**Hand-over-hand locking**: lock next node before releasing last node


#### CV
* wait(): atomically relase lock, add the thread to the waiting list, go to seeep  
Note: wait() should always be used in a while loop
* signal(): wake up one thead in the waiting list
* braodcast(): wake up all threads in the waiting list

Note: cv's got no memory of signal() or broadcase() (Compare that to semaphore)


#### Semaphore
* non-negative integer
* down(): wait for semaphore value to become positive, then decrement
* up(): increment the semophore value

* For mutual exclusion
	* initialized to 1
	* down() to lock
	* critical section
	* up() to unlock
	
* For ordering constraints
	* initialized to 0
	* down() in waiting thread to wait
	* up() in waited thread to signal

#### Mesa vs. Hoare monitors
* Hoare monitors give special priority to the woken-up waitor

##### Examples
* producer-consumer vending machine
* woman/man toilet
* thread safe queue
* ping pong
* reader-writer

### Thread Control Block (TCB)
Thread states:

* running
* waiting (for thread, mutex, or cv)
* ready

### Deadlock
Necessary condition:

* limited resources
* no preemption
* hold & wait
* circular dependency

Strategies:

* Ignore (proceed without the resources)
* Detect and fix
* Prevent
	* wait for all resource needed and acquire atomically
	* or if encouter a busy resource, release all resources and start over

#### Banker's algorithm: keep thread in a safe state  
A state is safe if some sequence of thread exection allows each thread to obtian maximum needed resource to finish, and release the resource.  
In Banker's Algorithm, a thread states its maximum resources requiremnet when it starts its task, but aquires and releases those resources incrementally.

## Scheduling
Goal:

* Minimize average response time/ delay (from arrival to completion)
* Maximize throughtput (the rate at which tasks are completed) of entire system
* Maximize fairness

### First-come, first-served (FCFS) (FIFO)
* Simple, but not interactive
* Short jobs get stuck behind long ones
* **Minimum overhead**
* **Longest average response time**
* Good for equally sized tasks


### Round robin
Periodically preempt all jobs (yield) according to "time slice"

* Good for interactive computing
* **More context-switching overhead**

### Shortest time to completion first (STCF)
Preempt curret job if a shorter one arrives

* Improve response time of short jobs
* Hurts response time of long jobs
* **Minimum average response time**
* Starvation (long jobs get stuck behind short jobs)
* Need knowledge of future

### Real-time scheduling
Earliest deadline first (EDF)

* Require worst-case analysis
* Might cause priority inversion => proprity donation (to task holding the lock)


## Address Spaces
Abstractions:

1. Address independence (over different process)
2. Virtual/Larger memory
3. Protection/Controlled Sharing (Swap file/ Regular file backed mem)

### Address Translation (by MMU)
* Static translation: tranlate addresses before execution
* Dynamic translation: translate addresses during execution

#### Base & Bounds (single segmentation)
* Load each process into contiguous region of physical memory
* Change base and bounds registers to change address spaces
* Hard to grow/shrink address space
* Low hardward cost/ low overhead
* No support for sharing data
* A single address spaces cannot be larger than physical memory
* External fragmentation (wasted memory between allocated regions)

#### Segmentation (a region of contiguous memory)
* A virtual address takes the form (segment #, offset)
* Different segments can have different protection
* Pros: easy to share/ easy to grow in sparse address spaces

#### Paging (fixed size of segmentation)  
* Allocate physical memory in pages (fixed-size units)
* virtual address
	* vpn
	* offset
* Tranlation data store in page table
* Pros: easy memory allocation/ easy to share/ easy to grow address space
* Small page size => big offset
* Large page size => internal fragmentation

#### Multi-level Paging (slower, more flexible)
* Take less space becuase of allocation on need
* Space efficient for sparse address spaces
* Pros: easy memory allocation/ easy to share

### Caching

#### Tranlation Lookaside Buffer (TLB)
* TLB caches PTEs
* TLB must be reset on context switch

#### Replacement Algorithms
* Random
* FIFO
* OPT (require knowledge of the future)
* Second clock queue algorithm (substitution of LRU)
* Evict first clean pages and then dirty pages to avoid disk access

#### Eviction
* Write back
* Write through

#### Deferring Work
* avoid zero filling a page
* avoid writing back (dirty page)
* copy on write (make fork faster)

### Page Table
* Page table for kernel address have to be stored in physical memory
* Page table for user address coudl be stored in kernel's virtual address space or in physical memory
* Page table bits
	* valid
	* dirty
	* read
	* write
	* reference

### Kernel vs. User Address Spaces
protected data => tranlation data => mode bit => sys call => interrupt vector table

* Kernel has its own address space
* Most of the kernel's virtual address space is pinned to physical memory
* How does kernel access user's address space?
	* Via physical address
	* Map kernel address space into every process's address space
		* Trap to kernel does not change address spaces; it just allows computer to access both OS and user parts of the address space
		* Pro: page tables of processes that are not running can be swapped in to the disk
* Mode bit: kernel mode/ user mode
* Only kernel can execute privilege instructions provided by CPU
* Who changes the mode bit?
	* kernel!
	* How to change back?
		* Exceptions
		* **System call** => functions in interrupt vector table
* Administrative processis still running user model

#### System Call
* user mode => kernel mode (All these are atomic)
	* Set the mode bit to kernel mode
	* Save registers, program counter, stack pointer
	* Switch to the kernel stack (via changing sp)
		* Otherwise, other thread in can modify the kernel stack
		* Each thread has its own kernel stack
	* Switch to the kernel address space
	* Jump to the sys call interrupt\_handler
* Interrupt vector table (set in boot or changed by kernel )
	* Stores the location for interrupt\_handler

### Process Creation
* Allocate process control block
* Initilize tranlation data for new address space
* Read program from executable into memory
* Initialize register
* Set user mode bit to user
* Jump to start of program

### Multiprocess Issues
* Global vs. Local Replacement
* Thrashing (Working set)
	* active memory > physical memory
	* i.e. (t working set > physical memory)
	* How to fix it? Run a subset of the processes.

#### Process Creation
1. fork()
2. exec(): replace new process's data address space with data from program executable

## I/O and File Systems

### Disk I/O
Abstraction provided by OS:

* rich naming
* flat => structured
* caching

Acess time is decide by

* Queuing time
* Overhead (positioning time)
* Transfer time = size / transfer rate

To optimize I/O performance 

$$\mathrm{Efficiency = \frac{Transfer\ time}{(Posisioning\ time + Transfer\ time)}}$$

* Avoid I/O => caching
* Reduce overhead
* Amortize overhead over larger request
	* Layout data on adjacent tracks
		* data in one file, files in the same directory are usually read together
		* acess pattern can be observed (e.g. on application loading)
	* Disk scheduling
		* FCFS (first come, first served)/ FIFO (fisrt in, first out)
		* SSTF (shortest seek time first): cause starvation
		* SCAN: least overhead, optimizing throughtpu
		* CSCAN: more fair than SCAN

Flash RAM

* Better read performance, better write performance but still slow
* Wearout => level out the usage of all blocks
* No overwrite => page program operation, erase operation before rewrite

### File Systems
* File system is a persistent data structure
* File system supports: create, delete, read, write, search
* Multiple storage devices can be mounted into one file system

Rules of thumb

* Most accesses are reads
* Most accesses are sequencial and entire (spacial locality)
* Most files are small, but most bytes are in the large files

#### How to find files? How to organize files?

* File header (inode) that stores
	* file size
	* owner
	* access permissions
	* time stamp (modification ~, access ~, creation ~)

##### Contiguous allocation (corresponds to base and bound)
* An array of blocks
* File header stores starting location and file size
* Fast sequencial access
* Difficult to grow file
* External fragmentation

##### Indexed files (corresponds to paging)
* An array of block pointers
* Easy to grow file, easy random access
* Potentially slow sequencial access

###### Multi-level indexed files
* A tree of block pointers
* Allows large file without wasting header space for small files
* Potentially more accesses to read a file block => unbalanced tree

#### File Caching
* Virtual memory starts from memory and adds disk for larger capacity
* File system starts from disk and adds memory for better performance
* Unified buffer cache (global replacement)
	* Benefit: memory-mapped file (makes file look like part of the address space)

* Cache design
	* write back: fast
	* write through: slow, persistent
	* => To have a process that runs periodically and write back dirty pages

#### Reliability & Durability 
* Ordering
* Transaction: operation that must succeed or fail, but not partially complete
	* atomicity
	* durability
	
##### Shadowing (enable time machine)
1. Update the shadow
2. Change the pointer
3. Update the new shadow

###### Shadow Paging
* Based on the observation that file system is a tree
* Only shadow nodes that are related to the transaction

##### Logging
1. Write modifications to log, (which is stored in the disk)
2. Write commit to log
3. Update the data store
4. Truncate the log

* If only logging metadata, called journalling

##### Log-structrued File System (LFS)
* Optimize file system for writes (sequential)
* Make the file system a huge log
* inode map: a table of inode and block
* Check point region (small): tells where inode maps are
* Multiple check point with check sum to make sure it is valid

Problem: external fragmentation => log cleaner

## Networking and Distributed System

### Networking

#### Socket
app -> socket -> NIC(network interface card) -> NIC -> socket -> app

* name: port number
* bounded consumer-producer buffer

#### IP (Internet Protocol)

* UDP: message-oriented protocol, send data in chuncks (message bound visible), unreliable, fast (e.g. for live vedio streaming)
* TCP: connection-oriented protocol, slow, provide three abstractions
	* reliability
		* lost (sequence number and acknoledgement message)
		* duplicate transmission (sequence number)
		* corruption (check sum)
	* ordering (sequence number)
	* byte stream (message bound visible) (so receive message in while loop!)
		* to agree on the message size beforehand
		* use header message to send message size
		* sentinel to mark the end of message: e.g. C-string ends at \0 
			* bitstuffing: replace sentinels in message as \0 => \0\1 and actual sentinel as \0 => \0\0)
		* close connection to indicate end of message

### Distributed System

Why do we want distributed System?

* People interacting are distributed
* performance
* reliability/fault tolerance

Client/server is the most basic form of distributed system:  
server (sends response) <-> client (sends request)

**e.g.1 of server design (coke machine)**

```c++
/*------- Client side -------*/
client_produce() {
	send request to produce coke
	wait for response
}

client_consume() {
	send request to consume coke
	wait for response
}

server() { // this is a blocking server
	while() {
		receive request
		thread t(server_handle_request, request)
		// cost of creating thread is expensive
		// => have a worker thread pool
	}
}

/*------- Server side -------*/
server_handle_request(request) {
	lock.lock()
	if (request is product) {
		while (machine is full)
			cv1.wait(lock)
		put coke in machine
		signal cv2
	} else {
		while (machine is empty)
			cv2.wait(lock)
		take coke out of machine
		signal cv1
	}
	send response
}
```

**e.g.2 of server design (event driven programming)**

```c++
server() {
	if (request is produce) {
		asynchronously put coke in machine
		register a call back in machine
	} else {
		asynchronously take coke out of machine
		register a call back in machine
	}
}
```

**e.g.3 of server design** (RPC -- remote procedure call)  
user => client => client\_stub => server\_stub => server

```c++
/*------- Client stub -------*/
int client_produce(int n) {
	int status;
	send(sock, &n, sizeof(n));
	recv(sock, &status, sizeof(status));
	return status;
}

/*------- Server stub -------*/
void product_stub() {
	int n, status;
	recv(sock, &n, sizeof(n));
	status = server_produce(n);
	send(sock, &status, sizeof(status));
}
```

#### Ordering of distributed system
* To synchronize in distributed system, we use message to communicate rather than shared memory.
* Def of **happens before**: Event A happens before event B in a distributed system, iff A could have influenced B. 

**Lamports Rule of Ordering** (gives partial ordering)

1. All events in a single process/thread are totally ordered
2. Sending message happens before receiving a message
3. Transitivity applies

**Lamport timestamp** (gives total ordering that is consistent of partial ordering => ties can be broken by any mechanism)

1. Each thread has a numerical value that correspond to a logical clock. Each event in a single thread increases that value of clock. `Ci++`
2. Each send stores a value of the local clock `Ci` in the message (after increasing it)
3. Each receive event set the local clock `Cj = max{Cj + 1, Ci + 1}`

#### Distributed File System

##### Client side caching
* Put more work to the client
* How to keep consistency?
	* braodcast update protocol
	* invalidation protocol
		* three states of files: invalid, shared, exclusive
		* problems: large overhead, expensive if write extensive, low fault tolerance

##### Partition of work among multiple server
* Distribute volumes (subtrees of file system) over multiple server (usually with administrative boundary)
* Solution1: a central server as a database of server-volume table
* Solution2: consistent hashing (easy to insert and remove server)
	* hash v volumes
	* hash n servers
* But they do not solve the hotspot problem

##### Replication (for fault tolerance)
* Client, Primary, Backup
* If Primary fails, Backup becomes the Primary
* On recovery, copy updates back to the original Primary. Primary becomes Backup.
* Can also balance load on read requests

#### Fault Tolerance

##### Fail-stop failure
1. On failure, a node stops running
2. Everyone can detect the failure

* Solution: Primary-Backup Protocol
* Require f+1 nodes to tolerate f failures

##### Crash failure
1. On failure, a node stops running
2. Can not detect the failure

* Solution: Paxos Protocol
* Require 2f+1 nodes to tolerate f failures

##### Byzantine failure
* Safety: if agree, agree on the same value
* Liveness: eventually agree on something
* With three or less nodes, the solution is either unsafe or not live

* Solution: Byzantine Failure Tolerant Algorithm
	* Pre-prepare phase: commander sends messages to lieutenant
	* Prepare phase: lieutenants send messages to everyone
	* Commit phase: everyone send dicision to everyone
* Require 3f+1 nodes to tolerate f failures
* Failures have to be independent => expensive

##### Replicated State Machine
* Same starting state
* Same states and same deterministic transitions
