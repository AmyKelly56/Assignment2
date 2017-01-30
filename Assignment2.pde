PFont f1;
ArrayList<Actions> action;

MainMenu menu;
TaxiCar taxi;
City city1;
City city2;
City city3;
City city4;
City city5;
City city6;

int SIZE = 45;


void setup()
{
  fullScreen();
  background(#86E4FF);
  
  f1 = loadFont("SansSerif-48.vlw");
  textFont(f1);
  
   menu = new MainMenu();
  for (int i = 0; i < SIZE; i ++)
  {
    clouds[i] = new Clouds();
  }
  
  //Game Objects 
  action = new ArrayList<Actions>();
  taxi = new TaxiCar();
  city1= new City(width/4, height/4);
  //city2 = new  City( );
  //city3 = new City ();
  //city4 = new City();
  //city5 = new City();
  //city6 = new City();
  
  
  
  action.add(taxi);
  action.add(city1);
  action.add(city2);
  action.add(city3);
  action.add(city4);
  action.add(city5);
  action.add(city6);

  
}
  
void draw()
{
  if (menu.game == false)
  { 
   menu.logo();
   menu.update();
   menu.instrctions();
  }
  
  if (taxi.working == false)
  {
    action.remove(taxi);
    action.remove(city1);
    action.remove(city2);
    action.remove(city3);
    action.remove(city4);
    action.remove(city5);
    action.remove(city6);
  }

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

void keyReleased()
{
  if (keyCode == LEFT || key == 'a')
  {
    taxi.left = false;
  }
  if (keyCode == RIGHT || key == 'd')
  {
    taxi.right = false;
  }
}