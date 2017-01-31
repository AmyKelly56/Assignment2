class Destination extends Customer
{
  Destination()
  {
    position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    strokeWeight(0);
    fill(#E82507);
    ellipse(position.x, position.y, 50, 50);
    strokeWeight(1);
  }
  