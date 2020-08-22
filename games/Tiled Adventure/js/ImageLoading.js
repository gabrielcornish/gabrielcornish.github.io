var worldPics = [];

var warriorPic = document.createElement("img");
var otherWarriorPic = document.createElement('img');


var numberOfPicsToLoad = 0;

function countLoadedImagesAndLaunchIfReady(){
	numberOfPicsToLoad--;
	// console.log(picsToLoad);
	if(numberOfPicsToLoad == 0){
		imageLoadingDoneSoStartGame();
	}
}

function beginLoadingImage(imgVar, fileName){
	imgVar.onload = countLoadedImagesAndLaunchIfReady();
	imgVar.src = 'images/'+fileName;
}

function loadImages(){
	var imageList = [
		{varName: warriorPic, theFile: 'warrior.png'},
		{varName: otherWarriorPic, theFile: 'player2car.png'},

		{worldType: WORLD_ROAD, theFile: 'world_road.png'},
		{worldType: WORLD_WALL, theFile: 'world_wall.png'},
		{worldType: WORLD_TREE, theFile: 'world_tree.png'},
		{worldType: WORLD_GOAL, theFile: 'world_goal.png'},
		{worldType: WORLD_FLAG, theFile: 'world_flag.png'}
		];

	numberOfPicsToLoad = imageList.length;

	for (var i = 0; i < imageList.length; i++) {
		if(imageList[i].varName != undefined){
			beginLoadingImage(imageList[i].varName, imageList[i].theFile);
		} else{
			loadImageForWorldCode(imageList[i].worldType, imageList[i].theFile);
		}	
	}
}

function loadImageForWorldCode(worldCode, fileName){
	worldPics[worldCode] = document.createElement('img');
	beginLoadingImage(worldPics[worldCode],fileName);
}
