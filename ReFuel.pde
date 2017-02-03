class ReFuel extends Actions
{
  String s = "Fuel";
  boolean fuelStation = false;
  boolean remove = false;
  float distance;
  
  ReFuel()
  {
    position = new PVector(random(4, 1000), random(4, 600));
  }
  
  void draw()
  {
    fill(#FF0303);
    ellipse(position.x + 4, position.y -5, 30, 30);
    fill(255);
    textFont(f2);
    textSize(18);
    text(s, position.x, position.y);
  }
  
   
}