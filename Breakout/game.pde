void game()
{
  image(gif[f], 0,0,width,height);
  f++;
  if(f == n) f=0;
  
  //lives and score
  textSize(40);
  fill(255,255,0);
  text("score: "+score,150,50);
  text("lives:"+lives,width-150,50);
  
  //paddle
  fill(0,0,255);
  circle(px,height,pd);
  
  //ball
  fill(255);
  circle(bx,by,bd);
  
  //bricks
  int i=0;
  blockleft = false;
  while(i<50)
  {
    if(alive[i]==true)
    {
      blockleft = true;
      if(y[i]==150) fill(red);
      if(y[i]==250) fill(pink);
      if(y[i]==350) fill(blue);
      if(y[i]==450) fill(cyan);
      if(y[i]==550) fill(green);
      
      circle(x[i],y[i],brickd);
    
      if(dist(bx,by,x[i],y[i])<=bd/2 + brickd/2)
      {
        vx = (bx-x[i])/5;
        vy = (by-y[i])/5; 
        if(vy<1&&vy>-1) vy = 1;
        
        point.rewind();
        point.play();
        score++;
        alive[i]=false;
      }
    
    }

    i++;
  }
  if(blockleft == false) 
  {
    mode=GAMEOVER;
    victory.rewind();
    loose.rewind();
  }
  
  //moving
  if(px >= 0+pd/2 && px <= width - pd/2)
  {
    if(left)
    {
      px -= 8;
      if(px<pd/2)
      {
        px = pd/2; 
      }
    }
    if(right)
    {
      px += 8;
      if(px>width-pd/2)
      {
        px = width-pd/2;
      }
    }
  }
  
  //moving ball
  bx += vx;
  by += vy;
  if(bx>width-bd/2 || bx<bd/2)
  {
    vx*= -1;
    bounce.rewind();
    bounce.play();
  }
  if(by<=bd/2)
  {
    vy *= -1;
    bounce.rewind();
    bounce.play();    
  }
  if(by>height+bd)
  {
    live.rewind();
    live.play();
    lives--;
    vx = random(-5,5);
    vy = random(-5,5);
    if(vy<1&&vy>-1) vy = 1;
    bx = width/2;
    by = 600;
    if(lives == 0)
    {
      win = false;
      victory.rewind();
      loose.rewind();
      mode = GAMEOVER;
    }
  }
  if(bx<bd/2)
    bx = bd/2;
  if(bx>width-bd/2)
    bx = width-bd/2;
  if(by < bd/2)
    by = bd/2;

    
  //bouncing
  if(dist(bx,by,px,height)<=bd/2 + pd/2)
  {
    vx = (bx-px)/15;
    vy = (by-py)/15;
    if(vy<1&&vy>-1) vy = 1;
    bounce.rewind();
    bounce.play();
  }
  
  

}

void gameClick()
{
  mode = PAUSE;
}
