void gameover()
{
  fill(255,128,0);
  textSize(50);
  text("click to reset",width/2,height-50);
  textSize(200);
  if(win)
  {
    text("Victory!",width/2,height/2);
    victory.play();
  }
  else
  {
    text("You Lost",width/2,height/2);
    loose.play();
  }
}

void gameoverClick()
{
  mode =  INTRO;
  intro.rewind();
  int  i=0;
  while(i<50)
  {
    alive[i]=true;
    i++;
  }
  score = 0;
  lives = 3;
  px = width/2;
  py = height;
  vx = random(-5,5);
  vy = random(-5,5);
  bx = width/2;
  by = 600;
  win = true;
  
}
