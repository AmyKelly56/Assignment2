PFont f1;

MainMenu menu;

int SIZE = 45;

Clouds clouds[] = new Clouds[SIZE];

void setup()
{
  fullScreen();
  background(#86E4FF);
  
  f1 = loadFont("Herculanum-48.vlw");
  textFont(f1);
  
   menu = new MainMenu();
  for (int i = 0; i < SIZE; i ++)
  {
    clouds[i] = new Clouds();
  }
  
}
  
void draw()
{
  if (menu.game == false)
  {
    for (int i = 0; i < SIZE; i++)
    {
      clouds[i].draw();
      clouds[i].update();
      clouds[i].checkSides();
    }
    
    menu.logo();
    menu.update();
    menu.instrctions();
  }
  
  //header.expandHeader();
  //textSize(40);
  //fill(32);
  
}

void keyPressed()
{
  if (key == ' ')
  {
    if (menu.game == false)
    {
      menu.game = true;
    }
  }
  
  if (keyCode == LEFT || key == 'a')
  {
    taxi.left = true;
  }
  if (keyCode == RIGHT || key == 'd')
  {
    taxi.right = true;
  }
  
  if (keyCode == UP || key == 'w')
  {
    if (taxi.fast == true)
    {
      taxi.speed *= 2;
    }
    else
    {
      taxi.speed *= 2.5;
      taxi.fast = true;
    }
  }
  if (keyCode == DOWN || key == 's')
  {
    if (taxi.fast == false)
    {
      taxi.speed *= 2;
    }
    else
    {
      taxi.speed = 100;
      taxi.fast = false;
    }
  }
}
}