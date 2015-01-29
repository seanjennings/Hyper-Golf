int rows=11,cols=10,gap,speed,lives,score,state,difficulty,win,saws;
String typing,initials;
float start_time,time;
PImage grass, flag, ball, tree, saw;
PFont pixel,space,golf;

Player myPlayer;
Course myCourse;
Screen myScreen;
Score myScore;

void setup()
{
  size(560,560);
  gap=width/cols;
  speed=2;
  lives=3;
  score=0;
  state=0;
  time=0;
  win=0;
  saws=0;
  
  start_time=millis();
  typing="";
  initials="";
  
  myScore = new Score();
  myScreen = new Screen();
  myCourse = new Course();
  myPlayer = new Player((width/2)-(gap/2),(height-gap-20));
  
  //Loading Sprite Data
  grass = loadImage("grass.png");
  flag = loadImage("flag.png");
  ball = loadImage("ball.png");
  tree = loadImage("tree.png");
  saw = loadImage("saw.png");
}

void draw()
{
  //Splash Screen
  if(state==0)
  {
    background(grass);
    myScreen.splash();
  }
  
  //High Scores
  if(state==4)
  {
    background(grass);
    myScreen.high_scores();
  }
  
  //Difficulty Choice
  if(state==3)
  {
    background(grass);
    myScreen.difficulty();
  }
  
  //Running Game
  if(state==1)
  {
    timeAndSpeed();
    background(grass);
    
    myCourse.display();
    myCourse.hit_detect();
    myCourse.score_lives();
    
    myPlayer.display();
  }
  
  //End game screen
  if(state==2)
  {
    background(grass);
    myScreen.game_over();
  }    
}    

//Game Timer and Game Speed handling
void timeAndSpeed()
{
  time=(millis()-start_time)/1000;
  if(difficulty==18)
  {
    if(time%20<0.025)
    {
      speed+=2;
    }
  }
  else
  {
    if(time%8<0.025)
    {
          speed+=2;
    }
  }
}


