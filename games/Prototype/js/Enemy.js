

function enemyClass(){
	this.x = 100;
	this.y = 100;
	this.width = 64;
	this.height = 64;
	this.speedX = 4;
	this.speedY = 7;

	this.init = function(){

	}

	this.update = function(){
		var oldX = this.x;
		var oldY = this.y;

		if(this.x < 0){
			this.speedX *= -1;
		}
		if(this.x > canvas.width - this.width){
			this.speedX *= -1;
		}
		if(this.y < 0){
			this.speedY *= -1;
		}
		if(this.y > canvas.height - this.height){
			this.speedY *= -1;
		}

		if(checkCollision(this,player)){
			this.x = oldX;
			this.y = oldY;
			this.speedX *= -1;
			this.speedY *= -1;
		}

		this.x += this.speedX;
		this.y += this.speedY;



	}

	this.draw = function(){
		drawRect(this.x,this.y, this.width,this.height, 'white');
	}

	this.playerCollision = function(){
		if(this.x < player.x + PLAYER_WIDTH &&
			this.x + this.width > player.x &&
			this.y < player.y + PLAYER_HEIGHT &&
			this.y + this.height > player.y){

			this.speedX *= -1;
			this.speedY *= -1;
		}
	}
}
