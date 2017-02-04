class City extends Actions
{
  City(int x, int y)
  {
    position = new PVector(x, y);
  }
  
  void draw()
  { //<>//
    //road
    int x = 130;
    int y = 30;
  
    for (int i = 0; i < 16; i ++)
    {
      strokeWeight(2);
      fill(255);
      rect(width/2, 0 + x , 10, 50);
      rect(0 + y, height/2 + 15, 50, 10);
      
      x += 90;
      y += 81;
    }

    stroke(255);
    fill(#F0D01D);
    rect(position.x, position.y, 300, 100);
    stroke(0);
    strokeWeight(2);
    fill(#2625BF);
    rect(position.x, position.y + 65, 300, 30); //<>// //<>//
  }
  
  
  void crash()
  {
    if (taxi.position.x > position.x - 159 && taxi.position.y < position.y + 93 && taxi.position.x < position.x + 159 && taxi.position.y > position.y - 59)
    {
      taxi.working = false;
    }
  }
}