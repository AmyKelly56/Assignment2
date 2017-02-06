class Fuel extends Actions
{
  float fuel = 200;
  float counter = 0;
  String s = "Fuel";
  float r = 0, g = 255, b = 0;
  boolean refuel = false;
  
  Fuel()
  {
    position = new PVector (width/2 + 360, 650);
  }
  
  void draw()
  {
    fill(255);
    textFont(f1);
    textSize(30);
    text(s, width/2 + 480, 35);
    fill(r, g, b);
    rect(position.x + 150, 65, fuel, 30);
    counter++;
    
    if (counter == 10)
    {
      r += 2;
      g -=1;
      fuel--;
      counter = 0;
    }
    if (fuel == 0)
    {
      taxi.working = false;
    }
  }
}