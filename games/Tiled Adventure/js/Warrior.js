const GROUNDSPEED_DECAY_MULT = 0.94;
const DRIVE_POWER = 0.5;
const REVERSE_POWER = 0.2;
const TURN_RATE = 0.06;
const MIN_SPEED_TO_TURN = 0.5;
const PLAYER_MOVE_SPEED = 3.0;

function warriorClass(){

	this.x = 75;
	this.y = 75;
	this.ang = 0;
	this.speed = 0;
	this.myWarriorPic; //which picture to use
	this.myName = "Untitled Warrior" ;

	this.keyHeld_Gas = false;
	this.keyHeld_Reverse = false;
	this.keyHeld_TurnLeft = false;
	this.keyHeld_TurnRight = false;

	this.controlKeyUp;
	this.controlKeyRight;
	this.controlKeyDown;
	this.controlKeyLeft;

	this.keys = 0;

	this.setupInput = function(upKey, rightKey, downKey, leftKey){
		this.controlKeyUp = upKey;
		this.controlKeyRight = rightKey;
		this.controlKeyDown = downKey;
		this.controlKeyLeft = leftKey;
	}
	

	this.reset = function(whichImage, warriorName){
		this.myName = warriorName;
		this.myWarriorPic = whichImage;
		this.speed = 0;

		for (var eachRow = 0; eachRow < WORLD_ROWS; eachRow++) {
			for (var eachCol = 0; eachCol < WORLD_COLS; eachCol++) {

				var arrayIndex = WORLD_COLS * eachRow + eachCol;

				if(worldGrid[arrayIndex] == WORLD_PLAYERSTART){
					worldGrid[arrayIndex] = WORLD_ROAD;
					//this.ang = -Math.PI/2;
					this.x = eachCol * WORLD_W + WORLD_W/2;
					this.y = eachRow * WORLD_H + WORLD_H/2;
					return;
				}
			}
		}
		console.log("NO PLAYER START FOUND!");
	}

	this.move = function(){
		//this.speed *= GROUNDSPEED_DECAY_MULT;
		var nextX = this.x;
		var nextY = this.y;

		if(this.keyHeld_Gas){
			nextY -= PLAYER_MOVE_SPEED;
		}
		if(this.keyHeld_Reverse){
			nextY += PLAYER_MOVE_SPEED;
		}
		if(this.keyHeld_TurnLeft){
			nextX -= PLAYER_MOVE_SPEED;
		}
		if(this.keyHeld_TurnRight){
			nextX += PLAYER_MOVE_SPEED;
		}

		var currentTileName = warriorWorldHandling(nextX,nextY);

		if(currentTileName == WORLD_GOAL){
			console.log(this.myName + " WINS!");
			loadLevel(levelOne);

		}
		if(currentTileName == WORLD_ROAD){

			this.x = nextX;
			this.y = nextY;
		}
		if(currentTileName == WORLD_FLAG){
			console.log("HIT DOOR!");
			if(this.keys > 0){
				this.keys--;
				this.x = nextX;
				this.y = nextY;
				worldGrid[pixelCordToRowCol(this.x,this.y)] = WORLD_ROAD;
			} else{
				return;
			}
		}
		if(currentTileName == WORLD_TREE){
			this.keys++;
			this.x = nextX;
			this.y = nextY;
			worldGrid[pixelCordToRowCol(this.x,this.y)] = WORLD_ROAD;
		}
	}

	this.draw = function(){
		drawBitMapCenteredWithRotation(this.myWarriorPic, this.x,this.y, this.ang);
	}
}