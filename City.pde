class City extends Actions
{
  City(int x, int y)
  {
    position = new PVector(x, y);
  }
  
  void draw()
  { //<>//
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
   
   fill(#0D7C04);
   rect(position.x, position.y, 300, 130);
   fill(100);
   rect(position.x + 40, position.y + 15, 45, 100);
   rect(position.x - 100, position.y + 15, 45, 100);
   rect(position.x - 40, position.y + 30, 75, 70);
   
   fill(0);
   stroke(0);
   rect(position.x - 70, position.y + 10, 45, 110);
   rect(position.x, position.y, 50, 130);
   rect(position.x + 80, position.y, 40, 130);
   rect(position.x + 120, position.y + 10, 20, 110);
   rect(position.x + 80, position.y + 30,  80, 70);
   
   fill(160);
   for (int i = 0; i<105; i+=6) 
   {
     for (int f = 0; f<40; f+=10) 
     {
       rect(position.x - 85 +f, position.y - 40 +i, 6, 3);
     }
   }
   for (int i = 0; i<125; i+=6) 
   {
    for (int f = 0; f<45; f+=10) {
      rect(position.x - 20 + f, position.y - 60 + i, 6, 3);
    } 
  }
 
  for (int i = 0; i<125; i+=6) {
    for (int f = 0; f<40; f+=10) {
      rect(position.x + 65 +f, position.y - 60 +i, 6, 3);
    }
  }
  
  for (int i = 0; i<100; i+=15) {
    rect(position.x + 120, position.y - 35 +i, 10, 10);
  }
  
 //<>// //<>//
  }
   
  void crash()
  {
    if (taxi.position.x > position.x - 159 && taxi.position.y < position.y + 93 && taxi.position.x < position.x + 159 && taxi.position.y > position.y - 59)
    {
      taxi.working = false;
    }
  }
}