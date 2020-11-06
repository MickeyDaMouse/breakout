void game()
{
  image(gif[f], 0,0,width,height);
  f++;
  if(f == n) f=0;
  
  //paddle
  fill(0,0,255);
  circle(px,height,pd);
  
  //ball
  fill(255);
  circle(bx,by,bd);
  
  //bricks
  int i=0;
  while(i<50)
  {
    if(alive[i]==true)
    {
      if(y[i]==150) fill(red);
      
      circle(x[i],y[i],brickd);
    
      if(dist(bx,by,x[i],y[i])<=bd/2 + brickd/2)
      {
        vx = (bx-x[i])/5;
        vy = (by-y[i])/5; 
        alive[i]=false;
      }
    
    }

    i++;
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
  }
  if(by<=bd/2 || by>=height-bd/2)
  {
    vy *= -1;
  }
  if(bx<bd/2)
    bx = bd/2;
  if(bx>width-bd/2)
    bx = width-bd/2;
  if(by < bd/2)
    by = bd/2;
  if(by > height-bd/2)
    by = height-bd/2;
    
  //bouncing
  if(dist(bx,by,px,height)<=bd/2 + pd/2)
  {
    vx = (bx-px)/15;
    vy = (by-py)/15;
    
  }
  
  

}

void gameClick()
{
  
}
