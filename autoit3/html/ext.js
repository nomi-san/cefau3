var app = {};

app.back = function() {
	native function back();
	back();
};

app.forward = function() {
	native function forward();
	forward();
};

app.reload = function() {
	native function reload();
	reload();
};

app.home = function() {
	native function home();
	home();
};

app.load = function(url) {
	native function load(url);
	load(url);
};