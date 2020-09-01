const FPS = 60;
const ANIMATION_DELAY = 5;

var canvas;
var canvasContext;

var player;
var enemy;
var coin;

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

	coin = new coinClass();
	coin.initCoin();

	console.log("Game Initialized");
}

function update(timeStamp){
	player.update();
	enemy.update();
	//coin.update();
	draw();
}

function draw(){
	cls();
	player.draw();
	enemy.draw();
	coin.draw();
}
