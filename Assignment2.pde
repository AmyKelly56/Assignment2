PFont f1;
ArrayList<Actions> action;

MainMenu menu;
TaxiCar taxi;
City city1;
City city2;
City city3;
City city4;
/*Traffic car1;
Traffic car2;
Traffic car3;
Traffic car4; 
Traffic car5;
Traffic car6;
Traffic car7;
Traffic car8;
Traffic car9; 
Traffic car10;
*/
int SIZE = 45;


void setup()
{
  background(#86E4FF);
  
  f1 = loadFont("SansSerif-48.vlw");
  textFont(f1);
  
   menu = new MainMenu();
  
  //Game Objects 
  action = new ArrayList<Actions>();
  
  taxi = new TaxiCar();
 
  city1= new City(width/4, height/4);
  city2 = new  City(width - width/4 - 15, height - height/4 - 30);
  city3 = new City(width/4 + 5, height - height/4 - 30);
  city4 = new City(width - width/4 - 15, height/4 + 70);
  
  /*car1 = new Traffic();
  car2 = new Traffic();
  car3 = new Traffic();
  car4 = new Traffic();
  car5 = new Traffic();
  car6 = new Traffic();
  car7 = new Traffic();
  car8 = new Traffic();
  car9 = new Traffic();
  car10 = new Traffic();
  */

  
  action.add(taxi);
  action.add(city1);
  action.add(city2);
  action.add(city3);
  action.add(city4);
  /*action.add(car1);
  action.add(car2);
  action.add(car3);
  action.add(car4);
  action.add(car5);
  action.add(car6);
  action.add(car7);
  action.add(car8);
  action.add(car9);
  action.add(car10);
  */
}

  
void draw()
{
  if (menu.game == false)
  { 
   menu.logo();
   menu.instrctions();
  }
  
  for (Actions a : action)
  {
    a.draw();
    a.update();
    a.checkSides();
  }
    
  if (taxi.working == false)
  {
    action.remove(taxi);
    action.remove(city1);
    action.remove(city2);
    action.remove(city3);
    action.remove(city4);
  }
}
 
void keyPressed()
{
  if (key == 'b')
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