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

    fill(#5D471B);
    rect(position.x, position.y + 23, 325, 150);
    stroke(100);
    fill(80);
    rect(position.x - 11, position.y + 16, 300, 130);
    strokeWeight(2);
    stroke(255);
    fill(#F0D01D);
    rect(position.x, position.y, 300, 100);
    stroke(0);
    strokeWeight(2);
    fill(#2625BF);
    rect(position.x, position.y + 65, 300, 30);
    strokeWeight(0);
    rect(position.x + 1, position.y + 50, 300, 3);
    stroke(150);
    fill(90);
    rect(position.x + 147, position.y + 1, 6, 96);
    stroke(0);
    fill(100);
    rect(position.x, position.y + 100, 324, 1); //<>// //<>//
  }
  
  
  void crash()
  {
    if (taxi.position.x > position.x - 159 && taxi.position.y < position.y + 93 && taxi.position.x < position.x + 159 && taxi.position.y > position.y - 59)
    {
      taxi.working = false;
    }
  }
}