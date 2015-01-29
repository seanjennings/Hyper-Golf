class Screen
{
  
  void splash()
  {
    //font loading
    PFont golf;
    golf = createFont("ck-sports-golf.ttf",200);
    PFont space;
    space = createFont("space.ttf",50);
    textFont(golf);
    textAlign(CENTER);
    fill(255);
    //Game Title
    text("GOLF", width/2, 200);
    
    textFont(space);
    text("HYPER", 150, 40);
    
    //User Input of Initials
    textFont(golf);
    textSize(40);
    fill(0,255,0);
    text("ENTER YOUR INITIALS", width/2,height/2);
    
    textSize(60);
    typing = typing.toUpperCase();//Capitilize User Unput
    text(""+typing,width/2,height/2+100);
    
    textSize(30);
    fill(255);
    text("PRESS ENTER TO CONTINUE", width/2,height/2+200);
    fill(255,255,0);
    text("PRESS * FOR HIGH SCORES", width/2,height/2+250);
  }
  
  void game_over()
  {
    PFont golf;
    golf = createFont("ck-sports-golf.ttf",80);
    textFont(golf);
    textAlign(CENTER);
    fill(255);
    textLeading(100);
    
    if(score==difficulty)
    {
      text("YOU WIN", width/2, 100);
      win=1;
    }
    else
    {
      text("GAME OVER", width/2, 100);
    }
    
    fill(0,255,0);
    textSize(50);
    text("SCORE: "+score, width/2, 200);
    
    fill(0,255,255);
    textSize(50);
    text("TIME: "+time, width/2, 280);
    
    textSize(35);
    fill(255);
    text("PRESS \n# \nTO \nRESTART", width/2, 370);
  }
  
  void difficulty()
  {
    PFont golf;
    golf = createFont("ck-sports-golf.ttf",80);
    textFont(golf);
    textAlign(CENTER);
    fill(255);
    textLeading(100);
    text("CHOOSE \nDIFFICULTY", width/2, 100);
    textAlign(RIGHT);
    textSize(50);
    strokeWeight(8);
    stroke(255);
    
    //Difficulty Buttons
    if (mouseX > x1 && mouseX < x1 + bWidth && mouseY > y1 && mouseY < y1 + bHeight)
    {
      fill(0,255,0,50);
    }
    else 
    {
      fill(0,0,255,0);
    }
    rect(x1,y1,bWidth,bHeight);
    
    //Button Label
    fill(255);
    text("9 HOLES",x1+bWidth-100,y1+70);
    image(flag, x1+bWidth-75,y1+20,gap,gap);
    
    if (mouseX > x2 && mouseX < x2 + bWidth && mouseY > y2 && mouseY < y2 + bHeight)
    {
      fill(0,255,0,50);
    }
    else 
    {
      fill(0,0,255,0);
    }
    rect(x2,y2,bWidth,bHeight);
    
    //Button Label
    fill(255);
    text("18 HOLES",x2+bWidth-90,y2+70);
    image(flag, x2+bWidth-75,y2+20,gap,gap);
  }
  
  void high_scores()
  {
    int x9=0+70,y9=250,x18=width-220,y18=250,ctr9=0,ctr18=0;
    
    //High Score Tables
    table9 = loadTable("table9.csv", "header");
    table18= loadTable("table18.csv", "header");
    
    textAlign(CENTER);
    fill(255,255,0);
    textSize(75);
    text("HIGH SCORES",width/2,90);
    
    fill(255);
    textSize(45);
    text("PRESS # TO RETURN",width/2,height-50);
    textAlign(LEFT);
    text("9 HOLES",x9-20,y9-60);
    text("18 HOLES",x18-30,y18-60);
    //text("18 HOLES");

    fill(255,255,0);
    textSize(35);
    
    //Display first 5 entries in both tables
    for (TableRow row : table9.rows())
    {
      String name = row.getString("name");
      float time = row.getFloat("time");
      text(name+": "+time,x9,y9);
      y9+=40;
      ctr9++;
      if(ctr9==5)
      {
        break;
      }
    }
    
    for (TableRow row : table18.rows())
    {
      String name = row.getString("name");
      float time = row.getFloat("time");
      text(name+": "+time,x18,y18);
      y18+=40;
      ctr18++;
      if(ctr18==5)
      {
        break;
      }
    }
  }
}

//Button Variables
int x1=100,y1=250,x2=100,y2=400,bWidth=360,bHeight=100;

void mousePressed()
  {
    //User Input via Mouse on difficulty buttons
    //Set Difficulty & Start Game
    if (mouseX > x1 && mouseX < x1 + bWidth && mouseY > y1 && mouseY < y1 + bHeight && state==3)
    {
      difficulty=9;
      state=1;
    }
    if (mouseX > x2 && mouseX < x2 + bWidth && mouseY > y2 && mouseY < y2 + bHeight && state==3)
    {
      difficulty=18;
      state=1;
    }
  }
