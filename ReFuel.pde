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
    textSize(20);
    text(s, position.x, position.y);
  }

  void crash()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);

    if (distance < 24)
    {
      score.subScore();
      fuel.fuel = 200;
      fuel.r = 0;
      fuel.g = 255;
      fuelStation = false;
      remove = true;
    }
  }

  void menuScreen()
  {
      fill(#ff0000);
    ellipse(width/2 + 130, height/2 + 140, 30, 30);
    fill(255);
    textFont(f1);
    textSize(18);
    text (s, width/2 + 126, height/2 + 145);
  }
}