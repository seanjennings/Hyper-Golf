class Course
{
  PVector[][] a = new PVector[rows][cols];//2d array of course cell co-ords
  int[][] col = new int[rows][cols];//2d array of course cell types
  PVector cords;//single set of player co-ords
  
  //Set 2d array above screen initially
  Course()
  {
    for (int i = 0; i < rows; i++)
    {
      for (int j = 0; j < cols; j++)
      {
        a[i][j] = new PVector((j*gap),(i*gap)-gap*rows);
      }
      cellColourSet(i);
    }
  }
  
  //Show Course
  void display()
  {
    for (int i = 0; i < rows; i++)
    {
      for (int j = 0; j < cols; j++)
      {
        /*
        --Choose image based on num
        0:Blank
        1:Tree
        2:Flag
        3:Saw
        */
        switch(col[i][j])
        {
          case 1:
          {
            image(tree, a[i][j].x,a[i][j].y,gap,gap);
            break;
          }
          case 2:
          {
            image(flag, a[i][j].x,a[i][j].y,gap,gap);
            break;
          }
          case 3:
          {
            image(saw, a[i][j].x,a[i][j].y,gap,gap);
            break;
          }
          default:
          {
            break;
          }
        }
        
        /*Test if row is off screen, if so, reset to top, if not, increment y*/
        if(a[i][j].y>height)
        {
          a[i][j] = new PVector((j*gap),(i*gap)-gap*rows);
          (a[i][j].y)=-gap+(speed*2);
          cellColourSet(i);
        }
        else
        {
          (a[i][j].y)+=speed;
        }
      }
    }
  }
  
  //Set cell contents and their frequency
  void cellColourSet(int i)
  {
    /*Clear row*/
    for(int j=0;j<cols;j++)
    {
      col[i][j]=0;
    }
    /*Set obstacle for row*/
    int choice;
    choice=int(random(0,cols));
    if(int(random(0,5))!=1)
    {
      col[i][choice]=1;
    }
    else if(int(random(0,10))==1)
    {
      col[i][choice]=3;
    }
    else
    {
      col[i][choice]=2;
    }
  }
  
  /*
  Hit Detection between Player & Course
  
  --Iterate through 2d PVector array and check if player has a certain cell
  --If cell is not blank complete relevant operations
  
  ~Tree &  0 Saws: Remove 1 life.
  ~Tree & >0 Saws: Remove 1 saw.
  
  ~Flag: Add 1 point.
  
  ~Saw: Add 3 saw uses.
  */
  
  //Detect hits by comparing a cells xy with the player's
  void hit_detect()
  {
    for (int i = 0; i < rows; i++)
    {
      for (int j = 0; j < cols; j++)
      {
        if((myPlayer.x>a[i][j].x || myPlayer.x+gap-20>a[i][j].x) && myPlayer.x<a[i][j].x+gap && (myPlayer.y>a[i][j].y || myPlayer.y+gap-20>a[i][j].y) && myPlayer.y<a[i][j].y+gap)
        {
          //operations based on the type of cell
          if(col[i][j]==1)//Tree
          {
            if(saws==0)
            {
              col[i][j]=0;
              lives--;
            }
            else
            {
              col[i][j]=0;
              saws--;
            }
          }
          if(col[i][j]==2)//Flag
          {
            col[i][j]=0;
            score++;
          }
          if(col[i][j]==3)//Saw
          {
            col[i][j]=0;
            saws+=3;
          }
        }
      }
    }
  }
  
  /*Display for Score & Lives*/
  void score_lives()
  {
    PFont mono;
    mono = createFont("prstart.ttf",24);//createFont("Georgia", 32);
    textFont(mono);
    textAlign(LEFT);
    
    fill(255,0,0);
    //println("Lives: "+lives);
    text("Lives: "+lives, 10, 40);
    fill(0,255,0);
    //println("Score: "+score);
    text("Score: "+score, 10, 80);
    fill(0,255,255);
    //println("Saws: "+saws);
    text("Saws: "+saws, 10, 120);
    
    //Detect End Game and move to end screen
    if(lives==0 || score==difficulty)
    {
      state=2;
    }
  }
}
