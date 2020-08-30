const PLAYER_WIDTH = 16;
const PLAYER_HEIGHT = 16;
const ANIMATION_DELAY = 5;

var player;

function playerClass(){
	//Player Variables
	this.x = 320;
	this.y = 256;
	this.speed = 5;

	// Animation Variables
	this.sprite = new Image();
	this.animColumns = 4;
	this.animRows = 1;
	this.frameWidth;
	this.frameHeight;
	this.currentFrame = 0;
	this.animationFrameDelay = ANIMATION_DELAY;
	this.flipped = true;

	this.initPlayer = function(){
		console.log(this.x+"/"+this.y);
		this.sprite.src = 'images/player_idle.png';
		this.frameWidth = this.sprite.width / this.animColumns;
		this.frameHeight = this.sprite.height / this.animRows;
	}

	this.update = function(){
		//console.log(this.x+"/"+this.y);
		if(moveRight){
			if(this.x < canvas.width - PLAYER_WIDTH){
				this.x += (this.speed);
			}
		}
		if(moveLeft){
			if(this.x > 0){
				this.x -= (this.speed);
			}
		}
		if(moveUp){
			if(this.y > 0){
				this.y -= (this.speed);
			}
		}
		if(moveDown){
			if(this.y < canvas.height-PLAYER_HEIGHT){
				this.y += (this.speed);
			}
		}
	}

	this.draw = function(){
		//drawRect(this.x,this.y, this.sprite.width,this.sprite.height, 'white');
		animate(this);
	}
}