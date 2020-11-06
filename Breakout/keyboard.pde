void keyPressed()
{
  if(key == 'a' || keyCode == LEFT) left = true;
  if(key == 'd' || keyCode == RIGHT) right= true;
}

void keyReleased()
{
  left = false;
  right = false;
  
}
