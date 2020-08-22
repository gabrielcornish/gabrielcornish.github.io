const WORLD_W = 50;
const WORLD_H = 50;
const WORLD_COLS = 16;
const WORLD_ROWS = 12;
const WORLD_GAP = 2;
var levelOne = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 5, 0, 1, 1, 1, 1,
				 1, 0, 4, 0, 4, 0, 1, 0, 2, 0, 1, 0, 1, 4, 4, 1,
				 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 5, 1, 5, 1, 1,
				 1, 1, 1, 5, 1, 1, 1, 0, 4, 0, 1, 0, 0, 0, 1, 1,
				 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 4, 0, 1, 1,
				 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1,
				 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 4, 0, 1, 1,
				 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1,
				 1, 0, 5, 0, 5, 0, 5, 0, 3, 0, 1, 1, 1, 1, 1, 1,
				 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1,
				 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var worldGrid = [];

const WORLD_ROAD = 0;
const WORLD_WALL = 1;
const WORLD_PLAYERSTART = 2;
const WORLD_GOAL = 3;
const WORLD_TREE = 4;
const WORLD_FLAG = 5;


function returnTileTypeAtColRow(col, row){
	if(col >= 0 && col < WORLD_COLS &&
		row >= 0 && row < WORLD_ROWS){

		var worldIndexUnderCoord = rowColToArrayIndex(col, row);

		return worldGrid[worldIndexUnderCoord];
	} else{
		return WORLD_WALL;
	}
}

function warriorWorldHandling(atX,atY){
	var warriorWorldCol = Math.floor(atX / WORLD_W);
	var warriorWorldRow = Math.floor(atY / WORLD_H);
	var worldIndexUnderWarrior = rowColToArrayIndex(warriorWorldCol, warriorWorldRow);

	if(warriorWorldCol >= 0 && warriorWorldCol < WORLD_COLS && warriorWorldRow >= 0 && warriorWorldRow < WORLD_ROWS){
		//console.log(returnTileTypeAtColRow( warriorWorldCol,warriorWorldRow ));
		return returnTileTypeAtColRow( warriorWorldCol,warriorWorldRow );
	} 
}

function pixelCordToRowCol(atX,atY){
	var warriorWorldCol = Math.floor(atX / WORLD_W);
	var warriorWorldRow = Math.floor(atY / WORLD_H);
	return rowColToArrayIndex(warriorWorldCol, warriorWorldRow);
}

function rowColToArrayIndex(col, row){
	return col + WORLD_COLS * row;
}

function drawWorld(){
	var arrayIndex = 0;
	var drawTileX = 0;
	var drawTileY = 0;
	for (var eachRow = 0; eachRow < WORLD_ROWS; eachRow++) {
		for (var eachCol = 0; eachCol < WORLD_COLS; eachCol++) {

			//WORLD_COLS * eachRow + eachCol
			var tileKindHere = worldGrid[arrayIndex];
			
			var useImg = worldPics[tileKindHere];
			if(tileTypeHasTransparency(tileKindHere)){
				canvasContext.drawImage(worldPics[WORLD_ROAD], drawTileX,drawTileY);
			}

			canvasContext.drawImage(useImg, drawTileX,drawTileY);
			drawTileX += WORLD_W;
			arrayIndex++;
		}
		drawTileX = 0;
		drawTileY += WORLD_H;
	}	
}

function tileTypeHasTransparency(tileToCheck){
	if(tileToCheck == WORLD_GOAL || tileToCheck == WORLD_TREE || tileToCheck == WORLD_FLAG){
		return true;
	} else {
		return false;
	}
}

function getTileTypeAtPixelCord(atX,atY){
	var warriorWorldCol
}