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
xmlhttp.open('GET', 'http://api.ipstack.com/check?access_key=3ff441fa55eadf2af90848b0ee2fa4b7', true);
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

My name is Qinye Li  `/*pronounced Chin-yeah*/`. I also go by the alias Sindy, which I "strongly" prefer over getting called Kin-Yee. I graduated from the University of Michigan and Shanghai Jiao Tong University and I am currently a software engineer @ Google.

I am recently into classical guitar, doodling with adobe illustrator (check out the [WeChat sticker](https://sticker.weixin.qq.com/cgi-bin/mmemoticon-bin/emoticonview?oper=single&t=shop/detail&productid=aL2PCfwK/89qO7sF6/+I+UDhfwEjhec2ZNvdnLLJRd/MDUss2D8iOYodg8M6Px++vgxzL/nUagZfRWxD++0BMEoYRDc/Q7pgzu7325y0IDuo=) I created 🤗), writing [Japanese songs](https://www.youtube.com/watch?v=icDdfQUT7e0&feature=youtu.be), music theory, psychology, French101, linguistics, checking off my [bucket list](https://github.com/qinyeli/bucket_list), and probably other random stuff by the time you read this.

I am a 30% geek, and I hack sometimes. If you happen to like platformer games, which I would arrogantly assume that you do 😉, check out this 2D platforming puzzle game, [GuruGuru](/GuruGuru/), which was originally developed for my capstone class, and this little dummy 2D platformer I developed for a friend's birthday [Evan's Adventure](/evan_adventure/)!

Cheers.