import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//sounds
Minim minim;
AudioPlayer intro,point,live,bounce,victory,loose;

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
color green = #00FF00;

//font
PFont block;

//"paddle"
int px,py,pd;

//ball
float vx,vy;
int bx,by,bd;

//lives/score
int lives = 3;
int score = 0;

//movement of paddle
boolean left;
boolean right;

//Arrays
int[] x;
int[] y;
int brickd;
boolean[] alive;

boolean blockleft = true;

//gif
PImage[] gif;
int n;
int f;

//win
boolean win = true;

void setup()
{
  size(1200,800,P2D);
  
  block = createFont("blocked.ttf",50);
  textFont(block);
  textAlign(CENTER,CENTER);
  
  mode = INTRO;
  
  //sounds
  minim = new Minim(this);
  point = minim.loadFile("coin.wav");
  intro = minim.loadFile("intro.wav");
  bounce = minim.loadFile("Bounce.wav");
  victory = minim.loadFile("clapping.wav");
  loose = minim.loadFile("failure.wav");
  live = minim.loadFile("wrong.wav");

  
  //initializing paddle position
  px = width/2;
  py = height;
  pd = 300;
  
  //initializing ball
  vx = random(-5,5);
  vy = random(-5,5);
  if(vy<1&&vy>-1) vy = 1;
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
