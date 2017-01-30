class Actions
{
  PVector position;
  PVector velocity;
  PVector force;
  Boolean crash = false;
  float look;
  float theta;
  float mass;
  float speed = 100;
  float timeDelta = 1.0f / 60.0f;   
  
  void draw()
  {
    
  }
  
  void reFuel()
  {
    
  }
  
  void update()
  {
  }
  
  void crash()
  {
    
  }
  
  void randomise()
  {
    position.x = (random(4, 994));
    position.y = (random(4, 560));
    if (((position.y < 100) || position.x > city1.position.x- 168 
          && position.y < city1.position.y +100 
          && position.x < city1.position.x + 168 
          && position.y > city1.position.y - 68) || (position.x > city2.position.x- 168 
          && position.y < city2.position.y +100 
          && position.x < city2.position.x + 168 
          && position.y > city2.position.y - 68) || (position.x > city3.position.x- 168 
          && position.y < city3.position.y +100 
          && position.x < city3.position.x + 168 
          && position.y > city3.position.y - 68) ||(position.x > city4.position.x- 168 
          && position.y < city4.position.y +100 
          && position.x < city4.position.x + 168 
          && position.y > city4.position.y - 68))
    {
       randomise(); 
    }     
  }
  
  void checkSides()
  {
    if(position.y > height)
    {
      position.y = 110;
    }
    if(position.y < 110)
    {
      position.y = height;
    }
    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
  }
}