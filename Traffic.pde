class Traffic extends Actions
{
  float x, y;
  color c;
  float distance; 
  
  boolean saveX = false;
  boolean saveY = false;
  
  Traffic(float x, float y, float theta, color c) 
  {
    this.c = c;
    rectMode(CENTER);
    velocity = new PVector(0, 0);
    position = new PVector(x, y);
    this.theta = theta; 
  }
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(-theta);
    fill(c);
    rect(0, 0, 30, 15);
    fill(0);
    rect(0 + 8, 0 + 8, 10, 3);
    rect(0 - 8, 0 + 8, 10, 3);
    rect(0 - 8, 0 - 8, 10, 3);
    rect(0 + 8, 0 - 8, 10, 3);
    popMatrix();
  }
  
  void update()
  {
    
    if(position.x < 0 || position.x > width || position.y < 0 || position.y > height)
    {
      action.remove(this);
    }
    
    velocity.x = cos(-theta);
    velocity.y = sin(-theta);
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
  }
  
  void crash()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    
    if (distance < 23)
    {
      taxi.working = false;
    }
  } 
}