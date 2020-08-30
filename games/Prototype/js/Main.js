const FPS = 60;

var canvas;
var canvasContext;

var enemy;

window.onload = function(){
	init();

	setInterval(update,1000/FPS);
}

function init(){
	canvas = document.getElementById('gameCanvas');
	canvasContext = canvas.getContext('2d');

	initInput();

	player = new playerClass();
	player.initPlayer();

	enemy = new enemyClass();

	console.log("Game Initialized");
}

function update(timeStamp){
	player.update();
	enemy.update();
	draw();
}

function draw(){
	cls();
	player.draw();
	enemy.draw();
}