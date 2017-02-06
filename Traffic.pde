class Traffic extends Actions
{
  public ScorePoints[] points = new ScorePoints[5];
  PVector location;
  int p = 0;
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
    speed = s;
    points[0] = new ScorePoints(d0x, d0y);
    points[1] = new ScorePoints(d1x, d1y);
    points[2] = new ScorePoints(d2x, d2y);
    points[3] = new ScorePoints(d3x, d3y);
    points[4] = new ScorePoints(d4x, d4y);
    
  }
  
  void draw()
  {
    pushMatrix();
    theta = atan2(velocity.y, velocity.x);
    translate(position.x, position.y);
    rotate(-theta);
    fill(r, g, b);
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
    if(postion.x > 300)
    {
      position.x = position.x + radians(90);
    }
    else
    {
      position.y = position.y - radians(90);
    }
    /*
    location = new PVector(points[p].points.x, points[p].points.y);
    velocity = PVector.sub(location, position);
    velocity.normalize();
    position.add(PVector.mult(velocity, speed * timeDelta));
    
    position.x += velocity.x * timeDelta *speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
    
    x = (int)position.x;
    y = (int)position.y;
    
    if (x == points[p].points.x)
    {
      saveX = true;
    }
    if (y == points[p].points.y)
    {
      saveY = true;
    }
    if (saveX == true && saveY == true)
    {
      if (p == 4)
      {
        p = 0;
      }
      else
      {
        p++;
      }
      saveX = false;
      saveY = false;
    }
    */
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