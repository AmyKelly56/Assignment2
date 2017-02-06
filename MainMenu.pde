class MainMenu
{
  TaxiCar tc = new TaxiCar();
  Customer c = new Customer();
  Destination d = new Destination();
  ReFuel f = new ReFuel();

  boolean game = false;
  float y = 3.0;

  void logo()
  {
    fill(40);
    textFont(f1);
    textSize(80);
    text("Taxi Pick Up", width/2- 250, y);
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
      textFont(f2);
      textSize(30);
      fill(0);
      text("Use Arrow Keys or A, W, S, D To Move The Taxi", width/2 - 290, height/2 - 100);
      text("Press Up Arrow Key To Go Faster And Down To Go Slower", width/2 - 360, height/2 - 50);
      text("Avoid The Buldings and The Other Cars", width/2 - 300, height/2);
      text("You Are The Taxi: ", width/2 - 200, height/2 + 50);
      tc.menuScreen();
      text("Collect The Customer: ", width/2 - 200, height/2 + 100);
      c.menuScreen();
      text("Drop Them To Thier Destination: ", width/2 - 200, height/2 +150);
      d.menuScreen();
      text("Dont Run Out Of Fuel: ", width/2 - 200, height/2 + 200);
      f.menuScreen();
      text("Press Space To Begin", width/2 - 130, height/2 + 270);
    }
  }
}