---
layout: default
title: Home
navigation_weight: 1
---

# Home

<p id="greeting"></p>

<script>
// Constructor of Greeting
function Greeting(morning, afternoon, evening, night) {
	this.morning = morning;
	this.afternoon = afternoon;
	this.evening = evening;
	this.night = night;
}

// Declaration of Greetings
var zh = new Greeting(
	"早上好！",
	"下午好！",
	"晚上好！",
	"夜猫子你好。熬夜伤身，早点睡哦。");
var en = new Greeting(
	"Good morning!",
	"Good afternoon!",
	"Good evening!",
	"Hello, night owl!");
var ja = new Greeting(
	"おはようございます！爽やかな朝ですね。朝ごはんは、ちゃんと食べましたか？",
	"こんにちは、もう午後ですね。^ ^　",
	"こんばんは、今日も一日お疲れ様です。",
	"こんにちは。夜更かしは健康に良くないので、お早目に寝てくださいね。");
var fr = new Greeting(
	"Bonjour!",
	"Bonjour!",
	"Bonsoir!",
	"Bonjour!");
var de = new Greeting(
	"Guten morgen!",
	"Guten tag!",
	"Guten abend!",
	"Guten tag!");
var es = new Greeting(
	"¡Buenos días!",
	"¡Buenas tardes!",
	"¡Buenas noches!",
	"¡Hola!");

// Set the greeting language according to the visitor's location
var xmlhttp = new XMLHttpRequest();
xmlhttp.open('GET', 'http://freegeoip.net/json/', true);
xmlhttp.send();
xmlhttp.onload = function(result) {
	var obj = JSON.parse(result.currentTarget.response);
	console.log(obj.country_code);
	switch(obj.country_code) {
	case "CN":
		greeting = zh;
		break;
	case "JP":
		greeting = ja;
		break;
	case "FR":
		greeting = fr;
		break;
	case "DE":
		greeting = de;
		break;
	case "MX":
	case "ES":
		greeting = es;
		break;
	default:
		greeting = en;
		break;
	}

	// Set the greeting according to the visitor's time
	var time = new Date().getHours();
	var display;
	if (time >= 5 && time < 12) {
		display = greeting.morning;
	} else if (time >= 12 && time < 18) {
		display = greeting.afternoon;
	} else if (time >= 18 && time <= 23) {
		display = greeting.evening;
	} else {
		display = greeting.night;
	}
	document.getElementById("greeting").innerHTML = display;
};

</script>

My name is Qinye Li /\*pronounced Chin-yeah\*/, but `alias Qinye="Sindy"` if that is easier to remember. I am now a Software Engineer @ Google.
I graduated with a bachelor degree in CS from University of Michigan and a bachelor degree in ECE from Shanghai Jiao Tong University.

I speak Chinese, Japanese, English, and a little little little bit of French. Oh, I mean `C/C++` is my mother-tongue, but I also speak `Java`, `Python`, `Go` and `C#` (but not `.net`).

---

I am into building games these days, and I would really like to invite you to check out my games!

A 2D platforming puzzle game originally developed for my capstone class --> [GuruGuru](/GuruGuru/)

A little 2D platformer developed for [Yifan](https://github.com/haoyifan)'s birthday. --> [Evan's Adventure](/evan_adventure/)

You want to know the secret? It always hides in the `Shift` ; )
Feel free to send me any feedback at `qinyeli` `@` `umich.edu`

Cheers.

<!--I like programming, becuase it makes me peaceful yet excited, desperate yet hopeful. It is sometimes frustrating, but I enjoy the process of being frustrated so much that I cannot give up.-->


<BR>&nbsp;<BR> 
