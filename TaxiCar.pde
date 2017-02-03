class TaxiCar extends Actions
{
  boolean left = false;
  boolean right = false;
  boolean fast = false;
  boolean working = true;
  
  TaxiCar()
  {
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector (width/2, height - 20);
    theta = 0.0f;
  }
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(-theta);
    fill(#FCFC03);
    rect(0, 0, 30, 15);
    fill(0);
    rect(0 + 8, 0 + 8, 10, 3);
    rect(0 - 8, 0 + 8, 10, 3);
    rect(0 - 8, 0 - 8, 10, 3);
    rect(0 + 8, 0 - 8, 10, 3);
    fill(200);
    rect(0, 0, 3, 10);
    popMatrix();
  }
  
  void update()
  {
    if (left == true)
    {
      theta += 0.04;
    }
    if (right == true)
    {
      theta -= 0.04;
    }
    
    velocity.x = cos(-theta);
    velocity.y = sin(-theta);
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
  }
  
  void checkSides()
  {
    if (position.y > height)
    {
      position.y = 110;
    }
    if (position.y < 110)
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