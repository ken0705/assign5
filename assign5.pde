final int COUNT = 5;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState;
PImage hp;
PImage treasure;
PImage fighter;
PImage bg1;
PImage bg2;
PImage start1 ;
PImage start2 ;
PImage end1 ;
PImage end2 ;
PImage shoot ;
int a ;
int b ;
int b2 ;
int b3 ;
int c ;
int d ;
int e ;
int f ;
int g ;
int h ;
int k ;
int j ;
int l ;
int m ;
int x = 550;
int y = 240;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean[] e1 =new boolean [5];
boolean[] e2 =new boolean [5];
boolean[] e3 =new boolean [8];
int[][] enemy1= new int[5][2];
int[][] enemy2= new int[5][2];
int[][] enemy3= new int[8][2];
PImage [] images =new PImage [5];
int sx[]=new int[5];
int sy[]=new int[5];


PImage enemy;
int enemyCount = 8;

int[] enemyX = new int[enemyCount];
int[] enemyY = new int[enemyCount];

void setup () {
	size(640, 480) ;
  m=0;
  a=0 ;
  b=0 ;
  b2=0;
  b3=0;
  g=40;
  c=floor(random(0,600));
  d=floor(random(0,440));
  e=floor(random(0,420));
  f=floor(random(0,440));
  h=floor(random(0,420));
  k=floor(random(0,120));
  j=floor(random(0,120));
  l=0;
  fill(255,0,0);
  rect(10,10,g,31);
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png"); 
  shoot=loadImage("img/shoot.png");
  treasure=loadImage("img/treasure.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");  
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  for (int i=0; i<5; i++){
    images[i] = loadImage("img/flame" + (i+1) + ".png");
  }
  frameRate(1000);
	enemy = loadImage("img/enemy.png");
	addEnemy(0);
}

void draw()
{
  image(start2,0,0);
    switch (gameState){
    case GAME_START:
  if(mouseX>210 && mouseX<440 && mouseY>380 && mouseY<410){
    if(mousePressed){
          gameState = GAME_RUN;
    }else{
      image(start1,0,0);
    }
  }
    break ;
    case GAME_RUN:
    image(bg1,a-640,0);
  image(bg2,a,0);  
  image(bg1,a+640,0);
  image(bg2,a-1280,0);
  fill(255,0,0);
  rect(15,10,g,31);
  image(hp,10,10);
  image(treasure,c,d);
  image(fighter,x,y);
	background(0);
	for (int i = 0; i < enemyCount; ++i) {
		if (enemyX[i] != -1 || enemyY[i] != -1) {
			image(enemy, enemyX[i], enemyY[i]);
			enemyX[i]+=5;
		
}
a += 1 ;
  a %= 1280 ;
  b+=4;
}}
}

// 0 - straight, 1-slope, 2-dimond
void addEnemy(int type)
{	
	for (int i = 0; i < enemyCount; ++i) {
		enemyX[i] = -1;
		enemyY[i] = -1;
	}
	switch (type) {
		case 0:
			addStraightEnemy();
	if(x>640){
  type=1;
}	
        	break;
		case 1:
			addSlopeEnemy();
  if(x>640){
  type=2;
}		
	break;
		case 2:
			addDiamondEnemy();
  if(x>640){
  type=0;
}	
		break;
	}
}

void addStraightEnemy()
{
	float t = random(height - enemy.height);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {

		enemyX[i] = (i+1)*-80;
		enemyY[i] = h;
	}
}
void addSlopeEnemy()
{
	float t = random(height - enemy.height * 5);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {

		enemyX[i] = (i+1)*-80;
		enemyY[i] = h + i * 40;
	}
}
void addDiamondEnemy()
{
	float t = random( enemy.height * 3 ,height - enemy.height * 3);
	int h = int(t);
	int x_axis = 1;
	for (int i = 0; i < 8; ++i) {
		if (i == 0 || i == 7) {
			enemyX[i] = x_axis*-80;
			enemyY[i] = h;
			x_axis++;
		}
		else if (i == 1 || i == 5){
			enemyX[i] = x_axis*-80;
			enemyY[i] = h + 1 * 40;
			enemyX[i+1] = x_axis*-80;
			enemyY[i+1] = h - 1 * 40;
			i++;
			x_axis++;
			
		}
		else {
			enemyX[i] = x_axis*-80;
			enemyY[i] = h + 2 * 40;
			enemyX[i+1] = x_axis*-80;
			enemyY[i+1] = h - 2 * 40;
			i++;
			x_axis++;
		}
	}
}
