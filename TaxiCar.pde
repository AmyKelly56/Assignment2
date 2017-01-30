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
    fill(#0AF21B);
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
  
}