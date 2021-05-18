<!DOCTYPE html>


<html lang="en">

<head>

<meta charset="UTF-8">

<title>Greedy Snake</title>

<style>

#map{

width: 400px;

height: 400px;

border: 1px solid black;

}

/*Map color*/

.divMap{

width: 18px;

height: 18px;

margin: 1px;

background-color: yellow;

float: left;

}

/*Snake body color*/

.divSnake{

width: 18px;

height: 18px;

margin: 1px;

background-color: red;

float: left;

}

/*Food color*/

.divFood{

width: 18px;

height: 18px;

margin: 1px;

background-color: green;

float: left;

}

</style>

<script>

var mapX=20;

var mapY=20; //Map border, horizontal and vertical div cells

var arrMap=new Array();//Map array

var snackeX = [4,5,6,7],snackeY=[2,2,2,2];//The initial coordinate value of the snake body

var foodX,foodY; //Create food coordinates

var keyCode = 39;//The direction of the snake body movement, default to the right



//Create a map

function createMap() {

//Get the map frame div

var map=document.getElementById("map");

//The map creates small div grids, 20 vertical and horizontal

for(y=0;y<mapY;y++)

{

arrMap[y]= new Array();

for(x=0;x<mapX;x++)

{

//div small grid

var div =document.createElement("div");

div.className="divMap";//Initialization style

arrMap[y][x]=div;//Put the div grid into the map array

map.appendChild(div);//Page drawing

}

}

}



//Create snake body

function createSnack(){

//Change the background color of a series of continuous divs in the map

for(i=0;i<snackeX.length;i++)

{

arrMap[snackeY[i]][snackeX[i]].className ="divSnake";

}

}

//Clear the snake body

function clearSnack() {

for(i=0;i<snackeX.length;i++)

{

arrMap[snackeY[i]][snackeX[i]].className="divMap";

}

}

//Create food

function createFood()

{

//arrMap[foodY][foodX].className="divFood";

var result;//Determine whether to regenerate food

do {

result = false;//No overlap by default

//Random food coordinates

foodX=parseInt(Math.random()*mapX);

foodY=parseInt(Math.random()*mapY);



//Judging that food cannot appear on the snake

for(i=0;i>snackeX.length;i++) {

if(snackeX[1]==foodX&&snackeY[1]==foodY)

{

result = true;//Need to regenerate

break;

}

}



}while(result);

arrMap[foodY][foodX].className="divFood";

}

//Snake body movement

//1. Clear the snake body

//2. Move the snake body coordinates, increase the snake head, and clear the snake tail by one grid

function snackMove() {

//Clear the snake body

clearSnack();

for (i = 0; i < snackeX.length - 1; i++) {

snackeX[i] = snackeX[i + 1];

snackeY[i] = snackeY[i + 1];

}

//Every move, the snake head increases by one grid, keyCode matches keyboard

switch (keyCode) {

case 37://Left

snackeX[snackeX.length - 1]--;

break;

case 38://Upward

snackeY[snackeY.length - 1]--;

break;

case 39://To the right 

snackeX[snackeX.length - 1]++;

break;

case 40://Down

snackeY[snackeY.length - 1]++;

break;



}

//Eat food

if (snackeX[snackeX.length - 1] == foodX && snackeY[snackeY.length - 1] == foodY)

{

//Eat food

snackeX[snackeX.length]=snackeX[snackeX.length-1];

snackeY[snackeY.length]=snackeY[snackeY.length-1];

// Rearrange the snake body

for(i=snackeX.length-1;i>0;i--)

{

snackeX[i]=snackeX[i-1];

snackeY[i]=snackeY[i-1];

}

createFood();//Regenerate the next food

}

// beyond the game border

if(snackeX[snackeX.length-1]<0

|| snackeX[snackeX.length-1]>mapX-1

|| snackeY[snackeY.length-1]<0

|| snackeY[snackeY.length-1]>mapY-1)

{

clearInterval(move);//Stop moving

alert("game over");

return ;

}



createSnack();//Recreate the snake body

}

//Keyboard events

function keyDown(){

var newKey = event.keyCode//Keyboard keys

if(keyCode == 37 && newKey == 39||

keyCode == 39 && newKey == 37||

keyCode == 38 && newKey == 40||

keyCode == 40 && newKey == 38

) {

//No U-turn

return ;

} else if(newKey>=37&&newKey<=40){

//The user pressed a direction key

keyCode=newKey;

}

else{

//Other keys

}

}

//run

window.onload =function () {

createMap(); //Create a map

createSnack();//Create snake body

createFood();//Create food



move= setInterval("snackMove()",200)//The snake body moves

document.onkeydown = keyDown;//Get the arrow keys

}

</script>

</head>

<body>

<div id="map"></div>

</body>

</html>
