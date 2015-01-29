class Player
{
  int x,y;
  
  Player(int x, int y)
  {
    this.x=x;
    this.y=y;
  }
  
  void display()
  {
    fill(0,0,255);
    stroke(0,0,255);
    
    //X Axis Movement
    if(x<=width-gap && x>=0)
    {
      x += (R - L);
    }
    else if(x>width-gap)
    {
      x=width-gap;
    }
    else
    {
      x=0;
    }
    
    //Image based on player x/y
    image(ball,x,y,gap-20,gap-20);
  }
}

/* Player Controls & User I/O */
int L,R;

void keyPressed()
{
  //Controls
  if (keyCode == 65)//A
  {
    L=speed;
  }
  if (keyCode == 68)//D
  {
    R=speed;
  }
  
  //Reset Button - Add Score to table if user won
  if(key == '#')
  {
    if(difficulty==9 && win==1)
    {
      myScore.add9(initials,time);
    }
    if(difficulty==18 && win==1)
    {
      myScore.add18(initials,time);
    }
    
    setup();
  }
  
  //Main Menu Input -  Initials & High Scores
  if(state==0)
  {
    if (key == '\n')//String Entered, add to file I/O string
    {
      initials = typing;
      state=3;
    }
    else if(key == '*')//Access High Scores
    {
      state=4;
    }
    else if(key != '#')//Game Reset
    {
      typing = typing + key;
    }
  }
}

void keyReleased()
{
  //Controls
  if (keyCode == 65)//A
  {
    L=0;
  }
  if (keyCode == 68)//D
  {
    R=0;
  }
}
