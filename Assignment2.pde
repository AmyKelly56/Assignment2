import ddf.minim.*;
Minim minim;

PFont f1,f2;
ArrayList<Actions> action;
ArrayList<Customer> customer_destination = new ArrayList<Customer>();

MainMenu menu;
TaxiCar taxi;
City city1;
City city2;
City city3;
City city4;
Customer customers;
Destination location;
Fuel fuel;
GameOver gameOver;
ReFuel reFuel;
Score score;
Traffic car1;
Traffic car2;
Traffic car3;
Traffic car4; 
Traffic car5;
Traffic car6;
Traffic car7;
Traffic car8;
Traffic car9; 
Traffic car10;

int SIZE = 45;


void setup()
{
  fullScreen();
  f1 = loadFont("freeversionSketchBlock-Bold-48.vlw");
  f2 = loadFont("orangejuice-48.vlw");
  textFont(f1);
  
  menu = new MainMenu();
  customer_destination = new ArrayList<Customer>();
  customers = new Customer();
  location = new Destination();
  customer_destination.add(customers);
  action = new ArrayList<Actions>();
  taxi = new TaxiCar();
  fuel = new Fuel();
  reFuel = new ReFuel();
  score = new Score(); 
  gameOver = new GameOver();
  city1= new City(width/4, height/4);
  city2 = new  City(width - width/4 - 15, height - height/4 - 30);
  city3 = new City(width/4 + 5, height - height/4 - 30);
  city4 = new City(width - width/4 - 15, height/4 + 70);
  
  car1 = new Traffic(260, 580, 445, 580, 445, 385, 70, 385, 71, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car2 = new Traffic(261, 350, 445, 350, 445, 155, 70, 155, 71, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car3 = new Traffic(661, 350, 555, 350, 555, 149, 931, 150, 931, 350, 25, random(0, 255), random(0, 255), random(0, 255));
  car4 = new Traffic(661, 580, 555, 580, 555, 385, 931, 385, 931, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  car5 = new Traffic(445, 385, 70, 385, 71, 580, 260, 580, 445, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car6 = new Traffic(445, 155, 70, 155, 71, 350, 261, 350, 445, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car7 = new Traffic(555, 149, 931, 150, 931, 350, 661, 350, 555, 350, 25, random(0, 255), random(0, 255), random(0, 255)); 
  car8 = new Traffic(555, 385, 931, 385, 931, 580, 661, 580, 555, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  
 
  action.add(taxi);
  action.add(city1);
  action.add(city2);
  action.add(city3);
  action.add(city4);
  action.add(car1);
  action.add(car2);
  action.add(car3);
  action.add(car4);
  action.add(car5);
  action.add(car6);
  action.add(car7);
  action.add(car8);
  action.add(fuel);
}
 
void draw()
{

  background(#FA5503);
 
  //Game Menu
  if (menu.game == false)
  {
    menu.logo();
    menu.update();
    menu.instrctions();
  }
  else if (menu.game == true)
  {
    //
    if (customers.startGame == true)
    {
      customers.randomise();
      customers.startGame = false;
    }
    
    background(#646362);
    gameOver.draw();
    
    for(Customer c : customer_destination)
    {
      line(0, 95, 1300, 94);
      c.draw();
      c.crash();
      
      if (c.collected == true)
      {
        if (c.customer_destination == true)
        {
          location.randomise();
          customer_destination.add(location);
        }
        else if (c.customer_destination == false)
        {
         customers.randomise();
         customer_destination.add(customers);
         score.addScore();
        }
        customer_destination.remove(c);
        c.collected = false;
        }
     }
     
    for (Actions a : action)
    {
      
      a.draw();
      a.update();
      a.checkSides();
      a.crash();
      a.reFuel();
    }
    
    if (reFuel.remove == true)
    {
      reFuel.remove = false;
      action.remove(reFuel);
    }
    if (reFuel.fuelStation == false)
    {
      if (fuel.fuel < 85)
      {
        reFuel.fuelStation = true;
        
        if (reFuel.fuelStation == true)
        {
          reFuel.randomise();
          action.add(reFuel);
        }
      }
    }
  }
  score.draw();
  
  if (taxi.working == false)
  {
    action.remove(taxi);
    action.remove(city1);
    action.remove(city2);
    action.remove(city3);
    action.remove(city4);
    action.remove(fuel);
    customer_destination.remove(customers);
    customer_destination.remove(location);
    
    action.remove(car1);
    
    gameOver.expandGameOver();
    textSize(40);
    fill(32);
    text("Game Over!\n Your Score: " + score.score, width/2 - 125, height/2 - 160);
    text("Press P to retrun\n to the home screen!", width/2 - 125, height/2);
    
    if (key == 'p')
    {
      setup();
    }  
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