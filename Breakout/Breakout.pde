
//modes
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//colours
color red = #FF0000;
color pink = #FF00FF;
color blue = #0000FF;
color cyan = #00FFFF;

//"paddle"
int px,py,pd;

//ball
float vx,vy;
int bx,by,bd;

//movement of paddle
boolean left;
boolean right;

//Arrays
int[] x;
int[] y;
int brickd;
boolean[] alive;

//gif
PImage[] gif;
int n;
int f;

void setup()
{
  size(1200,800,FX2D);
  
  mode = GAME;
  
  //initializing paddle position
  px = width/2;
  py = height;
  pd = 300;
  
  //initializing ball
  vx = random(-5,5);
  vy = random(-5,5);
  bx = width/2;
  by = 600;
  bd = 20;
  
  //arrays
  x = new int[50];
  y = new int[50];
  brickd = 75;
  alive = new boolean[50];
  
  int posx = 173;
  int posy = 150;
  int i=0;
  while(i<50)
  {
    x[i] = posx;
    y[i] = posy;
    posx += 95;
    if(posx == 1123)
    {
      posx = 173;
      posy += 100;
    }
    alive[i]=true;
    i++;
  }
  
  //gif
  n = 30;
  gif = new PImage[n];
  i=0;
  while(i<n)
  {
    gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
    i++;
  }
}

void draw()
{ 
  if(mode == INTRO)
  {
    intro();
  }
  else if(mode == GAME)
  {
    game();
  }
  else if(mode == PAUSE)
  {
    pause();
  }
  else if(mode == GAMEOVER)
  {
    gameover();
  }
}
