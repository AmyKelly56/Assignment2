class GameOver
{
  String GameOver = "Taxi Run";
  int x = 0;
  int y = 0;
  
  void draw()
  {
    textFont(f2);
    fill(#00ADFA);
    strokeWeight(2);
    rect(500, y, y + 950, y);
    strokeWeight(1);
    
    textSize(50);
    fill(255);
    text(GameOver, 550, 65);
    textSize(10);
  }
  
  void expandGameOver()
  {
    y += 4;
    
    if (y > 320)
    {
      y = 320;
    }
  }
}
    