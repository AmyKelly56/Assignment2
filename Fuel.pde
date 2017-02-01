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
  
}