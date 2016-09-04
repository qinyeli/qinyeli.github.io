---
layout: default
title: Home
navigation_weight: 1
---

# Home

<p id="greeting">lll</p>

<script>
var time = new Date().getHours();

if (time >= 5 && time < 12) {
	document.getElementById("greeting").innerHTML = "Good morning!";
} else if (time >= 12 && time < 17) {
	document.getElementById("greeting").innerHTML = "Good afternoon!";
} else if (time >= 17 && time <= 23) {
	document.getElementById("greeting").innerHTML = "Good evening!";
} else {
	document.getElementById("greeting").innerHTML = "Hello night owl.";
}

document.getElementById("greeting").innerHTML += " This is Qinye Li (pronounced Chin-yeah Lee).";
</script>

I am a senior student studying computer science at the University of Michigan.

<BR>&nbsp;<BR> 