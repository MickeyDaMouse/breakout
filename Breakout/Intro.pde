void intro()
{

  intro.play();
  image(gif[f], 0,0,width,height);
  f++;
  if(f == n) f=0;
  
  fill(255,0,0);
  textSize(150);
  text("BREAKOUT!",width/2,height/2);
  textSize(40);
  text("Click to Start",width/2,height-200);
}

void introClick()
{
  mode = GAME;
}
