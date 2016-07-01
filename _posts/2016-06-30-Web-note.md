---
layout: post
title:  "Web Databases & Information Systems Note"
categories: note web html css javascript
---

# Everything you need to know about how the web works!

## Intro

### The request-reponse cycle

client: requests data  
server: responds to the request

* the client requests a web page
* the server reponds with an HTML file
* the client renders the HTML

Try this!
```bash
$ python -m SimpleHTTPServer
Serving HTTP on 0.0.0.0 port 8000 ...
```

### A Quick Start to Python/Flask

* Python/Flask is a library for dynamically creating web pages

```python
# hello.py
from flask import Flask app = Flask(__name__)
@app.route('/') def hello_world():
return 'Hello World!'
if __name__ == '__main__': app.run(debug=True)
```

Not, run it

```bash
$ python hello.py
* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

## Web Basics

### [Circuit-switched vs. Packet-switched](http://www.rfwireless-world.com/Terminology/circuit-switching-vs-packet-switching.html)
* Circuit-switched
	* Quality guaranteed
	* For applicaiton e.g. real-time vedio
* Packet-switched
	* For time-intensive application

