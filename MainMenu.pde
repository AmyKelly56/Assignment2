class MainMenu
{
  TaxiCar tc = new TaxiCar();
  Customer c = new Customer();
  Destination d = new Destination();
  
  boolean game = false;
  float y = 1.0;
  
  void logo()
  {
    fill(40);
    textFont(f1);
    textSize(66);
    text("Taxi Pick Up", width/2 - 135, y);
    noFill();
  }
  
  void update()
  {
    if (y < 170)
    {
      y += 5.0;
    }
  }
  
  void instrctions()
  {
    if (y > 170)
    {
       textFont(f1);
       textSize(21);
       fill(0);
       text("Use Arrow Keys or A, W, S, D To Move The Taxi", width/2 - 200, height/2 - 100);
       text("Press Up Arrow Key To Go Faster And Down To Go Slower", width/2 - 200, height/2 - 50);
       text("Press Space To Begin", width/2 - 2-0, height/2 + 270);
    }
  }
}